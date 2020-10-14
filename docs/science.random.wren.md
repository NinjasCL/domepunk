<!-- file: domepunk/science/random.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Prng](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/random.wren#L8)


A class that helps with pseudo random number generation

## API

### [static prng (len, seed)](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/random.wren#L18)


This is a function for generating entropy.
Based on [Mattasher/probability-distributions](https://github.com/Mattasher/probability-distributions/blob/master/index.js#L32).
- Since: 1.0.0
- Signature: `static func prng(len:Num? = 16, seed:Random? = Random.new()) -> Num`
- Parameter len: number divisions of the entropy
- Parameter seed: an instance of Random.new() with a seed to generate entropy
- Returns: A pseduo random number between 0 and 1

### [static seed (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/science/random.wren#L50)


The seed is a new instance of `Random.new()`. Here for convenience.
- Since: 1.0.0
- Signature: `static func seed(value: String?) -> Random`
- Parameter value: An _optional_ value used to generate a new instance of `Random.new()`.
