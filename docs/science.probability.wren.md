<!-- file: src/science/probability.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
Sometimes, especially in game development and in statistical applications,
it's very handy to have an easy way of returning a value based on probabilities.
This library is inspired by [Probability.js](https://github.com/fschaefer/Probability.js).

---
## [Class Probability](https://github.com/ninjascl/domepunk/blob/main/src/science/probability.wren#L19)


Defines the main Probability methods.
- Example:
```js
import "./science/probability" for Probability

// abbreviation
import "./science/probability" for Pr
```

## API

### [static prng (len, seed)](https://github.com/ninjascl/domepunk/blob/main/src/science/probability.wren#L29)


This is the core function for generating entropy.
Based on [Mattasher/probability-distributions](https://github.com/Mattasher/probability-distributions/blob/master/index.js#L32).
- Since: 1.0.0
- Signature: `static func prng(len:Num? = 16, seed:Random? = Random.new()) -> Num`
- Parameter len: number divisions of the entropy
- Parameter seed: an instance of Random.new() with a seed to generate entropy
- Returns: A pseduo random number between 0 and 1

### [static seed(value)](https://github.com/ninjascl/domepunk/blob/main/src/science/probability.wren#L57)


The seed is a new instance of `Random.new()`. Here for convenience.
- Since: 1.0.0
- Signature: `static func seed(value: String?) -> Random`
- Parameter value: An _optional_ value used to generate a new instance of `Random.new()`.

### [static complement(probability)](https://github.com/ninjascl/domepunk/blob/main/src/science/probability.wren#L71)


How probable is the event not to happen?.
The complement of an event is the subset of outcomes
in the sample space that are not in the event. A complement is itself an event.
[Brilliant.org](https://brilliant.org/wiki/probability-by-complement/)

- Since: 1.0.0
- Signature: `static func complement(probability:Num) -> Num`
- Returns: The probability of the event not to happen.
- Throws: `Fiber.abort()` if the probability is not a number

### [static cdf(weights)](https://github.com/ninjascl/domepunk/blob/main/src/science/probability.wren#L85)


The cumulative distribution function (CDF) of a
random variable is another method to describe the distribution of random variables.
The advantage of the CDF is that it can be defined for any kind of random
variable (discrete, continuous, and mixed).
- See: [Probability Course](https://www.probabilitycourse.com/chapter3/3_2_1_cdf.php)

### [static choose(options, seed)](https://github.com/ninjascl/domepunk/blob/main/src/science/probability.wren#L143)


Choose a value inside a Map based on probabilities.
Inspired by this [StackOverflow answer](https://stackoverflow.com/a/10281036).
- Example:
```js
var names = {
  30 : "Jason", // 30% chance of Jason
  60 : "Michael", // 60% chance of Michael
  10 : "Fernando" // 10% chance of Fernando
}

var friend = Probability.choose(names) // Michael

// You can use any Wren value
// and it will choose one depending on it's probabilities.
var actions = {
  10: Fn.new {
    // 10% chance critical attack
  },
  30: Fn.new {
    // 30% chance miss
  },
  60: Fn.new {
    // 60% chance success
  }
}

var action = Probability.choose(actions)
action.call()
```
- Since: 1.0.0
- Signature: `static func choose(options:Map, seed:Random? = Random.new()) -> Any`
- Throws: `Fiber.abort()` if the options is not a map or the seed is not instanec of `Random.new()`