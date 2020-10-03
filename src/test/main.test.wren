import "./unit" for Runner
import "./test/unit.test" for UnitTests
import "./misc/emoji.test" for EmojiTests

class Game {
    static init() {
      // Add your tests here
      Runner.run(UnitTests)
      Runner.run(EmojiTests)

      Runner.end()
    }
}
