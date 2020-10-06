/** doc-name: science.percentage.wren */
/**
A simple class to convert percentages to strings and viceversa.
- Example:
```js
import "./science/percentage" for Percentage
import "./science/percentage" for Pct
```
- Since: 1.0.0
*/
class Percentage {
  /**
  Creates a new string from a given percentage number.
  - Example:
  ```js
  Percentage.encode(0.5) // => 50%
  ````
  - Since: 1.0.0
  - Signature: `static func encode(number:Num) -> String`
  - Parameter number: A number from 0 to 1 to convert to percentage.
  - Returns: A percentage including `%`.
  - Throws: `Fiber.abort()` if the value is not a number.
  */
  static encode(number) {
    if (!(number is Num)) {
      return Fiber.abort("%(number) must be a number")
    }
    return "%(number * 100)\%"
  }

  /**
  Creates a new number from a given percentage string.
  - Example:
  ```js
  Percentage.decode("50%") // => 0.5
  ````
  - Since: 1.0.0
  - Signature: `static func decode(number:Num) -> String`
  - Parameter value: A string or number to decode.
  - Returns: A number from 0 to 1.
  - Throws: `Fiber.abort()` if the value is not a number or string.
  */
  static decode(value) {
    if (!(value is String)) {
      if (!(value is Num)) {
        return Fiber.abort("%(value) should be a String or Num")
      }
    }
    value = "%(value)".trim("\%").trim()
    return Num.fromString(value) / 100
  }
}

// MARK: - Type aliases
var Pct = Percentage
