import "domepunk/science/statistics" for Ss

class StatisticsTests {
  static describe {"science/statistics.wren"}
  static all{[
      testThatEpsilonExists,
      testThatSumWorks,
      testThatSumSimpleWorks,
      testThatMeanWorks,
      testThatMeanSimpleWorks
  ]}

  // MARK: - Static Vars
  static testThatEpsilonExists {[
    "Ss.epsilon value exists",
    Fn.new { |assert|
      assert.isNotNull(Ss.epsilon)
    }
  ]}

  // MARK: Test Methods

  // MARK: Sum
  static testThatSumWorks {[
    "Ss.sum()", [
      ["can get the sum from a list of numbers",
      Fn.new{ |assert|
        var sum = Ss.sum([1, 2])
        assert.equal(sum, 3)

        sum = Ss.sum([
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

        sum = Ss.sum([
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
      }],
      ["the sum of no numbers is zero",
        Fn.new{ |assert|
          assert.equal(Ss.sum([]), 0)
      }]
    ]
  ]}

  static testThatSumSimpleWorks {[
    "Ss.sumsi()", [
      ["can get the sum from a list of numbers",
      Fn.new{ |assert|
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
      }],
      ["the sum of no numbers is zero",
        Fn.new{ |assert|
          assert.equal(Ss.sumsi([]), 0)
      }]
    ]
  ]}

  static testThatMeanWorks {[
    "Ss.mean()", [
      ["can get the mean of two numbers",
      Fn.new {|assert|
        assert.equal(Ss.mean([1, 2]), 1.5)
        assert.equal(Ss.mean([0, 2]), 1)
      }],
      ["can get the mean of one number",
      Fn.new {|assert|
        assert.equal(Ss.mean([1]), 1)
        assert.equal(Ss.mean(2), 2)
      }],
      ["an empty list has no average",
      Fn.new{|assert|
      assert.failure {
        Ss.mean([])
      }
      assert.failure {
        Ss.mean(null)
      }
      assert.failure {
        Ss.mean(["a"])
      }
      }]
    ]
  ]}

  static testThatMeanSimpleWorks {[
    "Ss.meansi()", [
      ["can get the mean of two numbers",
      Fn.new {|assert|
        assert.equal(Ss.meansi([1, 2]), 1.5)
        assert.equal(Ss.meansi([0, 2]), 1)
      }],
      ["can get the mean of one number",
      Fn.new {|assert|
        assert.equal(Ss.meansi([1]), 1)
        assert.equal(Ss.meansi(2), 2)
      }],
      ["an empty list has no average",
      Fn.new{|assert|
      assert.failure {
        Ss.meansi([])
      }
      assert.failure {
        Ss.meansi(null)
      }
      assert.failure {
        Ss.meansi(["a"])
      }
      }]
    ]
  ]}
}
