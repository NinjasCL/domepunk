/** doc-disable */
class UnitTests {

  static describe {"test/unit.wren"}

  static all {[
    testThatEqualWorks,
    testThatNotEqualWorks,
    testThatNullWorks,
    testThatNotNullWorks
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
}
