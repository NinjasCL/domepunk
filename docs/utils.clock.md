<!-- file: domepunk/utils/clock.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Clock](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L7)


A simple Clock that counts ticks, seconds, minutes and hours.
Use this in conjunction with the _static update()_ and _static draw(dt)_ of your _DOME_ Game class.
- Since: 1.0.0

## API

### [ticks](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L16)


Number of ticks of the clock.
- Since: 1.0.0
- Signature: `var ticks:Num`

### [seconds](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L39)


Number of seconds elapsed.
Counts every 60 ticks.
- Since: 1.0.0
- Signature: `var seconds:Num`

### [minutes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L63)


Number of minutes elapsed.
Counts every 60 seconds.
- Since: 1.0.0
- Signature: `var minutes:Num`

### [hours](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L86)


Number of hours elapsed.
Counts every 60 minutes.
- Since: 1.0.0
- Signature: `var hours:Num`

### [dt](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L106)


The value last value obtained in `draw(dt)`.
Use this variable inside _static draw(dt)_ method.
- Signature: `var dt:Num`
- Since: 1.0.0

### [epoch](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L123)


Returns the number of seconds (including fractional seconds)
when the program was started.
- Signature: `var epoch:Num`
- Since: 1.0.0

### [clock](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L132)


Returns the number of seconds (including fractional seconds)
since the program was started. This is usually used for benchmarking.
Uses `System.clock`.
- Signature: `var clock:Num`
- Since: 1.0.0

### [construct new()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L140)


Initializes a new clock object.
- Signature: `constructor new() -> Clock`
- Since: 1.0.0
- Returns: A new instance of Clock

### [tick()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L156)


Increase ticks by 1.
Use this function inside your _static update()_ method.
- Signature: `func tick() -> Void`
- Since: 1.0.0
