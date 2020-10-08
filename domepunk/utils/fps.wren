
class Fps {

  clock {_clock }
  maxSamples { 60 }

  construct new(science, clock) {
    _science = science
    _clock = clock

    _frames = 0
    _ticks = 0
    _count = 0
    _second = 1
  }
}
