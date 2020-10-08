<!-- file: domepunk/utils/clock.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Clock](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L7)


A simple Clock that counts ticks, seconds, minutes and hours
since the start of the program.
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

### [minutes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L62)


Number of minutes elapsed.
Counts every 60 seconds.
- Since: 1.0.0
- Signature: `var minutes:Num`

### [hours](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L85)


Number of hours elapsed.
Counts every 60 minutes.
- Since: 1.0.0
- Signature: `var hours:Num`

### [dt](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L104)


The value last value obtained in `draw(dt)`.
- Signature: `var dt:Num`
- Since: 1.0.0

### [epoch](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L121)


Returns the number of seconds (including fractional seconds)
when the program was started.
- Signature: `var epoch:Num`
- Since: 1.0.0

### [clock](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L130)


Returns the number of seconds (including fractional seconds)
since the program was started. This is usually used for benchmarking.
Uses `System.clock`.
- Signature: `var clock:Num`
- Since: 1.0.0

### [construct new()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L138)


Initializes a new clock object.
- Signature: `constructor new() -> Clock`
- Since: 1.0.0
- Returns: A new instance of Clock

### [tick()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/clock.wren#L153)


Increase ticks by 1
- Signature: `func tick() -> Void`
- Since: 1.0.0
