import "random" for Random

/**
Probability
*/
class Probability {
  /**
  This is the core function for generating entropy.
  Based on [Mattasher/probability-distributions](https://github.com/Mattasher/probability-distributions/blob/master/index.js#L32).
  - Since: 1.0.0
  - Signature: `static func prng(len:Num? = 16) -> Num`
  - Parameter len: number divisions of the entropy
  - Returns: A pseduo random number between 0 and 1
  */
  static prng (len) {
      if (!(len is Num)) {
        len = 16
      }

      var entropy = Random.new().float(1, 100000000000)
      var result = 0

      for(i in 0..len) {
        result = result + entropy/256.pow(i + 1)
      }

      return 1 / (result + 1)
  }

  static prng {
    return Probability.prng(16)
  }

  /**
  The complement of an event is the subset of outcomes
  in the sample space that are not in the event. A complement is itself an event.
  How probable is the event not to happen?.
  [Brilliant.org](https://brilliant.org/wiki/probability-by-complement/)

  - Since: 1.0.0
  - Signature: `static func complement(probability:Num) -> Num`
  - Returns: The probability of the event not to happen.
  - Throws: `Fiber.abort()` if the probability is not a number
  */
  static complement(probability) {
    if (!(probability is Num) || probability > 1 || probability < 0) {
      Fiber.abort("Only values between 0 and 1 are allowed")
    }
    return 1 - probability
  }
}

var Pb = Probability
