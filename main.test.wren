import "dome" for Process

import "domepunk/test/unit" for Runner
import "domepunk/test/test/unit.test" for UnitTests
import "domepunk/test/misc/emoji.test" for EmojiTests
import "domepunk/test/science/statistics.test" for StatisticsTests
import "domepunk/test/science/probability.test" for ProbabilityTests
import "domepunk/test/science/percentage.test" for PercentageTests
import "domepunk/test/science/calculation.test" for CalculationTests
import "domepunk/test/science/random.test" for RandomTests

import "domepunk/test/utils/clock.test" for ClockTests

class Game {
    static init() {
      // Add your tests here

      // MARK: Internal Tests
      Runner.run(UnitTests)
      Runner.run(ClockTests)

      // MARK: Science Tests
      Runner.run(StatisticsTests)
      Runner.run(ProbabilityTests)
      Runner.run(PercentageTests)
      Runner.run(CalculationTests)
      Runner.run(RandomTests)

      // MARK: Misc Tests
      Runner.run(EmojiTests)

      Runner.end {
        Process.exit()
      }
    }
}
