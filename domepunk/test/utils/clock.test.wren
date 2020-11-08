import "domepunk/utils/clock" for Clock

class ClockTests {
  static describe {"utils/clock.wren"}
  static all {[
    testClock
  ]}

  static testClock {[
    "Clock", [
      [
        ".new()",
        Fn.new {|assert|
          var clock = Clock.new()
          assert.isKind(clock, Clock)
        }
      ],
      [
        ".tick()",
        Fn.new {|assert|
          var clock = Clock.new()
          var ticks = clock.ticks
          clock.tick()
          assert.equal(ticks + 1, clock.ticks)
        }
      ],
      [
        "seconds",
        Fn.new {|assert|
          var clock = Clock.new()

          for (i in 0..clock.unit) {
            clock.tick()
          }

          assert.equal(clock.seconds, 1)

          for (i in 0..clock.unit) {
            clock.tick()
          }

          assert.equal(clock.seconds, 2)
        }
      ],
      [
        "minutes",
        Fn.new {|assert|
          var clock = Clock.new()
          var minute = clock.unit * clock.unit

          for (i in 0..minute) {
            clock.tick()
          }

          assert.equal(clock.minutes, 1)
          for (i in 0..minute) {
            clock.tick()
          }

          assert.equal(clock.minutes, 2)
        }
      ],
      [
        "hours",
        Fn.new {|assert|
          var clock = Clock.new()
          var minute = clock.unit * clock.unit
          var hour = minute * clock.unit

          for (i in 0..hour) {
            clock.tick()
          }

          assert.equal(clock.hours, 1)

          for (i in 0..hour) {
            clock.tick()
          }

          assert.equal(clock.hours, 2)
        }
      ],
      [
        "string",
        Fn.new {|assert|
          var clock = Clock.new()
          assert.equal(clock.toString, "00:00:00")

          for (i in 0..clock.unit) {
            clock.tick()
          }

          assert.equal(clock.toString, "00:00:01")

          var minute = clock.unit * clock.unit
          for (i in 0..minute) {
            clock.tick()
          }

          assert.equal(clock.toString, "00:01:00")

          var hour = minute * clock.unit
          for (i in 0..hour) {
            clock.tick()
          }

          assert.equal(clock.toString, "01:00:00")
        }
      ]
    ]
  ]}

}
