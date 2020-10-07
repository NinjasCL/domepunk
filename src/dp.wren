import "./src/misc/emoji" for Emoji
import "./src/science/statistics" for Statistics
import "./src/science/probability" for Probability
import "./src/science/percentage" for Percentage
import "./src/utils/fps" for Fps
import "./src/utils/clock" for Clock

import "dome" for Process, Window, Version
import "io" for FileSystem
import "random" for Random
import "audio" for AudioEngine, AudioChannel, AudioState
import "graphics" for Canvas, Color, ImageData, Point, Drawable
import "input" for Keyboard, Mouse, GamePad
import "math" for Math, Vector
import "font" for Font

// MARK: - Dome
class Input {
  keyboard {Keyboard}
  mouse {Mouse}
  gamepad {GamePad}
}

class Audio {
  static engine {AudioEngine}
  static channel {AudioChannel}
  static state {AudioState}
}

class Graphics {
  static canvas {Canvas}
  static color {Color}
  static image {ImageData}
  static point {Point}
  static drawable {Drawable}
}

class Dome {
  static window {Window}
  static process {Process}
  static audio {Audio}
  static io {FileSystem}
  static random {Random}
  static graphics {Graphics}
  static input {Input}
  static font {Font}
  static version {Version}
  static math {Math}
  static vector {Vector}
}

// MARK: - Dome Punk
class Misc {
  static emoji {Emoji}
}

class Science {
  static statistics {Statistics}
  static probability {Probability}
  static percentage {Percentage}
  static math {Math}
  static vector {Vector}
}

class Settings {
  static title {Window.title}
  static title = (value) {
    Window.title = value
  }

  static resize(width, height) {
    Window.resize(width, height)
    Canvas.resize(width, height)
  }
}

var ClockShared = Clock.new()
var FpsShared = Fps.new(Science, ClockShared)

class DomePunk {
  static science {Science}
  static misc {Misc}
  static dome {Dome}
  static settings {Settings}
  static fps {FpsShared}
  static clock {ClockShared}

  static init() {}
  static update() {}
  static draw(dt) {
    clock.tick(dt)
    // System.print(clock)
  }
}

var DP = DomePunk
var Dp = DomePunk
