/** doc-disable */
class UnitTests {

  static describe {"test/unit.wren"}

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
    testThatIsNotStringWorks

  ]}

  static testThatFailureWorks {[
    "testThatFailureWorks",
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
    "testThatSuccessWorks",
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
    "testThatEqualWorks",
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
    "testThatNotEqualWorks",
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
    "testThatNullWorks",
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
    "testThatNotNullWorks",
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
    "testThatKindWorks",
    Fiber.new { |assert|
      assert.failure {
        assert.isKind("a", Num)
        assert.isKind(true, String)
      }
    }
  ]}

  static testThatIsNotKindWorks{[
    "testThatIsNotKindWorks",
    Fiber.new { |assert|
      assert.failure {
        assert.isNotKind("a", String)
        assert.isNotKind(true, Bool)
      }
    }
  ]}

  static testThatIsStringWorks{[
    "testThatIsStringWorks",
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
    "testThatIsNotStringWorks",
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
}
