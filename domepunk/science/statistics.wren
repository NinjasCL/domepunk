/** doc-name: science.statistics.wren */
/** doc-header

## Statistics

A _Wren_ implementation of descriptive, regression, and inference statistics.
Implemented in literate _Wren_ with no dependencies.
Ported from: [JavaScript Simple Statistics](https://github.com/simple-statistics/simple-statistics).
*/
/**
```js
import "./science/statistics" for Statistics

// Class shorthand is Ss
import "./science/statistics" for Ss
```
- Since: 1.0.0
*/
class Statistics {

  // MARK: - Static Properties

  /**
  We use `ε`, epsilon, as a stopping criterion when we want to iterate
  until we're "close enough". Epsilon is a very small number: for
  simple statistics, that number is **0.0001**

  This is used in calculations like the binomialDistribution, in which
  the process of finding a value is [iterative](https://en.wikipedia.org/wiki/Iterative_method):
  it progresses until it is close enough.

  Below is an example of using epsilon in [gradient descent](https://en.wikipedia.org/wiki/Gradient_descent),
  where we're trying to find a local minimum of a function's derivative,
  given by the `fDerivative` method.

  - Example:
  ```js
  // From calculation, we expect that the local minimum occurs at x=9/4
  var x_old = 0

  // The algorithm starts at x=6
  var x_new = 6
  var stepSize = 0.01

  var fDerivative = Fn.new { |x|
    return 4 * x.pow(3) - 9 * x.pow(2)
  }

  // The loop runs until the difference between the previous
  // value and the current value is smaller than epsilon - a rough
  // meaure of 'close enough'
  while ((x_new - x_old).abs > ss.epsilon) {
    x_old = x_new
    x_new = x_old - stepSize * fDerivative.call(x_old)
  }

  // Local minimum occurs at 2.2496600165701
  System.print("Local minimum occurs at %(x_new)")
  ```
  - Since: 1.0.0
  */
  static epsilon {0.0001}

  // MARK: - Summation

  /**
  Our default sum is the [Kahan-Babuska algorithm](https://pdfs.semanticscholar.org/1760/7d467cda1d0277ad272deb2113533131dc09.pdf).
  This method is an improvement over the classical
  [Kahan summation algorithm](https://en.wikipedia.org/wiki/Kahan_summation_algorithm).
  It aims at computing the sum of a list of numbers while correcting for
  floating-point errors. Traditionally, sums are calculated as many
  successive additions, each one with its own floating-point roundoff. These
  losses in precision add up as the number of numbers increases. This alternative
  algorithm is more accurate than the simple way of calculating sums by simple
  addition.

  This runs on `O(n)`, linear time in respect to the List.

  - Example:
  ```js
  Ss.sum([1, 2]) // => 3
  ```
  - Since: 1.0.0
  - Signature: `static func sum(values:List<Num>) -> Num`
  - Parameter values: input
  - Throws: `Fiber.abort()` if the values are not numeric.
  - Returns: sum of all input numbers
  */
  static sum(values) {
    // If is a single number then return the number
    if (values is Num) {
      return values
    }

    // If the List is empty, we needn't bother computing its sum
    if (!(values is List) || values.count == 0) {
        return 0
    }

    if(values.count <= 1) {
      return values[0]
    }

    // Initializing the sum
    var sum = values[0]

    // Keeping track of the floating-point error correction
    var correction = 0
    var transition = 0

    // We already took the first value
    // So we need to sum the rest
    values[1..-1].each{|value|

      if (!(value is Num)) {
        Fiber.abort("%(value) is not a number. All values should be numbers")
      }

      transition = sum + value
      // Here we need to update the correction in a different fashion
      // if the new absolute value is greater than the absolute sum
      if (sum.abs >= value.abs) {
          correction = correction + sum - transition + value
      } else {
          correction = correction + value - transition + sum
      }
      sum = transition
    }

    // Returning the corrected sum
    return sum + correction
  }

  /**
  The simple [sum](https://en.wikipedia.org/wiki/Summation) of a list
  is the result of adding all numbers together, starting from zero.

  This runs on `O(n)`, linear time in respect to the list

  - Example:
  ```js
  Ss.sumsi([1, 2, 3]) // => 6
  ```
  - Since: 1.0.0
  - Signature: `static func sumsi(values:List<Num>) -> Num`
  - Parameter values: input
  - Throws: `Fiber.abort()` if the values are not numeric.
  - Returns: sum of all input numbers
  */
  static sumsi(values) {
    // If is a single number then return the number
    if (values is Num) {
      return values
    }

    // If the List is empty, we needn't bother computing its sum
    if (!(values is List) || values.count == 0) {
        return 0
    }

    if(values.count <= 1) {
      return values[0]
    }

    var sum = values[0]
    values[1..-1].each { |value|
      if (!(value is Num)) {
        Fiber.abort("%(value) is not a number. All values should be numbers")
      }
      sum = sum + value
    }
    return sum
  }

  /**
  The mean, _also known as average_,
  is the sum of all values over the number of values.
  This is a [measure of central tendency](https://en.wikipedia.org/wiki/Central_tendency):
  a method of finding a typical or central value of a set of numbers.

  This runs on `O(n)`, linear time in respect to the array

  - Example:

  ```js
  Ss.mean([1, 2]) // => 1.5
  ```

  - Since: 1.0.0
  - Parameter values: sample of one or more data points
  - Throws: `Fiber.abort()` if the the length of values is less than one
  - Returns: mean
 */
  static mean(values) {
      if (values is Num) {
        return values
      }
      // The mean of no numbers is null
      if (!(values is List) || values.count == 0) {
          return Fiber.abort("`mean` requires at least one data point")
      }

      return Statistics.sum(values) / values.count
  }

  /**
  The mean, _also known as average_,
  is the sum of all values over the number of values.
  This is a [measure of central tendency](https://en.wikipedia.org/wiki/Central_tendency):
  a method of finding a typical or central value of a set of numbers.

  The simple mean uses the successive addition method internally
  to calculate it's result. Errors in floating-point addition are
  not accounted for, so if precision is required, the standard [mean](#static-meanvalues)
  method should be used instead.

  This runs on `O(n)`, linear time in respect to the array
  - Example:
  ```js
  Ss.mean([0, 10]) // => 5
  ````

  - Since: 1.0.0
  - Parameter values: sample of one or more data points
  - Throws: `Fiber.abort()` if the the length of values is less than one
  - Returns: mean
 */
  static meansi(values) {
      if (values is Num) {
        return values
      }
      // The mean of no numbers is null
      if (!(values is List) || values.count == 0) {
          return Fiber.abort("`mean simple` requires at least one data point")
      }
      return Statistics.sumsi(values) / values.count
  }
}

// MARK: - Type aliases
var Ss = Statistics
