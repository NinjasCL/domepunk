/** doc-name: test.unit.wren */

/** doc-header
## Unit testing

These are some classes
For doing TDD with Wren and Dome
Used to make assertions about values in test cases.
Loosely inspired on [Assert.hx](https://github.com/massiveinteractive/MassiveUnit/blob/master/domepunk/massive/munit/Assert.hx)
and [Please.wren](https://github.com/EvanHahn/wren-please/blob/master/please.wren)
*/

/**
This is an example test to demostrate the creation of a new test suite.
Is not required to be child of this class. This is just an example.
```js
class ExampleTest {
  /// Required property that stores all the tests to run
  static all {[thatExampleTestWorks]}

  /// Individual test. Can be any name.
  /// Could return a List, List of List or a Single Fiber.

  /// Single Fiber Test
  static thatExampleTestWorks {
    Fn.new {|assert|
      // Run your tests here.
    }
  }

  /// Single Fiber Test with Description
  static testThatEpsilonExists {[
    "epsilon value exists",
    Fn.new { |assert|
      assert.isNotNull(Ss.epsilon)
    }
  ]}

  /// Multi Fiber Test with Description
  static testThatSumWorks {[
    ["can get the sum of two numbers",
    Fn.new{ |assert|
      assert.equal(Ss.sum([1,2]), 3)
    }],
    ["the sum of no numbers is zero",
      Fn.new{ |assert|
        assert.equal(Ss.sum([]), 0)
    }]
  ]}

  /// Multi Fiber Test with Group Description
  static testThatSumWorks2 {[
    "Ss.sum()", [
      ["can get the sum of two numbers",
      Fn.new{ |assert|
        assert.equal(Ss.sum([1,2]), 3)
      }],
      ["the sum of no numbers is zero",
        Fn.new{ |assert|
          assert.equal(Ss.sum([]), 0)
      }]
    ]
  ]}

  /// Optional methods and properties
  /// They can be omited from the test suite
  static describe { "optional description of the test suite" }
  static setup() {}
  static teardown() {}
}
```
*/
class ExampleTest {
  /**
  Optional description of the test suite.
  It defaults to the class name if not provided.
  - Signature: `static var describe:String? = "%(Class)"`
  */
  static describe { "optional description of the test suite" }

  /**
  Required static list of all the test methods that should be
  executed in this test suite.
  - Signature: `static var all:List`
  */
  static all {[thatExampleTestWorks]}

  /**
  Optional method that is called before running the test suite.
  - Signature: `static func setup() -> Void`
  */
  static setup() {}

  /**
  Optional method that is called after running the test suite.
  - Signature: `static func teardown() -> Void`
  */
  static teardown() {}

  /**
  Every test should return at least a `Fn.new{}` object
  to make the test assertions.
  assert object is automatically injected
  by the test runner
  - Signature: `static var thatExampleTestWorks:<Fiber|List>`
  */
  static thatExampleTestWorks {[
    "description of the individual test",
    Fn.new {|assert|}
  ]}
}

/**
  This is a simple test runner. It will execute the test lifecycle
  of _setup_, _execution_ and _teardown_ for each Test Suite.

  ### Example
  ```js
  import "./unit" for Runner
  import "./misc/emoji.test" for EmojiTests

  class Game {
      static init() {
        // Add your tests here
        Runner.run(EmojiTests)
        Runner.end()
      }
  }
  ```
  - Since: 1.0.0
*/
class Runner {
  /**
  It runs all the tests contained in the test Class.
  - Since: 1.0.0
  - Parameter Class: A class which adopts the test suite spec.
  - Signature: `static func run(Class:Class) -> Void`
  - Throws: `Fiber.abort(error)` if test fails.
  */
  static run(Class) {
    Fiber.new { Class.setup() }.try()
    var describe = "%(Class)"
    Fiber.new { describe = Class.describe }.try()
    run(describe, Class.all)
    Fiber.new { Class.teardown() }.try()
  }

  // This is the base runner method
  // TODO: Replace System.print with a proper logger
  static run(describe, tests) {

    System.print("\n🔥 Running Tests for: %(describe)")

    // Calculate total tests
    var total = 0
    tests.each{ |test|
      if(test is List) {
        if (test.count > 1) {
          // Support multi {[["test name", Fiber], ["test name2", Fiber2]]}
          if (test[0] is List) {
            test.each {|inner|
              if ((inner is List) && inner.count > 1) {
                total = total + 1
              }
            }
          } else {
            // Support multi grouped
            // {["test group name", [["test name", Fiber], ["test name2", Fiber2]]]}
            if (test[0] is String && test[1] is List) {
              test[1].each {|inner|
                if ((inner is List) && inner.count > 1) {
                  total = total + 1
                }
              }
            } else {
              // Suport single {["test name", Fiber]}
              total = total + 1
            }
          }
        }
      } else {
        // Support simple {Fiber}
        total = total + 1
      }
    }

    var error = null
    var exec = Fn.new {|test, title, message|
      var out = "✅ " + message
      var color = "\u001b[32m" // green
      var colorReset = "\u001b[0m" // default

      error = Fiber.new { test.call(Assert) }.try()
      if(error) {
        color = "\u001b[31m" // red
        out = "❌ " + message + ": " + error
        //Fiber.abort(message + ": " + error)
      }

      System.print(color + out + colorReset)
    }

    var count = 0
    // Run and inject Assert class to every test
    tests.each{ |test|
      if(test is List) {
        if (test.count > 1) {
          // Support multi {[["test name", Fiber], ["test name2", Fiber2]]}
          if (test[0] is List) {
            test.each {|inner|
              if ((inner is List) && inner.count > 1) {
                count = count + 1
                exec.call(inner[1], inner[0], "(%(count)/%(total)): %(inner[0])")
              }
            }
          } else {
            // Support multi grouped
            // {["test group name", [["test name", Fiber], ["test name2", Fiber2]]]}
            if (test[0] is String && test[1] is List) {
              test[1].each {|inner|
                if ((inner is List) && inner.count > 1) {
                  count = count + 1
                  exec.call(inner[1], inner[0], "(%(count)/%(total)) %(test[0]): %(inner[0])")
                }
              }
            } else {
              // Suport single {["test name", Fiber]}
              count = count + 1
              exec.call(test[1], test[0], "(%(count)/%(total)): %(test[0])")
            }
          }
        }
      } else {
        // Support simple {Fiber}
        count = count + 1
        exec.call(test, "", "(%(count)/%(total)):")
      }
    }

    System.print("🎉 All Tests Completed for: %(describe)")
  }

  /**
  Ends the testing process and optionally executes a end block.
  - Example:
  ```js
    import "dome" for Process
    Runner.end {
      Process.exit()
    }
  ```
  - Since: 1.0.0
  - Signature: `static func end<T:Fiber|Fn>(exit:T?) -> Void`
  - Parameter exit: An optional block that is executed at the end of the process.
  */
  static end(exit) {
    System.print("\n✨ Jobs Done!")
    if (exit) {
      exit.call()
    }
  }

  static end() {
    Runner.end(null)
  }
}

/**
Assertion class provides methods that throws `Fiber.abort` on failure.
```js
import "./test/unit" for Assert
```
- Since: 1.0.0
*/
class Assert {

    // The incremented number of assertions made during the execution of a set of tests.
    static count { 0 }
    static count=(value){}

    // MARK: - Base Assertions

    /**
    Terminates the execution by throwing a Fiber.abort()
    - Since: 1.0.0
    - Signature: `static abort(message:String?) -> Void`
    - Parameter message: The message that will show in the abort.
    - Throws: `Fiber.abort(message)` on assertion error.
    */
    static abort(message) {
      return Fiber.abort(message)
    }

    static abort {
      return Assert.abort("Assert was aborted.")
    }

    /**
    Assert that two variables have the same value
    - Since: 1.0.0
    - Signature: `static func equal(value:Any, expected:Any, message:String?) -> Void`
    - Parameter value: The first variable.
    - Parameter expected: The second variable.
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static equal(value, expected, message) {
        Assert.count = Assert.count + 1
        if (value != expected) {
            return Assert.abort(message)
        }
    }

    static equal(value, expected) {
        return Assert.equal(value, expected, "%(value) is not equal to %(expected)")
    }

    /**
    Assert that two variables have the different values
    - Since: 1.0.0
    - Signature: `static func isNotEqual(value:Any, expected:Any, message:String?) -> Void`
    - Parameter value: The first variable.
    - Parameter expected: The second variable.
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isNotEqual(value, expected, message) {
        Assert.count = Assert.count + 1
        if (value == expected) {
            return Assert.abort(message)
        }
    }

    static isNotEqual(value, expected) {
        return Assert.isNotEqual(value, expected, "%(value) is equal to %(expected)")
    }

    /**
    Assert that two floating point variables have the same value.
    This is needed due to Floating-Point arithmetic.
    Thanks to _@Dr.Henwig_ at _Wren's Discord_ for the help.
    - See: [Floating Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
    - See: [Floating Point Guide](https://floating-point-gui.de/formats/fp/)
    - Since: 1.0.0
    - Signature: `static func nearlyEqual(value:Num, expected:Num, message:String?) -> Void`
    - Parameter value: The first variable.
    - Parameter expected: The second variable.
    - Parameter epsilon: The precision needed to consider values equal. e.g. 0.001
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static nearlyEqual(value, expected, epsilon, message) {
        Assert.count = Assert.count + 1

        // Adapted from https://floating-point-gui.de/errors/comparison/
        var valueAbs = value.abs
        var expectedAbs = expected.abs
        var diff = (value - expected).abs

        // shortcut, handles infinities
        if (value == expected) {
          return true
        }

        // a or b is zero or both are extremely close to it
        // relative error is less meaningful here
        if (valueAbs == 0 || expectedAbs == 0 || (valueAbs + expectedAbs) < Num.smallest) {
          if (diff < (epsilon * Num.smallest)) {
            return true
          }

          return Assert.abort(message)
        }

        // diff / Math.min((absA + absB), Float.MAX_VALUE) < epsilon
        var min = (valueAbs + expectedAbs)
        if (min > Num.largest - 1) {
          min = Num.largest
        }

        if (diff / min < epsilon) {
          return true
        }

        return Assert.abort(message)
    }

    static nearlyEqual(value, expected, epsilon) {
        return Assert.nearlyEqual(value, expected, epsilon, "%(value) is not nearly equal to %(expected)")
    }

    /**
    Assert that two floating point variables have different values.
    This is needed due to Floating-Point arithmetic.
    - See: [Floating Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
    - Since: 1.0.0
    - Signature: `static func isNotNearlyEqual(value:Num, expected:Num, message:String?) -> Void`
    - Parameter value: The first variable.
    - Parameter expected: The second variable.
    - Parameter epsilon: The precision needed to consider values equal. e.g. 0.001
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isNotNearlyEqual(value, expected, epsilon, message) {
        // We check if the nearlyEqual throws error. That means the numbers are not nearly equal.
        var error = Fiber.new {Assert.nearlyEqual(value, expected, epsilon, message)}.try()
        if(error && error is String) {
          return true
        }
        return Assert.abort(message)
    }

    static isNotNearlyEqual(value, expected, epsilon) {
        return Assert.isNotNearlyEqual(value, expected, epsilon, "%(value) is nearly equal to %(expected)")
    }

    /**
    Assert that one variable is above the expected.
    - Since: 1.0.0
    - Signature: `static func above(value:Any, expected:Any, message:String?) -> Void`
    - Parameter value: The first variable.
    - Parameter expected: The second variable.
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static above(value, expected, message) {
        Assert.count = Assert.count + 1
        if (value <= expected) {
            return Assert.abort(message)
        }
    }

    static above(value, expected) {
        return Assert.above(value, expected, "%(value) is below %(expected)")
    }

    /**
    Assert that one variable is below the expected.
    - Since: 1.0.0
    - Signature: `static func below(value:Any, expected:Any, message:String?) -> Void`
    - Parameter value: The first variable.
    - Parameter expected: The second variable.
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static below(value, expected, message) {
        Assert.count = Assert.count + 1
        if (value >= expected) {
            return Assert.abort(message)
        }
    }

    static below(value, expected) {
        return Assert.below(value, expected, "%(value) is above %(expected)")
    }

    // MARK - Type assertions

    /**
    Verifies that the value belongs to a certain kind of class.
    - Since: 1.0.0
    - Signature: `static func isKind(value:Any, Kind:Class, message:String?) -> Void`
    - Parameter value: The value that will be checked.
    - Parameter Kind: The Class that would be checked against the value.
    - Parameter message: Optional parameter with a message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isKind(value, Kind, message) {
        Assert.count = Assert.count + 1
        if (!(value is Kind)) {
          return Fiber.abort(message)
        }
    }

    static isKind(value, Kind) {
        return Assert.isKind(value, Kind, "%(value) is not of type %(Kind)")
    }

    /**
    Verifies that the value not belongs to a certain kind of class.
    - Since: 1.0.0
    - Signature: `static func isNotKind(value:Any, Kind:Class, message:String?) -> Void`
    - Parameter value: The value that will be checked.
    - Parameter Kind: The Class that would be checked against the value.
    - Parameter message: Optional parameter with a message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isNotKind(value, Kind, message) {
        Assert.count = Assert.count + 1
        if (value is Kind) {
          return Fiber.abort(message)
        }
    }

    static isNotKind(value, Kind) {
        return Assert.isNotKind(value, Kind, "%(value) is of type %(Kind)")
    }

    /**
    Assert that a value is null.
    - Since: 1.0.0
    - Signature: `static func isNull(value:Any, message:String?) -> Void`
    - Parameter value: The value that would be checked.
    - Parameter message: Optional message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isNull(value, message) {
        return Assert.equal(value, null, message)
    }

    static isNull(value) {
        return Assert.equal(value, null)
    }

    /**
    Assert that a value is not null.
    - Since: 1.0.0
    - Signature: `static func isNull(value:Any, message:String?) -> Void`
    - Parameter value: The value that would be checked.
    - Parameter message: Optional message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isNotNull(value, message) {
        return Assert.isNotEqual(value, null, message)
    }

    static isNotNull(value) {
        return Assert.isNotEqual(value, null)
    }

    /**
    Asserts that a value is kind of String.
    - Since: 1.0.0
    - Signature: `static func isString(value:Any, message:String?) -> Void`
    - Parameter value: A value to check.
    - Parameter message: Optional message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isString(value, message) {
        return Assert.isKind(value, String, message)
    }

    static isString(value) {
        return Assert.isKind(value, String)
    }

    /**
    Asserts that a value is not kind of String.
    - Since: 1.0.0
    - Signature: `static func isString(value:Any, message:String?) -> Void`
    - Parameter value: A value to check.
    - Parameter message: Optional message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static isNotString(value, message) {
        return Assert.isNotKind(value, String, message)
    }

    static isNotString(value) {
        return Assert.isNotKind(value, String)
    }

    // MARK - Block assertions

    /**
    Assert that a block of code (Fiber or Fn) fails (Throws Fiber.abort()).
    - Since: 1.0.0
    - Signature: `static func fail<T:Fiber|Fn>(block:T, message:String?) -> Void`
    - Parameter value: The value that would be checked.
    - Parameter message: Optional message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static failure(block, message) {
      var error = Fiber.new { block.call() }.try()
      return Assert.isNotNull(error, "%(message) | error: %(error)")
    }

    static failure(block) {
      return Assert.failure(block, "%(block.toString) must throw Fiber.abort()")
    }

    /**
    Assert that a block of code (Fiber or Fn) succeeds (not fails) (Not throws Fiber.abort()).
    - Since: 1.0.0
    - Signature: `static func fail<T:Fiber|Fn>(block:T, message:String?) -> Void`
    - Parameter value: The value that would be checked.
    - Parameter message: Optional message to show on assertion error.
    - Throws: `Fiber.abort()` on assertion error.
    */
    static success(block, message) {
      var error = Fiber.new { block.call() }.try()
      return Assert.isNull(error, "%(message) | error: %(error)")
    }

    static success(block) {
      return Assert.success(block, "%(block.toString) must not throw Fiber.abort()")
    }

    // Uncomment each method when tests are made
    // Based on https://github.com/EvanHahn/wren-please/blob/master/please.wren
    // static checkDeepEqual(a, b) {
    //   if (a == b) {
    //     return true
    //   }

    //   if (a.type != b.type) {
    //     return false
    //   }

    //   var type = a.type
    //   if (type == List) {
    //     if (a.count != b.count) {
    //       return false
    //     }

    //     var iterA = null
    //     var iterB = null
    //     while (iterA = a.iterate(iterA)) {
    //       iterB = b.iterate(iterB)
    //       var aValue = a.iteratorValue(iterA)
    //       var bValue = b.iteratorValue(iterB)
    //       var isEqual = Assert.checkDeepEqual(aValue, bValue)
    //       if (!isEqual) {
    //         return false
    //       }
    //     }

    //     return true
    //   }

    //   if (type == Map) {
    //     if (a.count != b.count) {
    //       return false
    //     }

    //     for (key in a.keys) {
    //       if (!b.containsKey(key)) {
    //         return false
    //       }

    //       var isEqual = Assert.checkDeepEqual(a[key], b[key])
    //       if (!isEqual) {
    //         return false
    //       }
    //     }
    //     return true
    //   }

    //   return false
    // }

    // static deepEqual(a, b) {
    //   return Assert.deepEqual(a, b, "%(a) does not deeply equal %(b)")
    // }

    // static deepEqual(a, b, message) {
    //   Assert.count = Assert.count + 1
    //   if(!Assert.checkDeepEqual(a,b)) {
    //     Assert.abort(message)
    //   }
    // }

    // static notDeepEqual(a, b) {
    //   return Assert.notDeepEqual(a, b, "%(a) deeply equals %(b)")
    // }

    // static notDeepEqual(a, b, message) {
    //   Assert.count = Assert.count + 1
    //   if(Assert.checkDeepEqual(a,b)) {
    //     Assert.abort(message)
    //   }
    // }
    // static fail(block) {
    //   return Assert.fail(block, "%(block.toString) must fail.")
    // }

    // static fail(block, message) {
    //   var fiber = Fiber.new(block)
    //   var error = fiber.try()
    //   return Assert.notEqual(error, Null, message)
    // }

    // static succeed(block) {
    //   return Assert.succeed(block, "%(block.toString) must succeed.")
    // }

    // static succeed(block, message) {
    //   var fiber = Fiber.new(block)
    //   var error = fiber.try()
    //   return Assert.equal(error, Null, message)
    // }

    // static isNan(item) {
    //   return Assert.isNan(item, "%(item) is not NaN")
    // }

    // static isNan(item, message) {
    //   Assert.isNum(item)
    //   Assert.count = Assert.count + 1
    //   if(!item.isNan) {
    //     return Fiber.abort(message)
    //   }
    // }

    // static isNotNan(item) {
    //   return Assert.isNotNan(item, "%(item) is NaN")
    // }

    // static isNotNan(item, message) {
    //   Assert.isNum(item)
    //   Assert.count = Assert.count + 1
    //   if(item.isNan) {
    //     return Fiber.abort(message)
    //   }
    // }
    // static isType(item, Type) {
    //   return Assert.isClass(item, Type)
    // }

    // static isType(item, Type, message) {
    //   return Assert.isClass(item, Type, message)
    // }

    // static isNotType(item, Type) {
    //   return Assert.isNotClass(item, Type)
    // }

    // static isNotType(item, Type, message) {
    //   return Assert.isNotClass(item, Type, message)
    // }

    // static isTrue(item) {
    //     return Assert.isTrue(item, "%(item) must be true")
    // }

    // static isTrue(item, message) {
    //     return Assert.equal(item, true, message)
    // }

    // static isFalse(item) {
    //     return Assert.isFalse(item, "%(item) must be false")
    // }

    // static isFalse(item, message) {
    //     return Assert.equal(item, false, message)
    // }

    // static isBool(item) {
    //     return Assert.isType(item, Bool)
    // }

    // static isBool(item, message) {
    //     return Assert.isType(item, Bool, message)
    // }

    // static isNotBool(item) {
    //     return Assert.isNotType(item, Bool)
    // }

    // static isNotBool(item, message) {
    //     return Assert.isNotType(item, Bool, message)
    // }

    // static isNum(item) {
    //     return Assert.isType(item, Num)
    // }

    // static isNum(item, message) {
    //     return Assert.isType(item, Num, message)
    // }

    // static isNotNum(item) {
    //     return Assert.isNotType(item, Num)
    // }

    // static isNotNum(item, message) {
    //     return Assert.isNotType(item, Num, message)
    // }

    // static isMap(item) {
    //     return Assert.isType(item, Map)
    // }

    // static isMap(item, message) {
    //     return Assert.isType(item, Map, message)
    // }

    // static isNotMap(item) {
    //     return Assert.isNotType(item, Map)
    // }

    // static isNotMap(item, message) {
    //     return Assert.isNotType(item, Map, message)
    // }

    // static isList(item) {
    //     return Assert.isType(item, List)
    // }

    // static isList(item, message) {
    //     return Assert.isType(item, List, message)
    // }

    // static isNotList(item) {
    //     return Assert.isNotType(item, List)
    // }

    // static isNotList(item, message) {
    //     return Assert.isNotType(item, List, message)
    // }

    // static isRange(item) {
    //     return Assert.isType(item, Range)
    // }

    // static isRange(item, message) {
    //     return Assert.isType(item, Range, message)
    // }

    // static isNotRange(item) {
    //     return Assert.isNotType(item, Range)
    // }

    // static isNotRange(item, message) {
    //     return Assert.isNotType(item, Range, message)
    // }

    // static isObject(item) {
    //     return Assert.isType(item, Object)
    // }

    // static isObject(item, message) {
    //     return Assert.isType(item, Object, message)
    // }

    // static isNotObject(item) {
    //     return Assert.isNotType(item, Object)
    // }

    // static isNotObject(item, message) {
    //     return Assert.isNotType(item, Object, message)
    // }

    // static isSequence(item) {
    //     return Assert.isType(item, Sequence)
    // }

    // static isSequence(item, message) {
    //     return Assert.isType(item, Sequence, message)
    // }

    // static isNotSequence(item) {
    //     return Assert.isNotType(item, Sequence)
    // }

    // static isNotSequence(item, message) {
    //     return Assert.isNotType(item, Sequence, message)
    // }

    // static isFiber(item) {
    //     return Assert.isType(item, Fiber)
    // }

    // static isFiber(item, message) {
    //     return Assert.isType(item, Fiber, message)
    // }

    // static isNotFiber(item) {
    //     return Assert.isNotType(item, Fiber)
    // }

    // static isNotFiber(item, message) {
    //     return Assert.isNotType(item, Fiber, message)
    // }

    // static isFn(item) {
    //     return Assert.isType(item, Fn)
    // }

    // static isFn(item, message) {
    //     return Assert.isType(item, Fn, message)
    // }

    // static isNotFn(item) {
    //     return Assert.isNotType(item, Fn)
    // }

    // static isNotFn(item, message) {
    //     return Assert.isNotType(item, Fn, message)
    // }

    // static isSystem(item) {
    //     return Assert.isType(item, System)
    // }

    // static isSystem(item, message) {
    //     return Assert.isType(item, System, message)
    // }

    // static isNotSystem(item) {
    //     return Assert.isNotType(item, System)
    // }

    // static isNotSystem(item, message) {
    //     return Assert.isNotType(item, System, message)
    // }
}
