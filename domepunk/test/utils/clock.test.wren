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
        Fiber.new {|assert|
          var clock = Clock.new()
          assert.isKind(clock, Clock)
        }
      ],
      [
        ".tick()",
        Fiber.new {|assert|
          var clock = Clock.new()
          var ticks = clock.ticks
          clock.tick()
          assert.equal(ticks + 1, clock.ticks)
        }
      ],
      [
        "seconds",
        Fiber.new {|assert|
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
        Fiber.new {|assert|
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
        Fiber.new {|assert|
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
        Fiber.new {|assert|
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
