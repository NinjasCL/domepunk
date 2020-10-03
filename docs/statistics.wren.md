<!-- file: src/math/statistics/statistics.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## API

### [static epsilon](https://github.com/ninjascl/domepunk/blob/main/src/math/statistics/statistics.wren#L44)


We use `ε`, epsilon, as a stopping criterion when we want to iterate
until we're "close enough". Epsilon is a very small number: for
simple statistics, that number is **0.0001**

This is used in calculations like the binomialDistribution, in which
the process of finding a value is [iterative](https://en.wikipedia.org/wiki/Iterative_method):
it progresses until it is close enough.

Below is an example of using epsilon in [gradient descent](https://en.wikipedia.org/wiki/Gradient_descent),
where we're trying to find a local minimum of a function's derivative,
given by the `fDerivative` method.

### Example
```js
// From calculation, we expect that the local minimum occurs at x=9/4
var x_old = 0

// The algorithm starts at x=6
var x_new = 6
var stepSize = 0.01

var fDerivative = Fn.new { |x|
  return 4 * x.pow(3) - 9 * x.pow(2)
}

var epsilon = 0.0001

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
