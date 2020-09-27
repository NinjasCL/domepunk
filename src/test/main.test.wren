import "./unit" for Runner
import "./utils/ease.test" for EaseTests

class Game {
    static init() {
      // Add your tests here
      Runner.run(EaseTests)

      Runner.end()
    }
}
