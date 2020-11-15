import "dome" for Process

import "domepunk/test/unit" for Runner
import "domepunk/test/test/unit.test" for UnitTests

import "domepunk/test/science/statistics.test" for StatisticsTests
import "domepunk/test/science/probability.test" for ProbabilityTests
import "domepunk/test/science/percentage.test" for PercentageTests
import "domepunk/test/science/calculation.test" for CalculationTests
import "domepunk/test/science/random.test" for RandomTests

import "domepunk/test/utils/clock.test" for ClockTests
import "domepunk/test/utils/string.test" for StrTests
import "domepunk/test/utils/number.test" for NumberTests

import "domepunk/test/misc/emoji.test" for EmojiTests

import "domepunk/test/graphics/palettes.test" for PalettesTests
import "domepunk/test/graphics/tileset.test" for TilesetTests

class Game {
    static init() {
      // Add your tests here

      // MARK: Internal Tests
      Runner.run(UnitTests)

      // MARK: Science Tests
      Runner.run(StatisticsTests)
      Runner.run(ProbabilityTests)
      Runner.run(PercentageTests)
      Runner.run(CalculationTests)
      Runner.run(RandomTests)

      // MARK: Util Tests
      Runner.run(ClockTests)
      Runner.run(StrTests)
      Runner.run(NumberTests)

      // MARK: Graphics Tests
      Runner.run(PalettesTests)
      Runner.run(TilesetTests)

      // MARK: Misc Tests
      Runner.run(EmojiTests)

      Runner.end {
        Process.exit()
      }
    }
}
