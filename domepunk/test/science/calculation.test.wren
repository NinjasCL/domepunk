import "../science/calculation" for Calc

class CalculationTests {
  static describe {"science/calculation.wren"}
  static all {[testThatCalculationLerpWorks]}

  static epsilon {0.001}

  static testThatCalculationLerpWorks {[
    "Calculation.lerp()",
    [
      [
        "should exists",
        Fiber.new {|assert|
          assert.success {
            Calc.lerp(0, 5, 0.2)
          }
        }
      ],
      [
        "should return start",
        Fiber.new {|assert|
          assert.floatEqual(Calc.lerp(0, 5, 0), 0, epsilon)
        }
      ],
      [
        "should return averange",
        Fiber.new {|assert|
          assert.floatEqual(Calc.lerp(0, 5, 0.5), 2.5, epsilon)
        }
      ],
      [
        "should return stop",
        Fiber.new {|assert|
          assert.floatEqual(Calc.lerp(0, 5, 1), 5, epsilon)
        }
      ]
    ]
  ]}
}
