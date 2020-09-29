import "./unit" for Runner
import "./utils/ease.test" for EaseTests
import "./misc/emoji.test" for EmojiTests

class Game {
    static init() {
      // Add your tests here
      Runner.run(EaseTests)
      Runner.run(EmojiTests)

      Runner.end()
    }
}
