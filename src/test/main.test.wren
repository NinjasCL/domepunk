import "./runner" for Runner
import "./utils/ease.test" for EaseTests

class Game {
    static init() {
      // Add your tests here
      Runner.all([EaseTests])
    }
}
