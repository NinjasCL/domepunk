import "../science/statistics" for Ss

class StatisticsTests {
  static describe {"science/statistics.wren"}
  static all{[
      testThatEpsilonExists,
      testThatSumWorks,
      testThatSumSimpleWorks
  ]}

  // MARK: - Static Vars
  static testThatEpsilonExists {[
    "Ss.epsilon value exists",
    Fiber.new { |assert|
      assert.isNotNull(Ss.epsilon)
    }
  ]}

  // MARK: Test Methods

  // MARK: Sum
  static testThatSumWorks {[
    "Ss.sum()", [
      ["can get the sum of two numbers",
      Fiber.new{ |assert|
        assert.equal(Ss.sum([1,2]), 3)
      }],
      ["the sum of no numbers is zero",
        Fiber.new{ |assert|
          assert.equal(Ss.sum([]), 0)
      }]
    ]
  ]}

  static testThatSumSimpleWorks {[
    "Ss.sumsi() can get the sum of a list of numbers",
    Fiber.new{ |assert|

      var sum = Ss.sumsi([1, 2])
      assert.equal(sum, 3)

      sum = Ss.sumsi([
                0.1,
                0.2,
                0.3,
                0.4,
                0.5,
                0.6,
                0.7,
                0.8,
                0.9,
                1.0,
                1.1,
                1.2,
                1.3,
                1.4,
                1.5,
                1.6,
                1.7
      ])

      assert.equal(sum, 15.299999999999999)

      sum = Ss.sumsi([
                0.1,
                0.2,
                0.3,
                0.4,
                0.5,
                0.6,
                0.7,
                0.8,
                0.9,
                1.0,
                1.1,
                1.2,
                1.3,
                1.4,
                1.5,
                1.6,
                1.7
      ])

      assert.equal(sum.round, 15)
    }
  ]}
}
