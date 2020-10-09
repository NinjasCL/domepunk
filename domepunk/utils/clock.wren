/** doc-name: utils.clock */
/**
A simple Clock that counts ticks, seconds, minutes and hours.
Use this in conjunction with the _static update()_ and _static draw(dt)_ of your _DOME_ Game class.
- Since: 1.0.0
*/
class Clock {
  unit { 60 }
  maxInt { Num.largest }

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
    if (_ticks > 0 && _ticks % unit == 0) {
      seconds = (_ticks / unit).floor
    }
    if (_ticks > maxInt - 1) {
      _ticks = 0
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
    if (_seconds > 0 && _seconds % unit == 0) {
      minutes = (_seconds / unit).floor
    }

    if (_seconds > unit) {
      _seconds = 0
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
    if (_minutes > 0 && _minutes % unit == 0) {
      hours = (_minutes / unit).floor
    }
    if (_minutes > unit) {
      _minutes = 0
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
      _hours = maxInt
    }
  }

  /**
  The value last value obtained in `draw(dt)`.
  Use this variable inside _static draw(dt)_ method.
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
  when the clock was created.
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
  Increase ticks by 1.
  Use this function inside your _static update()_ method.
  - Signature: `func tick() -> Void`
  - Since: 1.0.0
  */
  tick() {
    ticks = ticks + 1
  }

  /**
  Returns the formatted clock string.
  - Since: 1.0.0
  - Example: `23:00:00`
  - Signature: `static var string:String`
  */
  toString {
    var hh = "0%(hours)"
    if (hours > 9) {
      hh = "%(hours)"
    }

    var mm = "0%(minutes)"
    if (minutes > 9) {
      mm = "%(minutes)"
    }

    var ss = "0%(seconds)"
    if (seconds > 9) {
      ss = "%(seconds)"
    }

    return "%(hh):%(mm):%(ss)"
  }

  /**
  A debugging description of the clock instance.
  - Since: 1.0.0
  - Signature: `static var description:String`
  */
  description {{
    "ticks":ticks,
    "seconds":seconds,
    "minutes":minutes,
    "hours":hours,
    "dt": dt,
    "epoch": epoch,
    "clock": clock
  }.toString}
}
