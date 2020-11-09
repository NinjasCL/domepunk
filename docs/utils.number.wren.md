<!-- file: domepunk/utils/number.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Number](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/number.wren#L9)


Simple number functions.
```js
import "domepunk/utils/number" for Number
```
- Since: 1.0.0

## API

### [fixed(quantity)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/number.wren#L34)


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
