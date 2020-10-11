/* Based on the https://processing.org/examples/interpolate.html example */

import "domepunk/dp" for Dp

/*
Linear Interpolation.

Move the mouse across the screen and the symbol
will follow. Between drawing each frame of the animation,
the ellipse moves part of the distance (0.05) from its current position
toward the cursor using the lerp() function * This is the same as the Easing under
input only with lerp() instead.
*/
class Game {
  static init() {
    Dp.settings.resize(640,360)
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
    __x = Dp.science.calculation.lerp(__x, Dp.dome.input.mouse.x, 0.05)
    __y = Dp.science.calculation.lerp(__y, Dp.dome.input.mouse.y, 0.05)
  }

  static draw(dt) {
    Dp.draw(dt)
    Dp.dome.graphics.canvas.cls()
    Dp.dome.graphics.canvas.circlefill(__x, __y, 30, Dp.dome.graphics.color.white)
  }
}

var Lerp = Game
