/** doc-name: science.random.wren */

import "random" for Random

/**
A class that helps with pseudo random number generation
*/
class Prng {
  /**
  This is a function for generating entropy.
  Based on [Mattasher/probability-distributions](https://github.com/Mattasher/probability-distributions/blob/master/index.js#L32).
  - Since: 1.0.0
  - Signature: `static func prng(len:Num? = 16, seed:Random? = Random.new()) -> Num`
  - Parameter len: number divisions of the entropy
  - Parameter seed: an instance of Random.new() with a seed to generate entropy
  - Returns: A pseduo random number between 0 and 1
  */
  static prng (len, seed) {
      if (!(len is Num)) {
        len = 16
      }

      if (seed is Null) {
        seed = Random.new()
      }

      var entropy = seed.int(0, Num.largest)
      var result = 0

      for(i in 0..len) {
        result = result + entropy/256.pow(i + 1)
      }

      return Random.new(result).float(0, 1)
  }

  static prng (len) { Prng.prng(len, Random.new()) }
  static prng { Prng.prng(16, Random.new()) }


  static new {Prng.prng}
  static new (value) {Prng.prng(value)}

  /**
  The seed is a new instance of `Random.new()`. Here for convenience.
  - Since: 1.0.0
  - Signature: `static func seed(value: String?) -> Random`
  - Parameter value: An _optional_ value used to generate a new instance of `Random.new()`.
  */
  static seed (value) { Random.new(value) }
  static seed { Random.new() }
}

var Rnd = Prng
var Rand = Prng
