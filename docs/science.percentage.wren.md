<!-- file: src/science/percentage.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Percentage](https://github.com/ninjascl/domepunk/blob/main/src/science/percentage.wren#L11)


A simple class to convert percentages to strings and viceversa.
- Example:
```js
import "./science/percentage" for Percentage
import "./science/percentage" for Pct
```
- Since: 1.0.0

## API

### [static onehundred](https://github.com/ninjascl/domepunk/blob/main/src/science/percentage.wren#L16)


Holds the number one hundred
- Signature: `static var onehundred:Num = 100`

### [static one](https://github.com/ninjascl/domepunk/blob/main/src/science/percentage.wren#L22)


Hodls the number one
- Signature: `static var one:Num = 1.0`

### [static encode(number)](https://github.com/ninjascl/domepunk/blob/main/src/science/percentage.wren#L36)


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

### [static decode(value)](https://github.com/ninjascl/domepunk/blob/main/src/science/percentage.wren#L55)


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
