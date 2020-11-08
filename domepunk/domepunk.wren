import "domepunk/misc/emoji" for Emoji
import "domepunk/science/statistics" for Statistics
import "domepunk/science/probability" for Probability
import "domepunk/science/percentage" for Percentage
import "domepunk/science/calculation" for Calculation
import "domepunk/science/random" for Prng

import "domepunk/utils/fps" for Fps
import "domepunk/utils/clock" for Clock
import "domepunk/utils/di" for Di

// MARK: - Dome Punk
class Misc {
  static emoji {Emoji}
}

class Science {
  static statistics {Statistics}
  static probability {Probability}
  static percentage {Percentage}
  static calculation {Calculation}
  static random {Prng}
  static vector {Vector}
  static math {Math}
}

class Settings {
  static title {Window.title}
  static title = (value) {
    Window.title = value
  }

  static size(width, height) {
    Window.resize(width, height)
    Canvas.resize(width, height)
  }
}

var ClockShared = Clock.new()
var FpsShared = Fps.new(Science, ClockShared)

class DomePunk {
  static science {Science}
  static misc {Misc}
  static settings {Settings}
  static fps {FpsShared}
  static clock {ClockShared}
  static di {Di}

  static init() {}
  static update() {
    clock.tick()
  }

  static draw(dt) {
    clock.dt = dt
  }
}

var DP = DomePunk
var Dp = DomePunk
