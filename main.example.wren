import "./src/dp" for Dp

class Game {
  static init() {
    Dp.init()
  }

  static update() {
    Dp.settings.title = "Hello " + Dp.misc.emoji.random
    Dp.update()
  }

  static draw(dt) {
    Dp.draw(dt)
  }
}
