/** doc-name: misc.palettes.wren */
import "graphics" for Color

/** doc-header
Different palettes for usage within games.
- Example:
```js
import "domepunk/misc/palettes" for Palettes
```
*/

// Base class for Palettes
class Palette {
  static all {}
}

/**
Based on https://lospec.com/palette-list/1bit-monitor-glow
*/
class OneBitMonitor is Palette {

  /**
  - Signature: static black -> Color
  */
  static black {
    if (!__black) {
      __black = Color.hex("#222323")
    }
    return __black
  }

  /**
  - Signature: static white -> Color
  */
  static white {
    if (!__white) {
      __white = Color.hex("#f0f6f0")
    }
    return __white
  }

  /**
  - Signature: static all -> List
  */
  static all {
    if (!__all) {
      __all = [black, white]
    }
    return __all
  }
}

/**
Based on https://github.com/nesbox/TIC-80/wiki/palette
*/
class TIC is Palette {
  /**
  - Signature: static black -> Color
  */
  static black {
    if (!__black) {
      __black = Color.hex("1A1C2C")
    }
    return __black
  }
  /**
  - Signature: static purple -> Color
  */
  static purple {
    if (!__purple) {
      __purple = Color.hex("5D275D")
    }
    return __purple
  }

  /**
  - Signature: static red -> Color
  */
  static red {
    if (!__red) {
      __red = Color.hex("B13E53")
    }
    return __red
  }

  /**
  - Signature: static orange -> Color
  */
  static orange {
    if (!__orange) {
      __orange = Color.hex("EF7D57")
    }
    return __orange
  }

  /**
  - Signature: static yellow -> Color
  */
  static yelloe {
    if (!__yellow) {
      __yellow = Color.hex("FFCD75")
    }
    return __yellow
  }

  /**
  - Signature: static lightgreen -> Color
  */
  static lightgreen {
    if (!__lightgreen) {
      __lightgreen = Color.hex("A7F070")
    }
    return __lightgreen
  }

  /**
  - Signature: static green -> Color
  */
  static green {
    if (!__green) {
      __green = Color.hex("38B764")
    }
    return __green
  }

  /**
  - Signature: static darkgreen -> Color
  */
  static darkgreen {
    if (!__darkgreen) {
      __darkgreen = Color.hex("257179")
    }
    return __darkgreen
  }

  /**
  - Signature: static darkblue -> Color
  */
  static darkblue {
    if (!__darkblue) {
      __darkblue = Color.hex("29366F")
    }
    return __darkblue
  }

  /**
  - Signature: static blue -> Color
  */
  static blue {
    if (!__blue) {
      __blue = Color.hex("3B5DC9")
    }
    return __blue
  }

  /**
  - Signature: static lightblue -> Color
  */
  static lightblue {
    if (!__lightblue) {
      __lightblue = Color.hex("41A6F6")
    }
    return __lightblue
  }

  /**
  - Signature: static cyan -> Color
  */
  static cyan {
    if (!__cyan) {
      __cyan = Color.hex("73EFF7")
    }
    return __cyan
  }

  /**
  - Signature: static white -> Color
  */
  static white {
    if (!__white) {
      __white = Color.hex("F4F4F4")
    }
    return __white
  }

  /**
  - Signature: static lightgray -> Color
  */
  static lightgray {
    if (!__lightgray) {
      __lightgray = Color.hex("94B0C2")
    }
    return __lightgray
  }

  /**
  - Signature: static gray -> Color
  */
  static gray {
    if (!__gray) {
      __gray = Color.hex("566C86")
    }
    return __gray
  }

  /**
  - Signature: static darkgray -> Color
  */
  static darkgray {
    if (!__darkgray) {
      __darkgray = Color.hex("333C57")
    }
    return __darkgray
  }

  /**
  - Signature: static all -> List
  */
  static all {
    if (!__all) {
      __all = [
        black,
        purple,
        red,
        orange,
        yelloe,
        lightgreen,
        green,
        darkgreen,
        darkblue,
        blue,
        lightblue,
        cyan,
        white,
        lightgray,
        gray,
        darkgray
      ]
    }
    return __all
  }
}

/**
Contains all the palettes
*/
class Palettes {
  /**
  - Signature: static onebitmonitor -> OneBitMonitor
  */
  static onebitmonitor {OneBitMonitor}

  /**
  - Signature: static tic -> TIC
  */
  static tic {TIC}

  /**
  - Signature: static all -> List
  */
  static all {
    if (!__all) {
      __all = [onebitmonitor, tic]
    }
    return __all
  }
}
