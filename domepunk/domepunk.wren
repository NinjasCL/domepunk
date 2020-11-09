import "domepunk/misc/emoji" for Emoji
import "domepunk/science/statistics" for Statistics
import "domepunk/science/probability" for Probability
import "domepunk/science/percentage" for Percentage
import "domepunk/science/calculation" for Calculation
import "domepunk/science/random" for Prng

import "domepunk/utils/fps" for Fps
import "domepunk/utils/clock" for Clock
import "domepunk/utils/di" for Di
import "domepunk/utils/string" for Str
import "domepunk/utils/number" for Number

import "dome" for Window
import "graphics" for Canvas

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
}

class Settings {
  static title {Window.title}
  static title = (value) {
    Window.title = value
  }

  static size(width, height, scale) {
    Canvas.resize(width, height)
    Window.resize(width * scale, height * scale)
  }

  static size(width, height) {
    Settings.size(width, height, 1)
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
  static string {Str}
  static number {Number}

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
