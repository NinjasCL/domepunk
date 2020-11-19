
import "domepunk/patterns/state" for StateMachine, STB

class StateTests {
  static describe {"patterns/state.wren"}
  static all {[
    test
  ]}

  static test {[
    "StateMachine", [
      [
        "single state machine",
        Fn.new {|assert|
        // Create a new state machine
        var water = StateMachine.new({
          "data": {
            "mydata":true
          },
          // Optional
          "ignoreErrors": false,

          "onError": Fn.new {|message, name, transition, machine|

          },

          "init": "solid",
          "transitions": [
            STB.new("melt").from("solid").to("liquid"),
            STB.new("freeze").from("liquid").to("solid"),
            STB.new("vaporize").from("liquid").to("gas"),
            STB.new("condense").from("gas").to("liquid"),
            STB.new("magnetize").from("solid").to("magnet").when {|transition|
              var canBeMagnetized = false
              return canBeMagnetized
            }
          ],

          "methods": {
            "before": {
              "melt": Fn.new {|transition|
              },
              "freeze": Fn.new{|transition|
              }
            },
            "on": {
              "melt": Fn.new{|transition|
              }
            },
            "after": {
              "melt": Fn.new{|transition|
              }
            }
          }
        })

        // Start moving through states
        var solid = "solid"
        var liquid = "liquid"
        var gas = "gas"

        assert.equal(water.isState(solid), true)

        water.do("melt")
        assert.equal(water.isState(liquid), true)

        water.do("vaporize")
        assert.equal(water.isState(gas), true)

        water.do("condense")
        assert.equal(water.isState(liquid), true)

        // Go back to solid
        water.do("freeze")
        assert.equal(water.isState(solid), true)


        // Condense isState only possible from gas to liquid
        // Current state should be solid
        water.do("condense")

        // State should remain solid
        assert.equal(water.isState(solid), true)


        // now should be liquid
        water.do("melt")
        assert.equal(water.isState(liquid), true)


        // And back to solid
        water.reset()
        assert.equal(water.isState(solid), true)


        // ThisState state isState not possible
        // since when condition isState not true
        water.do("magnetize")
        assert.equal(water.isState(solid), true)
        assert.equal(water.error is String, true)

        water.reset()

        // This should be ignored
        water.do("invalid")
        assert.equal(water.error is String, true)
        }
      ]
    ]
  ]}
}
