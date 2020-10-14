/** doc-disable */
// This file is inspired on https://github.com/processing/p5.js/blob/1.1.9/src/math/trigonometry.js
class Trigonometry {

  /**
  HALF_PI is a mathematical constant with the value
  1.57079632679489661923. It is half the ratio of the
  circumference of a circle to its diameter. It is useful in
  combination with the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
  @property {Number} HALF_PI
  @final
  @example
  <div><code>
  arc(50, 50, 80, 80, 0, HALF_PI);
  </code></div>
  @alt
  80x80 white quarter-circle with curve toward bottom right of canvas.
 */
  static HALF_PI {Num.pi / 2}

  /**
  PI is a mathematical constant with the value
  3.14159265358979323846. It is the ratio of the circumference
  of a circle to its diameter. It is useful in combination with
  the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
  @property {Number} PI
  @final
  @example
  <div><code>
  arc(50, 50, 80, 80, 0, PI);
  </code></div>
  @alt
  white half-circle with curve toward bottom of canvas.
 */
  static PI { Num.pi }

  /**
  QUARTER_PI is a mathematical constant with the value 0.7853982.
  It is one quarter the ratio of the circumference of a circle to
  its diameter. It is useful in combination with the trigonometric
  functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
  @property {Number} QUARTER_PI
  @final
  @example
  <div><code>
  arc(50, 50, 80, 80, 0, QUARTER_PI);
  </code></div>
  @alt
  white eighth-circle rotated about 40 degrees with curve bottom right canvas.
 */
  static QUARTER_PI { Num.pi / 4 }

  /**
  TWO_PI is a mathematical constant with the value
  6.28318530717958647693. It is twice the ratio of the
  circumference of a circle to its diameter. It is useful in
  combination with the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
  @property {Number} TWO_PI
  @final
  @example
  <div><code>
  arc(50, 50, 80, 80, 0, TWO_PI);
  </code></div>
  @alt
  80x80 white ellipse shape in center of canvas.
 */
  static TWO_PI { Num.pi * 2 }

  /**
  TAU is an alias for TWO_PI, a mathematical constant with the
  value 6.28318530717958647693. It is twice the ratio of the
  circumference of a circle to its diameter. It is useful in
  combination with the trigonometric functions <a href="#/p5/sin">sin()</a> and <a href="#/p5/cos">cos()</a>.
  @property {Number} TAU
  @final
  @example
  <div><code>
  arc(50, 50, 80, 80, 0, TAU);
  </code></div>
  @alt
  80x80 white ellipse shape in center of canvas.
 */
  static TAU { Num.pi * 2 }

  static DEG_TO_RAD { Num.pi / 180.0 }
  static RAD_TO_DEG { 180.0 / Num.pi }
}
