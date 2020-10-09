import "dome" for Process
import "./unit" for Runner
import "./test/unit.test" for UnitTests
import "./misc/emoji.test" for EmojiTests
import "./science/statistics.test" for StatisticsTests
import "./science/probability.test" for ProbabilityTests
import "./science/percentage.test" for PercentageTests
import "./science/calculation.test" for CalculationTests

import "./utils/clock.test" for ClockTests

class Game {
    static init() {
      // Add your tests here
      Runner.run(UnitTests)
      Runner.run(EmojiTests)
      Runner.run(StatisticsTests)
      Runner.run(ProbabilityTests)
      Runner.run(PercentageTests)
      Runner.run(CalculationTests)

      Runner.run(ClockTests)

      Runner.end {
        Process.exit()
      }
    }
}
