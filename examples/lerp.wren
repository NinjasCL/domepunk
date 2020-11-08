/* Based on the https://p5js.org/examples/math-linear-interpolation.html example */

import "domepunk/domepunk" for Dp
import "domepunk/science/calculation" for Calc
import "input" for Mouse
import "graphics" for Canvas, Color

/*
Linear Interpolation.

Move the mouse across the screen and the symbol
will follow. Between drawing each frame of the animation,
the ellipse moves part of the distance (0.05) from its current position
toward the cursor using the lerp() function * This is the same as the Easing under
input only with lerp() instead.
*/
class Game {
  static name {"Linear Interpolation Demo"}

  static init() {
    Dp.settings.size(640,360)
    Dp.settings.title = name
    Dp.init()
    __x = 0
    __y = 0
  }

  static update() {
    Dp.update()
    // lerp() calculates a number between two numbers at a specific increment.
    // The percetange parameter is the amount to interpolate between the two values
    // where 0.0 equal to the first point, 0.1 is very near the first point, 0.5
    // is half-way in between, etc.
    // Here we are moving 5% of the way to the mouse location each frame
    __x = Calc.lerp(__x, Mouse.x, 0.05)
    __y = Calc.lerp(__y, Mouse.y, 0.05)
  }

  static draw(dt) {
    Dp.draw(dt)
    Canvas.cls()
    Canvas.circlefill(__x, __y, 30, Color.white)
  }
}

var Lerp = Game
