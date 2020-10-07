
class Clock {
  ticks {_ticks}
  seconds {_seconds}
  minutes {_minutes}
  hours {_hours}
  dt {_lastdt}
  epoch {_epoch}

  division { 60 }
  maxInt { 0xffff }

  construct new() {
    _ticks = 0
    _dtsecond = 1
    _lastdt = 0

    _seconds = 0
    _minutes = 0
    _hours = 0
    _epoch = System.clock
  }

  tick(dt) {
    _lastdt = dt
    if (dt >= _dtsecond) {
      _ticks = _ticks + 1
      if (_ticks > maxInt - 1) {
        _ticks = 0
      }
    }

    if (_ticks > 0 && _ticks % division == 0) {
      _seconds = _seconds + 1
    }

    if (_seconds > 0 && _seconds % division == 0) {
      _minutes = _minutes + 1
    }

    if (_minutes > 0 && _minutes % division == 0) {
      _hours = _hours + 1
    }
  }

  toString {{
    "ticks":_ticks,
    "seconds":_seconds,
    "minutes":_minutes,
    "hours":_hours,
    "dt": _lastdt,
    "epoch": _epoch
  }.toString}
}
