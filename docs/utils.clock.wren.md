<!-- file: domepunk/utils/clock.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Clock](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L11)


A simple Clock that counts ticks, seconds, minutes and hours.
Use this in conjunction with the _static update()_ and _static draw(dt)_ of your _DOME_ Game class.
- Example:
```js
import "domepunk/utils/clock" for Clock
```
- Since: 1.0.0

## API

### [construct new()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L21)


Initializes a new clock object.
- Signature: `constructor new() -> Clock`
- Since: 1.0.0
- Returns: A new instance of Clock

### [ticks](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L36)


Number of ticks of the clock.
- Since: 1.0.0
- Signature: `var ticks:Num`

### [seconds](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L59)


Number of seconds elapsed.
Counts every 60 ticks.
- Since: 1.0.0
- Signature: `var seconds:Num`

### [minutes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L83)


Number of minutes elapsed.
Counts every 60 seconds.
- Since: 1.0.0
- Signature: `var minutes:Num`

### [hours](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L106)


Number of hours elapsed.
Counts every 60 minutes.
- Since: 1.0.0
- Signature: `var hours:Num`

### [dt](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L126)


The value last value obtained in `draw(dt)`.
Use this variable inside _static draw(dt)_ method.
- Signature: `var dt:Num`
- Since: 1.0.0

### [epoch](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L143)


Returns the number of seconds (including fractional seconds)
when the clock was created.
- Signature: `var epoch:Num`
- Since: 1.0.0

### [clock](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L152)


Returns the number of seconds (including fractional seconds)
since the program was started. This is usually used for benchmarking.
Uses `System.clock`.
- Signature: `var clock:Num`
- Since: 1.0.0

### [tick()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L160)


Increase ticks by 1.
Use this function inside your _static update()_ method.
- Signature: `func tick() -> Void`
- Since: 1.0.0

### [toString](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L170)


Returns the formatted clock string.
- Since: 1.0.0
- Example: `23:00:00`
- Signature: `static var string:String`

### [description](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L194)


A debugging description of the clock instance.
- Since: 1.0.0
- Signature: `static var description:String`
