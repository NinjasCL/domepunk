import "../science/probability" for Pr

class ProbabilityTests {
  static describe {"science/probability.wren"}

  // Config: How many times repeat some tests
  static repeat {1000}
  // Precision to compare float values
  static epsilon {0.001}

  static all{[
      testThatPrngWorks,
      testThatComplementWorks,
      testThatCDFWorks,
      testThatChooseWorks
  ]}

  static testThatPrngWorks {[
    "Probabilities.prng()",
    Fiber.new {|assert|
      for (i in 1..repeat) {
        var lowEntropyRandom = Pr.prng(1)
        var number = lowEntropyRandom * 256
        assert.above(number, -1)
        assert.below(number, 256)
      }

      for(i in 1..repeat) {
        assert.above(Pr.prng, 0)
        assert.below(Pr.prng, 1)
      }
    }
  ]}

  static testThatComplementWorks {[
    "Probabilities.complement()",
    Fiber.new {|assert|
      assert.floatEqual(Pr.complement(0.5), 0.5, epsilon)
      assert.floatEqual(Pr.complement(0.9), 0.1, epsilon)

      assert.failure {
        Pr.complement("1")
      }

      assert.failure {
        Pr.complement(-1)
      }

      assert.failure {
        Pr.complement(2)
      }

      assert.failure {
        Pr.complement(null)
      }

      assert.failure {
        Pr.complement(true)
      }
    }
  ]}

  static testThatCDFWorks {[
    "Probabilities.cdf()",
    Fiber.new {|assert|
      var input = [10, 30, 60]
      var cdf = Pr.cdf(input)
      assert.floatEqual(cdf[0], 0.1, epsilon)
      assert.floatEqual(cdf[1], 0.4, epsilon)
      assert.floatEqual(cdf[2], 1, epsilon)

      input = [70, 20, 10]
      cdf = Pr.cdf(input)
      assert.floatEqual(cdf[0], 0.7, epsilon)
      assert.floatEqual(cdf[1], 0.9, epsilon)
      assert.floatEqual(cdf[2], 1, epsilon)
    }
  ]}

  static testThatChooseWorks {[
    "Probabilities.choose()",
    Fiber.new {|assert|

      assert.failure {
        Pr.choose([])
      }

      assert.failure {
        Pr.choose({"a":[]}, Pr.seed)
      }

      var counter = {
        0: 0,
        1: 0,
        2: 0
      }

      var input = {
        30: Fn.new {
          counter[0] = counter[0] + 1
        },
        10: Fn.new {
          counter[1] = counter[1] + 1
        },
        60: Fn.new {
          counter[2] = counter[2] + 1
        },
      }

      // The seed must be created outside the call loop
      // in order to generate a new random number each call
      // if the seed (Random.new()) is used each time
      // it will always generate the same number because
      // the Random.new() seed is based on System time, and its likely
      // the same time would be returned each call.
      var seed = Pr.seed

      var runs = 100
      for (i in 1..runs) {
        Pr.choose(input, seed).call()
      }

      // 30% chance counter must be above 10% counter
      assert.above(counter[0], counter[1])

      // 60% chance counter must be above 30% counter
      assert.above(counter[2], counter[0])

      // 10% chance counter should be below 30% and 60% chance counter
      assert.below(counter[1], counter[0])
      assert.below(counter[1], counter[2])

      // the sum of all counters should be equal to the number of runs
      assert.equal(counter[0] + counter[1] + counter[2], runs)

      // Debug if needed
      // System.print({30: counter[0], 10: counter[1], 60: counter[2]})

      var names = {
        30 : "Jason",
        60 : "Michael",
        10 : "Fernando"
      }

      var friend = Pr.choose(names) // Michael | Jason | Fernando
      assert.equal((friend == "Jason" || friend == "Michael" || friend == "Fernando"), true)
    }
  ]}
}
