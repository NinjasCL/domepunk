/** doc-name: science.calculation.wren */
/**
Simple calculation functions inspired on
[Processing's p5.js](https://github.com/processing/p5.js/blob/main/src/math/calculation.js).
*/
class Calculation {
  /**
  Linear Interpolation.
  Calculates a number between two numbers at a specific increment.
  The percentage parameter is the percentage to interpolate between the two values where 0.0
  equal to the first point, 0.1 is very near the first point, 0.5 is half-way in between, etc.
  The lerp function is convenient for creating motion along a straight path and for drawing
  dotted lines.
  - Since: 1.0.0
  - Signature: `static func lerp(start:Num, stop:Num, percentage:Num) -> Num`
  - Parameter start: first value.
  - Parameter stop: second value.
  - Parameter percentage: Number between 0.0 and 1.0.
  - Returns: A linear interpolation result.
  - Example:
  ```js
    var c = Calc.lerp(20, 80, 0.2) // c => 32
  ```
  */
  static lerp(start, stop, percentage) {
    return (percentage * (stop - start)) + start
  }
}

var Calc = Calculation
