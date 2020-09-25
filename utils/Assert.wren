/* Testing utility class */
class Assert {
    static equal(a, b) {
        Assert.equal(a, b, "%(a) is not equal to %(b)")
    }

    static equal(a, b, message) {
        if(a != b) {
            Fiber.abort(message)
        }
    }

    static true(item) {
        Assert.true(item, "%(item) must be true")
    }

    static true(item, message) {
        Assert.equal(item, true, message)
    }

    static false(item) {
        Assert.true(item, "%(item) must be false")
    }

    static false(item, message) {
        Assert.equal(item, false, message)
    }

    static num(item) {
        Assert.num(item, "%(item) is not of type Num")
    }

    static num(item, message) {
        if(!item is Num) {
            Fiber.abort(message)
        }
    }

    static string(item) {
        Assert.string(item, "%(item) is not of type String")
    }

    static string(item, message) {
        if(!item is String) {
            Fiber.abort(message)
        }
    }

    static map(item) {
        Assert.map(item, "%(item) is not of type List")
    }

    static map(item, message) {
        if(!item is Map) {
            Fiber.abort(message)
        }
    }

    static list(item) {
        Assert.list(item, "%(item) is not of type List")
    }

    static list(item, message) {
        if(!item is List) {
            Fiber.abort(message)
        }
    }

    static bool(item) {
        Assert.bool(item, "%(item) is not of type Bool")
    }

    static bool(item, message) {
        if(!item is Bool) {
            Fiber.abort(message)
        }
    }

    static range(item) {
        Assert.bool(item, "%(item) is not of type Range")
    }

    static range(item, message) {
        if(!item is Range) {
            Fiber.abort(message)
        }
    }

    static null(item) {
        Assert.null(item, "%(item) is not of type Null")
    }

    static null(item, message) {
        if(!item is Null) {
            Fiber.abort(message)
        }
    }
}