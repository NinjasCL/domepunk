/**
 * Used to make assertions about values in test cases.
 * Loosely inspired on https://github.com/massiveinteractive/MassiveUnit/blob/master/src/massive/munit/Assert.hx
 * @author Camilo Castro <camilo@ninjas.cl>
 */
class Assert {

    /**
    * The incremented number of assertions made during the execution of a set of tests.
    */
    static count { 0 }
    static count=(value){}

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
      return Assert.abort(fiber, "fiber.try() must throw Fiber.abort()")
    }

    static abort(fiber, message) {
      var error = fiber.try()
      return Assert.notEqual(error, Null, "%(message) | error: %(error)")
    }

    static notAbort(fiber) {
      return Assert.notAbort(fiber, "fiber.try() must not throw Fiber.abort()")
    }

    static notAbort(fiber, message) {
      var error = fiber.try()
      return Assert.equal(error, Null, "%(message) | error: %(error)")
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
