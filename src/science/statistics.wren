/** doc-name: science.statistics.wren */
/** doc-header

## Statistics

A _Wren_ implementation of descriptive, regression, and inference statistics.
Implemented in literate _Wren_ with no dependencies.
Ported from: [JavaScript Simple Statistics](https://github.com/simple-statistics/simple-statistics).

```js
import "./science/statistics" for Statistica

// Class shorthand is Ss
import "./science/statistics" for Ss
```

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

  #### Example
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
  */
  static epsilon {0.0001}

  /**
  The simple [sum](https://en.wikipedia.org/wiki/Summation) of a list
  is the result of adding all numbers together, starting from zero.

  This runs on `O(n)`, linear time in respect to the list

  #### Example
  ```js
  Ss.sumsi([1, 2, 3]) // => 6
  ```
  - Signature: `static func sumsi(values:List) -> Num`
  - Parameter values: input
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

    var sum = 0
    values.each { |value|
      sum = sum + value
    }
    return sum
  }

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

  #### Example:
  ```js
  Ss.sum([1, 2]) // => 3
  ```
  - Signature: `static func sum(values:List) -> Num`
  - Parameter values: input
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

    // Initializing the sum
    var sum = 0

    // Keeping track of the floating-point error correction
    var correction = 0
    var transition = 0

    values.each{|value|
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
}

// MARK: - Type aliases
// MARK: Variables
var Ss = Statistics
var epsilon = Ss.epsilon
