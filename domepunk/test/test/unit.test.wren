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

    testThatNearlyEqualWorks,
    testThatIsNotNearlyEqualWorks

  ]}

  static testThatFailureWorks {[
    "Assert.failure()",
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
      assert.failure {
        assert.isKind("a", Num)
        assert.isKind(true, String)
      }
    }
  ]}

  static testThatIsNotKindWorks{[
    "Assert.isNotKind()",
    Fn.new { |assert|
      assert.failure {
        assert.isNotKind("a", String)
        assert.isNotKind(true, Bool)
      }
    }
  ]}

  static testThatIsStringWorks{[
    "Assert.isString()",
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
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
    Fn.new { |assert|
      assert.failure {
        assert.below(4, 2)
        assert.below(4, 4)
      }

      assert.success {
        assert.below(2, 4)
      }
    }
  ]}

  static testThatNearlyEqualWorks {[
    "Assert.nearlyEqual()",
    Fn.new {|assert|
      assert.failure {
        assert.nearlyEqual(0.1, 0.2, epsilon)
        assert.nearlyEqual(3.2, 3.1, epsilon)
      }

      assert.success {
        assert.nearlyEqual(1 - 0.9, 0.1, epsilon)
      }
    }
  ]}

  static testThatIsNotNearlyEqualWorks {[
    "Assert.isNotNearlyEqual()",
    Fn.new { |assert|
      assert.success {
        assert.isNotNearlyEqual(0.1, 0.2, epsilon)
        assert.isNotNearlyEqual(3.2, 3.1, epsilon)
      }

      assert.failure {
        assert.isNotNearlyEqual(1 - 0.9, 0.1, epsilon)
      }
    }
  ]}
}
