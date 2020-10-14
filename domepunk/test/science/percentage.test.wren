import "domepunk/science/percentage" for Pct

class PercentageTests {
  static describe {"science/percentage.wren"}

  // precision to equal floats
  static epsilon {0.001}

  static all {[
    testThatEncodeWorks,
    testThatDecodeWorks
  ]}

  static testThatEncodeWorks {[
    "Percentage.encode()",
    Fiber.new {|assert|
      assert.success {
        assert.equal(Pct.encode(0.5), "50\%")
        assert.equal(Pct.encode(-0.1), "-10\%")
      }

      assert.failure {
        Pct.encode("abc")
      }
    }
  ]}

  static testThatDecodeWorks {[
    "Percentage.decode()",
    Fiber.new {|assert|
      assert.success {
        var result = 0
        result = Pct.decode("50\%")
        assert.isNotNull(result)
        assert.floatEqual(result, 0.5, epsilon)

        result = Pct.decode(40)
        assert.isNotNull(result)
        assert.floatEqual(result, 0.4, epsilon)
      }

      assert.failure {
        Pct.decode("abc")
      }
    }
  ]}
}
