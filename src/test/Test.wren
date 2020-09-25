/* 
These are some classes
For doing TDD with Wren and Dome
*/

import "dome" for Process

class Test {
  // Fill the class name
  static name { "Test " }

  // And all the tests
  static thatIsAnExample() {
    return Fn.new() {
      System.print("hello")
    }
  }

  static all {[
    // Test can be a list with a name and function
    ["That is an Example", thatIsAnExample()],
    
    // or a simple function
    thatIsAnExample()
  ]}
}

// Use this for Running Tests
// In Game.init() method
class Runner {
  static run(Class) {
    run(Class.name, Class.all)
  }

  // This is the base runner method
  static run(name, tests) {

    System.print("\n🔥 Running Tests for: %(name)")

    var total = tests.count
    var count = 0

    tests.each{ |test|
      count = count + 1
      if(test is List) {
        System.print("Test (%(count)/%(total)): %(test[0])")
        test[1].call()
      } else {
        System.print("Test (%(count)/%(total))")
        test.call()
      }
    }

    System.print("✅ %(name) Tests Completed")
    Process.exit()
  }
}

// Assertion methods
class Assert {
    static equal(a, b) {
        return Assert.equal(a, b, "%(a) is not equal to %(b)")
    }

    static equal(a, b, message) {
        if(a != b) {
            return Fiber.abort(message)
        }
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

    static num(item) {
        return Assert.num(item, "%(item) is not of type Num")
    }

    static num(item, message) {
        if(!item is Num) {
            return Fiber.abort(message)
        }
    }

    static string(item) {
        return Assert.string(item, "%(item) is not of type String")
    }

    static string(item, message) {
        if(!item is String) {
            return Fiber.abort(message)
        }
    }

    static map(item) {
        return Assert.map(item, "%(item) is not of type List")
    }

    static map(item, message) {
        if(!item is Map) {
            return Fiber.abort(message)
        }
    }

    static list(item) {
        return Assert.list(item, "%(item) is not of type List")
    }

    static list(item, message) {
        if(!item is List) {
            return Fiber.abort(message)
        }
    }

    static bool(item) {
        return Assert.bool(item, "%(item) is not of type Bool")
    }

    static bool(item, message) {
        if(!item is Bool) {
            return Fiber.abort(message)
        }
    }

    static range(item) {
        return Assert.bool(item, "%(item) is not of type Range")
    }

    static range(item, message) {
        if(!item is Range) {
            return Fiber.abort(message)
        }
    }

    static isNull(item) {
        return Assert.isNull(item, "%(item) is not of type Null")
    }

    static isNull(item, message) {
        if(!item is Null) {
            return Fiber.abort(message)
        }
    }
}
