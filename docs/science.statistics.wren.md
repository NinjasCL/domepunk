<!-- file: domepunk/science/statistics.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->

## Statistics

A _Wren_ implementation of descriptive, regression, and inference statistics.
Implemented in literate _Wren_ with no dependencies.
Ported from: [JavaScript Simple Statistics](https://github.com/simple-statistics/simple-statistics).

---
## [Class Statistics](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/statistics.wren#L19)


```js
import "./science/statistics" for Statistics

// Class shorthand is Ss
import "./science/statistics" for Ss
```
- Since: 1.0.0

## API

### [static epsilon](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/statistics.wren#L62)


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

### [static sum(values)](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/statistics.wren#L89)


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

### [static sumsi(values)](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/statistics.wren#L150)


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

### [static mean(values)](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/statistics.wren#L194)


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

### [static meansi(values)](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/statistics.wren#L228)


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
