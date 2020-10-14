import "domepunk/science/random" for Prng

class RandomTests {

  static all{[testThatPrngWorks]}

  // Config: How many times repeat some tests
  static repeat {1000}

  static testThatPrngWorks {[
    "Probabilities.prng()",
    Fiber.new {|assert|
      for (i in 1..repeat) {
        var lowEntropyRandom = Prng.prng(1)
        var number = lowEntropyRandom * 256
        assert.above(number, -1)
        assert.below(number, 256)
      }

      for(i in 1..repeat) {
        assert.above(Prng.prng, 0)
        assert.below(Prng.prng, 1)
      }
    }
  ]}
}
