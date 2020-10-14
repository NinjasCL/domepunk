/** doc-name: science.calculation.wren */
/**
Simple calculation functions.
*/
class Calculation {
  /**
  Linear Interpolation.
  Calculates a number between two numbers at a specific increment.
  The percentage parameter is the percentage to interpolate between the two values where 0.0
  equal to the first point, 0.1 is very near the first point, 0.5 is half-way in between, etc.
  The lerp function is convenient for creating motion along a straight path and for drawing
  dotted lines.
  Inspired on [Processing's p5.js](https://github.com/processing/p5.js/blob/main/src/math/calculation.js).

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

  /**
  Returns the next power of two that is equal to or bigger than the specified number.
  Adapted from [Starling](https://raw.githubusercontent.com/Gamua/Starling-Framework/v2.0/starling/src/starling/utils/MathUtil.as).
  - See: [Power of Two](https://en.wikipedia.org/wiki/Power_of_two#Fast_algorithm_to_check_if_a_positive_number_is_a_power_of_two).
  - Since: 1.0.0
  - Signature: `static func nextpow(number:Num) -> Num`
  - Parameter number: The number to calculate the next power of two.
  - Returns: The next power of two that is equal or bigger than the specified number.
  */
  static nextpow(number) {

      if (number is Num && number > 0 && (number & (number - 1)) == 0) {
          return number
      }

      var result = 1
      number = number - 0.000000001 // avoid floating point rounding errors

      while (result < number) {
        result = result << 1
      }

      return result
  }

  /**
  Indicates if two float (Number) values are equal, give or take `epsilon`.
  Adapted from [Starling](https://raw.githubusercontent.com/Gamua/Starling-Framework/v2.0/starling/src/starling/utils/MathUtil.as).
  - Since: 1.0.0
  - Signature: `static func equivalent(a:Num, b:Num, epsilon:Num? = 0.0001) -> Boolean`
  - Parameter a: first number to check.
  - Parameter b: second number to check.
  - Parameter epsilon: Optional value.
  - Returns: true if a and b are equivalent.
  */
  static equivalent(a, b, epsilon) {
      return (a - epsilon < b) && (a + epsilon > b)
  }

  static equivalent(a, b) {
    return Calculation.equivalent(a, b, 0.0001)
  }

  /**
  Returns the larger of the two values.
  Adapted from [Starling](https://raw.githubusercontent.com/Gamua/Starling-Framework/v2.0/starling/src/starling/utils/MathUtil.as).
  - Since: 1.0.0
  - Signature: `static func max(a:Num, b:Num) -> Num`
  - Parameter a: first number to check.
  - Parameter b: second number to check.
  - Returns: if a > b -> a, else b
  */
  static max(a, b) {
      return a > b ? a : b
  }

  /**
  Returns the smaller of the two values.
  Adapted from [Starling](https://raw.githubusercontent.com/Gamua/Starling-Framework/v2.0/starling/src/starling/utils/MathUtil.as).
  - Since: 1.0.0
  - Signature: `static func min(a:Num, b:Num) -> Num`
  - Parameter a: first number to check.
  - Parameter b: second number to check.
  - Returns: if a < b -> a, else b
  */
  static min(a, b) {
      return a < b ? a : b
  }

  /**
  Moves `value` into the range between `min<` and `max`.
  Adapted from [Starling](https://raw.githubusercontent.com/Gamua/Starling-Framework/v2.0/starling/src/starling/utils/MathUtil.as).
  - Since: 1.0.0
  - Signature: `static func clamp(value:Num, min:Num, max:Num) -> Num`
  - Parameter value: The number to check.
  - Parameter min: The minimum value the number could have.
  - Parameter max: The maximum value the number could have.
  - Returns: min if value < min; max if value > max; else value.
  */
  static clamp(value, min, max) {
      return value < min ? min : (value > max ? max : value)
  }
}

var Calc = Calculation
