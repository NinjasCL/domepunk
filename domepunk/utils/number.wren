/** doc-name: utils.number.wren */
/**
Simple number functions.
- Example:
```js
import "domepunk/utils/number" for Number
```
- Since: 1.0.0
*/
class Number {
  toNum {_num}
  toString {_num.toString}

  construct new(number) {
    _num = Num.fromString(number.toString)
    if (!_num) {
      Fiber.abort("%(number) is not a number")
    }
  }

  /**
  Fix decimals of a float number.
  - Since: 1.0.0
  - Signature: fixed(quantity:Num) -> Number
  - Example:
  ```js
  var pi = Number.new(Num.pi).fixed(2).toNum // 3.14

  // Also available as a static method
  Number.fixed(Num.pi, 2) // 3.14
  ```
  - Parameter quantity: Number of decimals to be fix
  - Returns: A Number instance
  */
  fixed(quantity) {

    var string = toString
    var index = string.indexOf(".")

    var int = string[0...index]
    var float = string[index + 1..-1]

    var fixed = float.take(quantity).join()
    var number = int + "." + fixed

    return Number.new(Num.fromString(number))
  }

  static fixed(number, quantity) {
    return Number.new(number).fixed(quantity).toNum
  }
}
