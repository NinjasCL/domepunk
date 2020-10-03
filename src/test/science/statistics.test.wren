import "../science/statistics" for Ss

class StatisticsTests {
  static describe {"science/statistics.wren"}
  static all{[
      testThatEpsilonExists,
      testThatSumWorks
  ]}

  // MARK: - Static Vars
  static testThatEpsilonExists {[
    "epsilon value exists",
    Fiber.new { |assert|
      assert.isNotNull(Ss.epsilon)
    }
  ]}

  // MARK: Sum
  static testThatSumWorks {[
    ["can get the sum of two numbers",
    Fiber.new{ |assert|
      assert.equal(Ss.sum([1,2]), 3)
    }],
    ["the sum of no numbers is zero",
      Fiber.new{ |assert|
        assert.equal(Ss.sum([]), 0)
    }]
  ]}
}
