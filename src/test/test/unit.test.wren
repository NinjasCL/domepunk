/** doc-disable */
class UnitTests {

  static describe {"test/unit.wren"}

  // The precision to test float values
  static epsilon {0.001}

  static all {[
    testThatFailureWorks,
    testThatSuccessWorks,

    testThatEqualWorks,
    testThatNotEqualWorks,

    testThatNullWorks,
    testThatNotNullWorks,

    testThatKindWorks,
    testThatIsNotKindWorks,

    testThatIsStringWorks,
    testThatIsNotStringWorks,

    testThatAboveWorks,
    testThatBelowWorks,

    testThatFloatEqualWorks,
    testThatIsNotFloatEqualWorks

  ]}

  static testThatFailureWorks {[
    "Assert.failure()",
    Fiber.new { |assert|
      assert.failure {
        assert.success("This is not a fiber or function")
      }

      assert.success {
        assert.failure {
          assert.equal(true, false)
        }
      }
    }
  ]}

  static testThatSuccessWorks {[
    "Assert.success()",
    Fiber.new { |assert|
      assert.success {
        assert.failure("This is not a fiber or function")
      }

      assert.failure {
        assert.success {
          assert.equal(true, false)
        }
      }
    }
  ]}

  static testThatEqualWorks {[
    "Assert.equal()",
    Fiber.new { |assert|
      assert.failure {
        assert.equal(true, false)
        assert.equal(false, "")
        assert.equal(1, 2)
        assert.equal(true, null)
      }
    }
  ]}

  static testThatNotEqualWorks {[
    "Assert.isNotEqual()",
    Fiber.new { |assert|
      assert.failure {
        assert.isNotEqual(true, true)
        assert.isNotEqual("a", "a")
        assert.isNotEqual(1, 1)
        assert.isNotEqual(false, null)
      }
    }
  ]}

  static testThatNullWorks {[
    "Assert.isNull()",
    Fiber.new { |assert|
      assert.failure {
        assert.isNull(true)
        assert.isNull("abc")
        assert.isNull(1)
        assert.isNull(false)
      }
    }
  ]}

  static testThatNotNullWorks {[
    "Assert.isNotNull()",
    Fiber.new { |assert|
      assert.failure {
        assert.isNotNull(null)
      }

      assert.success {
        assert.isNotNull(true)
        assert.isNotNull(false)
        assert.isNotNull("abc")
        assert.isNotNull(1)
        assert.isNotNull([])
        assert.isNotNull({"a":"b"})
      }
    }
  ]}

  static testThatKindWorks{[
    "Assert.isKind()",
    Fiber.new { |assert|
      assert.failure {
        assert.isKind("a", Num)
        assert.isKind(true, String)
      }
    }
  ]}

  static testThatIsNotKindWorks{[
    "Assert.isNotKind()",
    Fiber.new { |assert|
      assert.failure {
        assert.isNotKind("a", String)
        assert.isNotKind(true, Bool)
      }
    }
  ]}

  static testThatIsStringWorks{[
    "Assert.isString()",
    Fiber.new { |assert|
      assert.failure {
        assert.isString(1)
        assert.isString(true)
      }

      assert.success {
        assert.isString("asb")
      }
    }
  ]}

  static testThatIsNotStringWorks{[
    "Assert.isNotString()",
    Fiber.new { |assert|
      assert.failure {
        assert.isNotString("a")
      }

      assert.success {
        assert.isNotString(true)
        assert.isNotString(1)
        assert.isNotString(null)
      }
    }
  ]}

  static testThatAboveWorks {[
    "Assert.above()",
    Fiber.new { |assert|
      assert.failure {
        assert.above(2, 4)
        assert.above(2, 2)
      }

      assert.success {
        assert.above(4, 2)
      }
    }
  ]}

  static testThatBelowWorks {[
    "Assert.below()",
    Fiber.new { |assert|
      assert.failure {
        assert.below(4, 2)
        assert.below(4, 4)
      }

      assert.success {
        assert.below(2, 4)
      }
    }
  ]}

  static testThatFloatEqualWorks {[
    "Assert.floatEqual()",
    Fiber.new {|assert|
      assert.failure {
        assert.floatEqual(0.1, 0.2, epsilon)
        assert.floatEqual(3.2, 3.1, epsilon)
      }

      assert.success {
        assert.floatEqual(1 - 0.9, 0.1, epsilon)
      }
    }
  ]}

  static testThatIsNotFloatEqualWorks {[
    "Assert.isNotFloatEqual()",
    Fiber.new { |assert|
      assert.success {
        assert.isNotFloatEqual(0.1, 0.2, epsilon)
        assert.isNotFloatEqual(3.2, 3.1, epsilon)
      }

      assert.failure {
        assert.isNotFloatEqual(1 - 0.9, 0.1, epsilon)
      }
    }
  ]}
}
