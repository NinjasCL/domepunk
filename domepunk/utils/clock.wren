/** doc-name: utils.clock */
/**
A simple Clock that counts ticks, seconds, minutes and hours
since the start of the program.
- Since: 1.0.0
*/
class Clock {
  unit { 60 }
  maxInt { 0xffff }

  /**
  Number of ticks of the clock.
  - Since: 1.0.0
  - Signature: `var ticks:Num`
  */
  ticks {
    if (!_ticks) {
      _ticks = 0
    }
    return _ticks
  }

  ticks = (value) {
    _ticks = value
    if (_ticks > maxInt - 1) {
      _ticks = 0
    }
    if (_ticks > 0 && _ticks % unit == 0) {
      seconds = seconds + 1
    }
  }

  /**
  Number of seconds elapsed.
  Counts every 60 ticks.
  - Since: 1.0.0
  - Signature: `var seconds:Num`
  */
  seconds {
    if (!_seconds) {
      _seconds = 0
    }
    return _seconds
  }

  seconds = (value) {
    _seconds = value
    if (_seconds > unit) {
      _seconds = 0
    }
    if (_seconds > 0 && _seconds % unit == 0) {
      minutes = minutes + 1
    }
  }

  /**
  Number of minutes elapsed.
  Counts every 60 seconds.
  - Since: 1.0.0
  - Signature: `var minutes:Num`
  */
  minutes {
    if (!_minutes) {
      _minutes = 0
    }
    return _minutes
  }

  minutes = (value) {
    _minutes = value
    if (_minutes > unit) {
      _minutes = 0
    }
    if (_minutes > 0 && _minutes % unit == 0) {
      hours = hours + 1
    }
  }

  /**
  Number of hours elapsed.
  Counts every 60 minutes.
  - Since: 1.0.0
  - Signature: `var hours:Num`
  */
  hours {
    if (!_hours) {
      _hours = 0
    }
    return _hours
  }

  hours = (value) {
    _hours = value
    if (_hours > maxInt - 1) {
      _hours = 0
    }
  }

  /**
  The value last value obtained in `draw(dt)`.
  - Signature: `var dt:Num`
  - Since: 1.0.0
  */
  dt {
    if (!_dt) {
      _dt = 0
    }
    return _dt
  }

  dt = (value) {
    _dt = value
  }

  /**
  Returns the number of seconds (including fractional seconds)
  when the program was started.
  - Signature: `var epoch:Num`
  - Since: 1.0.0
  */
  epoch {_epoch}

  /**
  Returns the number of seconds (including fractional seconds)
  since the program was started. This is usually used for benchmarking.
  Uses `System.clock`.
  - Signature: `var clock:Num`
  - Since: 1.0.0
  */
  clock {System.clock}

  /**
  Initializes a new clock object.
  - Signature: `constructor new() -> Clock`
  - Since: 1.0.0
  - Returns: A new instance of Clock
  */
  construct new() {
    _ticks = 0
    _dt = 0

    _seconds = 0
    _minutes = 0
    _hours = 0
    _epoch = System.clock
  }

  /**
  Increase ticks by 1
  - Signature: `func tick() -> Void`
  - Since: 1.0.0
  */
  tick() {
    ticks = ticks + 1
  }

  toString {{
    "ticks":ticks,
    "seconds":seconds,
    "minutes":minutes,
    "hours":hours,
    "dt": dt,
    "epoch": epoch,
    "clock": clock
  }.toString}
}
