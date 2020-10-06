import "../science/probabilities" for Pb

class ProbabilitiesTests {
  static describe {"science/probabilities.wren"}

  // Config: How many times repeat some tests
  static repeat {1000}
  // Precision to compare float values
  static epsilon {0.001}

  static all{[
      testThatPrngWorks,
      testThatComplementWorks
  ]}

  static testThatPrngWorks {[
    "Probabilities.prng()",
    Fiber.new {|assert|
      for (i in 1..repeat) {
        var lowEntropyRandom = Pb.prng(1)
        var number = lowEntropyRandom * 256
        assert.above(number, -1)
        assert.below(number, 256)
      }

      for(i in 1..repeat) {
        assert.above(Pb.prng, 0)
        assert.below(Pb.prng, 1)
      }
    }
  ]}

  static testThatComplementWorks {[
    "Probabilities.complement()",
    Fiber.new {|assert|
      assert.floatEqual(Pb.complement(0.5), 0.5, epsilon)
      assert.floatEqual(Pb.complement(0.9), 0.1, epsilon)

      assert.failure {
        Pb.complement("1")
      }

      assert.failure {
        Pb.complement(-1)
      }

      assert.failure {
        Pb.complement(2)
      }

      assert.failure {
        Pb.complement(null)
      }

      assert.failure {
        Pb.complement(true)
      }
    }
  ]}
}
