/** doc-name: unit.wren */

import "dome" for Process

/**
These are some classes
For doing TDD with Wren and Dome
Used to make assertions about values in test cases.
Loosely inspired on [Assert.hx](https://github.com/massiveinteractive/MassiveUnit/blob/master/src/massive/munit/Assert.hx)
and [Please.wren](https://github.com/EvanHahn/wren-please/blob/master/please.wren)
*/
class Assert {

    // The incremented number of assertions made during the execution of a set of tests.
    static count { 0 }
    static count=(value){}

    /**
    Assert that two variables have the same value
    - Signature: `static func equal(a:Any, b:Any) -> Void`
    - Parameter a: The first variable.
    - Parameter b: The second variable.
    - Throws: `Fiber.abort("%(a) is not equal to %(b)")`
    */
    static equal(a, b) {
        return Assert.equal(a, b, "%(a) is not equal to %(b)")
    }

    static equal(a, b, message) {
        Assert.count = Assert.count + 1
        if(a != b) {
            return Fiber.abort(message)
        }
    }

    static notEqual(a, b) {
        return Assert.notEqual(a, b, "%(a) is equal to %(b)")
    }

    static notEqual(a, b, message) {
        Assert.count = Assert.count + 1
        if(a == b) {
            return Fiber.abort(message)
        }
    }

    // Based on https://github.com/EvanHahn/wren-please/blob/master/please.wren
    static checkDeepEqual(a, b) {
      if (a == b) {
        return true
      }

      if (a.type != b.type) {
        return false
      }

      var type = a.type
      if (type == List) {
        if (a.count != b.count) {
          return false
        }

        var iterA = null
        var iterB = null
        while (iterA = a.iterate(iterA)) {
          iterB = b.iterate(iterB)
          var aValue = a.iteratorValue(iterA)
          var bValue = b.iteratorValue(iterB)
          var isEqual = Assert.checkDeepEqual(aValue, bValue)
          if (!isEqual) {
            return false
          }
        }

        return true
      }

      if (type == Map) {
        if (a.count != b.count) {
          return false
        }

        for (key in a.keys) {
          if (!b.containsKey(key)) {
            return false
          }

          var isEqual = Assert.checkDeepEqual(a[key], b[key])
          if (!isEqual) {
            return false
          }
        }
        return true
      }

      return false
    }

    static deepEqual(a, b) {
      return Assert.deepEqual(a, b, "%(a) does not deeply equal %(b)")
    }

    static deepEqual(a, b, message) {
      Assert.count = Assert.count + 1
      if(!Assert.checkDeepEqual(a,b)) {
        Fiber.abort(message)
      }
    }

    static notDeepEqual(a, b) {
      return Assert.notDeepEqual(a, b, "%(a) deeply equals %(b)")
    }

    static notDeepEqual(a, b, message) {
      Assert.count = Assert.count + 1
      if(Assert.checkDeepEqual(a,b)) {
        Fiber.abort(message)
      }
    }

    static isClass(item, Class) {
        return Assert.isClass(item, Class, "%(item) is not of type %(Class)")
    }

    static isClass(item, Class, message) {
        Assert.count = Assert.count + 1
        if(!(item is Class)) {
          return Fiber.abort(message)
        }
    }

    static isNotClass(item, Class) {
        return Assert.isNotClass(item, Class, "%(item) is of type %(Class)")
    }

    static isNotClass(item, Class, message) {
        Assert.count = Assert.count + 1
        if(item is Class) {
          return Fiber.abort(message)
        }
    }

    static isNan(item) {
      return Assert.isNan(item, "%(item) is not NaN")
    }

    static isNan(item, message) {
      Assert.isNum(item)
      Assert.count = Assert.count + 1
      if(!item.isNan) {
        return Fiber.abort(message)
      }
    }

    static isNotNan(item) {
      return Assert.isNotNan(item, "%(item) is NaN")
    }

    static isNotNan(item, message) {
      Assert.isNum(item)
      Assert.count = Assert.count + 1
      if(item.isNan) {
        return Fiber.abort(message)
      }
    }

    static abort(fiber) {
      return Assert.abort(fiber, "%(fiber.toString) must throw Fiber.abort()")
    }

    static abort(fiber, message) {
      var error = fiber.try()
      return Assert.notEqual(error, Null, "%(message) | error: %(error)")
    }

    static notAbort(fiber) {
      return Assert.notAbort(fiber, "%(fiber.toString) must not throw Fiber.abort()")
    }

    static notAbort(fiber, message) {
      var error = fiber.try()
      return Assert.equal(error, Null, "%(message) | error: %(error)")
    }

    static fail(block) {
      return Assert.fail(block, "%(block.toString) must fail.")
    }

    static fail(block, message) {
      var fiber = Fiber.new(block)
      var error = fiber.try()
      return Assert.notEqual(error, Null, message)
    }

    static succeed(block) {
      return Assert.succeed(block, "%(block.toString) must succeed.")
    }

    static succeed(block, message) {
      var fiber = Fiber.new(block)
      var error = fiber.try()
      return Assert.equal(error, Null, message)
    }

    static isType(item, Type) {
      return Assert.isClass(item, Type)
    }

    static isType(item, Type, message) {
      return Assert.isClass(item, Type, message)
    }

    static isNotType(item, Type) {
      return Assert.isNotClass(item, Type)
    }

    static isNotType(item, Type, message) {
      return Assert.isNotClass(item, Type, message)
    }

    static isTrue(item) {
        return Assert.isTrue(item, "%(item) must be true")
    }

    static isTrue(item, message) {
        return Assert.equal(item, true, message)
    }

    static isFalse(item) {
        return Assert.isFalse(item, "%(item) must be false")
    }

    static isFalse(item, message) {
        return Assert.equal(item, false, message)
    }

    static isBool(item) {
        return Assert.isType(item, Bool)
    }

    static isBool(item, message) {
        return Assert.isType(item, Bool, message)
    }

    static isNotBool(item) {
        return Assert.isNotType(item, Bool)
    }

    static isNotBool(item, message) {
        return Assert.isNotType(item, Bool, message)
    }

    static isNull(item) {
        return Assert.isType(item, Null)
    }

    static isNull(item, message) {
        return Assert.isType(item, Null, message)
    }

    static isNotNull(item) {
        return Assert.isNotType(item, Null)
    }

    static isNotNull(item, message) {
        return Assert.isNotType(item, Null, message)
    }

    static isNum(item) {
        return Assert.isType(item, Num)
    }

    static isNum(item, message) {
        return Assert.isType(item, Num, message)
    }

    static isNotNum(item) {
        return Assert.isNotType(item, Num)
    }

    static isNotNum(item, message) {
        return Assert.isNotType(item, Num, message)
    }

    static isString(item) {
        return Assert.isType(item, String)
    }

    static isString(item, message) {
        return Assert.isType(item, String, message)
    }

    static isNotString(item) {
        return Assert.isNotType(item, String)
    }

    static isNotString(item, message) {
        return Assert.isNotType(item, String, message)
    }

    static isMap(item) {
        return Assert.isType(item, Map)
    }

    static isMap(item, message) {
        return Assert.isType(item, Map, message)
    }

    static isNotMap(item) {
        return Assert.isNotType(item, Map)
    }

    static isNotMap(item, message) {
        return Assert.isNotType(item, Map, message)
    }

    static isList(item) {
        return Assert.isType(item, List)
    }

    static isList(item, message) {
        return Assert.isType(item, List, message)
    }

    static isNotList(item) {
        return Assert.isNotType(item, List)
    }

    static isNotList(item, message) {
        return Assert.isNotType(item, List, message)
    }

    static isRange(item) {
        return Assert.isType(item, Range)
    }

    static isRange(item, message) {
        return Assert.isType(item, Range, message)
    }

    static isNotRange(item) {
        return Assert.isNotType(item, Range)
    }

    static isNotRange(item, message) {
        return Assert.isNotType(item, Range, message)
    }

    static isObject(item) {
        return Assert.isType(item, Object)
    }

    static isObject(item, message) {
        return Assert.isType(item, Object, message)
    }

    static isNotObject(item) {
        return Assert.isNotType(item, Object)
    }

    static isNotObject(item, message) {
        return Assert.isNotType(item, Object, message)
    }

    static isSequence(item) {
        return Assert.isType(item, Sequence)
    }

    static isSequence(item, message) {
        return Assert.isType(item, Sequence, message)
    }

    static isNotSequence(item) {
        return Assert.isNotType(item, Sequence)
    }

    static isNotSequence(item, message) {
        return Assert.isNotType(item, Sequence, message)
    }

    static isFiber(item) {
        return Assert.isType(item, Fiber)
    }

    static isFiber(item, message) {
        return Assert.isType(item, Fiber, message)
    }

    static isNotFiber(item) {
        return Assert.isNotType(item, Fiber)
    }

    static isNotFiber(item, message) {
        return Assert.isNotType(item, Fiber, message)
    }

    static isFn(item) {
        return Assert.isType(item, Fn)
    }

    static isFn(item, message) {
        return Assert.isType(item, Fn, message)
    }

    static isNotFn(item) {
        return Assert.isNotType(item, Fn)
    }

    static isNotFn(item, message) {
        return Assert.isNotType(item, Fn, message)
    }

    static isSystem(item) {
        return Assert.isType(item, System)
    }

    static isSystem(item, message) {
        return Assert.isType(item, System, message)
    }

    static isNotSystem(item) {
        return Assert.isNotType(item, System)
    }

    static isNotSystem(item, message) {
        return Assert.isNotType(item, System, message)
    }
}

/**
This is an example test to demostrate the creation of a new test suite.
Is not required to be child of this class. This is just an example.
```js
class ExampleTest {
  static describe { "optional description of the test suite" }
  static all {[thatExampleTestWorks]}
  static setup() {}
  static teardown() {}
  static thatExampleTestWorks {[
    "description of the individual test",
    Fiber.new {|assert|
      // Run your tests here.
    }
  ]}
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
  - Signature: `static var thatExampleTestWorks:List`
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

  /**
  Ends the testing process and quits the engine.
  - Signature: `static func end() -> Void`
  */
  static end() {
    System.print("\n✨ Jobs Done!")
    Process.exit()
  }

  // This is the base runner method
  // TODO: Replace System.print with a proper logger
  static run(describe, tests) {

    System.print("\n🔥 Running Tests for: %(describe)")

    var total = tests.count
    var count = 0
    var error = null

    tests.each{ |test|

      count = count + 1
      System.write("> ")

      // Run and inject Assert class to every test
      if(test is List) {
        System.write("(%(count)/%(total)) %(test[0])")
        error = Fiber.new { test[1].call(Assert) }.try()
      } else {
        System.write("(%(count)/%(total))")
        error = Fiber.new { test.call(Assert) }.try()
      }

      if(error) {
        System.print("\t❌")
        Fiber.abort(error)
      } else {
        System.print("\t✅")
      }
    }

    System.print("🎉 All Tests Completed for: %(name)")
  }
}
