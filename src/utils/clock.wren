
class Clock {
  unit { 60 }
  maxInt { 0xffff }

  ticks {_ticks}
  ticks = (value) {
    _ticks = value
    if (_ticks > maxInt - 1) {
      _ticks = 0
    }
    if (_ticks > 0 && _ticks % unit == 0) {
      seconds = seconds + 1
    }
  }

  seconds {_seconds}
  seconds = (value) {
    _seconds = value
    if (_seconds > unit) {
      _seconds = 0
    }
    if (_seconds > 0 && _seconds % unit == 0) {
      minutes = minutes + 1
    }
  }

  minutes {_minutes}
  minutes = (value) {
    _minutes = value
    if (_minutes > unit) {
      _minutes = 0
    }
    if (_minutes > 0 && _minutes % unit == 0) {
      hours = hours + 1
    }
  }

  hours {_hours}
  hours = (value) {
    _hours = value
    if (_hours > maxInt - 1) {
      _hours = 0
    }
  }

  dt {_dt}
  epoch {_epoch}
  now {System.clock}

  construct new() {
    _ticks = 0
    _dt = 0

    _seconds = 0
    _minutes = 0
    _hours = 0
    _epoch = System.clock
  }

  tick(dt) {
    _dt = dt
  }

  update() {
    ticks = ticks + 1
  }

  toString {{
    "ticks":ticks,
    "seconds":seconds,
    "minutes":minutes,
    "hours":hours,
    "dt": dt,
    "epoch": epoch
  }.toString}
}
