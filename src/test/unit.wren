/** doc-name: test.unit.wren */

/** doc-header
## Unit testing

These are some classes
For doing TDD with Wren and Dome
Used to make assertions about values in test cases.
Loosely inspired on [Assert.hx](https://github.com/massiveinteractive/MassiveUnit/blob/master/src/massive/munit/Assert.hx)
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
    Fiber.new {|assert|
      // Run your tests here.
    }
  }

  /// Single Fiber Test with Description
  static testThatEpsilonExists {[
    "epsilon value exists",
    Fiber.new { |assert|
      assert.isNotNull(Ss.epsilon)
    }
  ]}

  /// Multi Fiber Test with Description
  static testThatSumWorks {[
    ["can get the sum of two numbers",
    Fiber.new{ |assert|
      assert.equal(Ss.sum([1,2]), 3)
    }],
    ["the sum of no numbers is zero",
      Fiber.new{ |assert|
        assert.equal(Ss.sum([]), 0)
    }]
  ]}

  /// Multi Fiber Test with Group Description
  static testThatSumWorks2 {[
    "Ss.sum()", [
      ["can get the sum of two numbers",
      Fiber.new{ |assert|
        assert.equal(Ss.sum([1,2]), 3)
      }],
      ["the sum of no numbers is zero",
        Fiber.new{ |assert|
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
  Every test should return at least a `Fiber.new{}` object
  to make the test assertions.
  assert object is automatically injected
  by the test runner
  - Signature: `static var thatExampleTestWorks:<Fiber|List>`
  */
  static thatExampleTestWorks {[
    "description of the individual test",
    Fiber.new {|assert|}
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
*/
class Runner {
  /**
  It runs all the tests contained in the test Class.
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
    tests.each { |test|
      if (test is List) {
        if (test.count > 0 && test[0] is List) {
          test.each {
            total = total + 1
          }
        } else {
          total = total + 1
        }
      } else {
        total = total + 1
      }
    }

    var error = null
    var exec = Fn.new {|test, message|
      System.write("> " + message)
      error = Fiber.new { test.call(Assert) }.try()
      if(error) {
        System.print("\t❌")
        Fiber.abort(error)
      } else {
        System.print("\t✅")
      }
    }

    var count = 0
    // Run and inject Assert class to every test
    tests.each{ |test|
      if(test is List) {
        // Support multi {[["test name", Fiber], ["test name2", Fiber2]]}
        if (test.count > 0 && test[0] is List) {
          test.each {|inner|
            count = count + 1
            exec.call(inner[1], "(%(count)/%(total)) %(inner[0])")
          }
        } else {
          // Support multi {["test group name", [["test name", Fiber], ["test name2", Fiber2]]]}
          if (test[0] is String && test[1] is List) {
            test[1].each {|inner|
              count = count + 1
              exec.call(inner[1], "(%(count)/%(total)) %(test[0]) %(inner[0])")
            }
          } else {
            // Suport single {["test name", Fiber]}
            count = count + 1
            exec.call(test[1], "(%(count)/%(total)) %(test[0])")
          }
        }
      } else {
        // Support simple {Fiber}
        count = count + 1
        exec.call(test, "(%(count)/%(total))")
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
*/
class Assert {

    // The incremented number of assertions made during the execution of a set of tests.
    static count { 0 }
    static count=(value){}

    // MARK: - Base Assertions

    /**
    Terminates the execution by throwing a Fiber.abort()
    - Signature: `static abort(message:String)`
    - Parameter message: The message that will show in the abort.
    - Throws: `Fiber.abort(message)` on assertion error.
    */
    static abort(message) {
      return Fiber.abort(message)
    }

    /**
    Assert that two variables have the same value
    - Signature: `static func equal(a:Any, b:Any, message:String?) -> Void`
    - Parameter a: The first variable.
    - Parameter b: The second variable.
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort("%(a) is not equal to %(b)")` on assertion error.
    */
    static equal(a, b, message) {
        Assert.count = Assert.count + 1
        if (a != b) {
            return Assert.abort(message)
        }
    }

    static equal(a, b) {
        return Assert.equal(a, b, "%(a) is not equal to %(b)")
    }

    /**
    Assert that two variables have the different values
    - Signature: `static func notEqual(a:Any, b:Any, message:String?) -> Void`
    - Parameter a: The first variable.
    - Parameter b: The second variable.
    - Parameter message: Optional mesage to show on assertion error.
    - Throws: `Fiber.abort("%(a) is equal to %(b)")` on assertion error.
    */
    static isNotEqual(a, b, message) {
        Assert.count = Assert.count + 1
        if (a == b) {
            return Assert.abort(message)
        }
    }

    static isNotEqual(a, b) {
        return Assert.isNotEqual(a, b, "%(a) is equal to %(b)")
    }

    // MARK - Type assertions

    /**
    Verifies that the value belongs to a certain kind of class.
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
