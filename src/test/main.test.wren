import "dome" for Process
import "./unit" for Runner
import "./test/unit.test" for UnitTests
import "./misc/emoji.test" for EmojiTests
import "./science/statistics.test" for StatisticsTests
import "./science/probabilities.test" for ProbabilitiesTests
import "./science/percentage.test" for PercentageTests

class Game {
    static init() {
      // Add your tests here
      Runner.run(UnitTests)
      Runner.run(EmojiTests)
      Runner.run(StatisticsTests)
      Runner.run(ProbabilitiesTests)
      Runner.run(PercentageTests)

      Runner.end {
        Process.exit()
      }
    }
}
