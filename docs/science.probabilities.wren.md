<!-- file: src/science/probabilities.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Probability](https://github.com/ninjascl/domepunk/blob/main/src/science/probabilities.wren#L6)


Probability

## API

### [static prng (len)](https://github.com/ninjascl/domepunk/blob/main/src/science/probabilities.wren#L15)


This is the core function for generating entropy.
Based on [Mattasher/probability-distributions](https://github.com/Mattasher/probability-distributions/blob/master/index.js#L32).
- Since: 1.0.0
- Signature: `static func prng(len:Num? = 16) -> Num`
- Parameter len: number divisions of the entropy
- Returns: A pseduo random number between 0 and 1

### [static complement(probability)](https://github.com/ninjascl/domepunk/blob/main/src/science/probabilities.wren#L45)


How probable is the event not to happen?.
The complement of an event is the subset of outcomes
in the sample space that are not in the event. A complement is itself an event.
[Brilliant.org](https://brilliant.org/wiki/probability-by-complement/)

- Since: 1.0.0
- Signature: `static func complement(probability:Num) -> Num`
- Returns: The probability of the event not to happen.
- Throws: `Fiber.abort()` if the probability is not a number
