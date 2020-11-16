/** doc-name: graphics.palettes.wren */
import "graphics" for Color

/** doc-header
## Palettes
Different palettes for usage within games.
- Example:
```js
import "domepunk/graphics/palettes" for Palettes
```
- Since: 1.0.0
*/

// Base class for Palettes
class Palette {
  static all {}
}

/**
The standard DOME palette
- Since: 1.0.0
*/
class DOME is Palette {

    /**
    - Signature: `static none -> Color.none`
    */
    static none { Color.none }

    /**
    - Signature: `static black -> Color`
    */
    static black { Color.black }

    /**
    - Signature: `static darkblue -> Color`
    */
    static darkblue { Color.darkblue }

    /**
    - Signature: `static purple -> Color`
    */
    static purple { Color.purple }

    /**
    - Signature: `static darkpurple -> Color`
    */
    static darkpurple { Color.darkpurple }

    /**
    - Signature: `static darkgreen -> Color`
    */
    static darkgreen { Color.darkgreen }

    /**
    - Signature: `static brown -> Color`
    */
    static brown { Color.brown }

    /**
    - Signature: `static darkgrey -> Color`
    */
    static darkgrey {Color.darkgray }
    static darkgray { Color.darkgray }

    /**
    - Signature: `static lightgrey -> Color`
    */
    static lightgrey { Color.lightgray }
    static lightgray { Color.lightgray }

    /**
    - Signature: `static white -> Color`
    */
    static white { Color.white }

    /**
    - Signature: `static red -> Color`
    */
    static red { Color.red }

    /**
    - Signature: `static orange -> Color`
    */
    static orange { Color.orange }

    /**
    - Signature: `static yellow -> Color`
    */
    static yellow { Color.yellow }

    /**
    - Signature: `static green -> Color`
    */
    static green { Color.green }

    /**
    - Signature: `static blue -> Color`
    */
    static blue { Color.blue }

    /**
    - Signature: `static indigo -> Color`
    */
    static indigo { Color.indigo }

    /**
    - Signature: `static pink -> Color`
    */
    static pink { Color.pink }

    /**
    - Signature: `static peach -> Color`
    */
    static peach { Color.peach }

    /**
    - Signature: `static all -> List`
    */
    static all {[
      black, darkblue,
      purple, darkpurple, darkgreen,
      brown, darkgrey, lightgrey,
      white, red, orange,
      yellow, green, blue,
      indigo, pink, peach
    ]}
}

/**
Based on https://lospec.com/palette-list/1bit-monitor-glow
- Since: 1.0.0
*/
class OneBitMonitor is Palette {

  /**
  - Signature: `static none -> Color.none`
  */
  static none { Color.none }

  /**
  - Signature: `static black -> Color`
  */
  static black {
    if (!__black) {
      __black = Color.hex("#222323")
    }
    return __black
  }

  /**
  - Signature: `static white -> Color`
  */
  static white {
    if (!__white) {
      __white = Color.hex("#f0f6f0")
    }
    return __white
  }

  /**
  - Signature: `static all -> List`
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
- Since: 1.0.0
*/
class TIC is Palette {
  /**
  - Signature: `static none -> Color.none`
  */
  static none { Color.none }

  /**
  - Signature: `static black -> Color`
  */
  static black {
    if (!__black) {
      __black = Color.hex("1A1C2C")
    }
    return __black
  }
  /**
  - Signature: `static purple -> Color`
  */
  static purple {
    if (!__purple) {
      __purple = Color.hex("5D275D")
    }
    return __purple
  }

  /**
  - Signature: `static red -> Color`
  */
  static red {
    if (!__red) {
      __red = Color.hex("B13E53")
    }
    return __red
  }

  /**
  - Signature: `static orange -> Color`
  */
  static orange {
    if (!__orange) {
      __orange = Color.hex("EF7D57")
    }
    return __orange
  }

  /**
  - Signature: `static yellow -> Color`
  */
  static yellow {
    if (!__yellow) {
      __yellow = Color.hex("FFCD75")
    }
    return __yellow
  }

  /**
  - Signature: `static lightgreen -> Color`
  */
  static lightgreen {
    if (!__lightgreen) {
      __lightgreen = Color.hex("A7F070")
    }
    return __lightgreen
  }

  /**
  - Signature: `static green -> Color`
  */
  static green {
    if (!__green) {
      __green = Color.hex("38B764")
    }
    return __green
  }

  /**
  - Signature: `static darkgreen -> Color`
  */
  static darkgreen {
    if (!__darkgreen) {
      __darkgreen = Color.hex("257179")
    }
    return __darkgreen
  }

  /**
  - Signature: `static darkblue -> Color`
  */
  static darkblue {
    if (!__darkblue) {
      __darkblue = Color.hex("29366F")
    }
    return __darkblue
  }

  /**
  - Signature: `static blue -> Color`
  */
  static blue {
    if (!__blue) {
      __blue = Color.hex("3B5DC9")
    }
    return __blue
  }

  /**
  - Signature: `static lightblue -> Color`
  */
  static lightblue {
    if (!__lightblue) {
      __lightblue = Color.hex("41A6F6")
    }
    return __lightblue
  }

  /**
  - Signature: `static cyan -> Color`
  */
  static cyan {
    if (!__cyan) {
      __cyan = Color.hex("73EFF7")
    }
    return __cyan
  }

  /**
  - Signature: `static white -> Color`
  */
  static white {
    if (!__white) {
      __white = Color.hex("F4F4F4")
    }
    return __white
  }

  /**
  - Signature: `static lightgrey -> Color`
  */
  static lightgrey {
    if (!__lightgrey) {
      __lightgrey = Color.hex("94B0C2")
    }
    return __lightgrey
  }

  /**
  - Signature: `static grey -> Color`
  */
  static grey {
    if (!__grey) {
      __grey = Color.hex("566C86")
    }
    return __grey
  }

  /**
  - Signature: `static darkgrey -> Color`
  */
  static darkgrey {
    if (!__darkgrey) {
      __darkgrey = Color.hex("333C57")
    }
    return __darkgrey
  }

  /**
  - Signature: `static all -> List`
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
        lightgrey,
        grey,
        darkgrey
      ]
    }
    return __all
  }
}

/**
Based on https://pico-8.fandom.com/wiki/Palette
- Since: 1.0.0
*/
class Pico is Palette {
  /**
  - Signature: `static none -> Color.none`
  */
  static none { Color.none }

  /**
  - Signature: `static black -> Color`
  */
  static black {
    if (!__black) {
      __black = Color.hex("#000000")
    }
    return __black
  }

  /**
  - Signature: `static darkblue -> Color`
  */
  static darkblue {
    if (!__darkblue) {
      __darkblue = Color.hex("#1D2B53")
    }
    return __darkblue
  }

  /**
  - Signature: `static darkpurple -> Color`
  */
  static darkpurple {
    if (!__darkpurple) {
      __darkpurple = Color.hex("#7E2553")
    }
    return __darkpurple
  }

  /**
  - Signature: `static darkgreen -> Color`
  */
  static darkgreen {
    if (!__darkgreen) {
      __darkgreen = Color.hex("#008751")
    }
    return __darkgreen
  }

  /**
  - Signature: `static brown -> Color`
  */
  static brown {
    if (!__brown) {
      __brown = Color.hex("#AB5236")
    }
    return __brown
  }

  /**
  - Signature: `static darkgrey -> Color`
  */
  static darkgrey {
    if (!__darkgrey) {
      __darkgrey = Color.hex("#5F574F")
    }
    return __darkgrey
  }

  /**
  - Signature: `static lightgrey -> Color`
  */
  static lightgrey {
    if (!__lightgrey) {
      __lightgrey = Color.hex("#C2C3C7")
    }
    return __lightgrey
  }

  /**
  - Signature: `static white -> Color`
  */
  static white {
    if (!__white) {
      __white = Color.hex("#FFF1E8")
    }
    return __white
  }

  /**
  - Signature: `static red -> Color`
  */
  static red {
    if (!__red) {
      __red = Color.hex("#FF004D")
    }
    return __red
  }

  /**
  - Signature: `static orange -> Color`
  */
  static orange {
    if (!__orange) {
      __orange = Color.hex("#FFA300")
    }
    return __orange
  }

  /**
  - Signature: `static yellow -> Color`
  */
  static yellow {
    if (!__yellow) {
      __yellow = Color.hex("#FFEC27")
    }
    return __yellow
  }

  /**
  - Signature: `static green -> Color`
  */
  static green {
    if (!__green) {
      __green = Color.hex("#00E436")
    }
    return __green
  }

  /**
  - Signature: `static blue -> Color`
  */
  static blue {
    if (!__blue) {
      __blue = Color.hex("#29ADFF")
    }
    return __blue
  }

  /**
  - Signature: `static lavender -> Color`
  */
  static lavender {
    if (!__lavender) {
      __lavender = Color.hex("#83769C")
    }
    return __lavender
  }

  /**
  - Signature: `static pink -> Color`
  */
  static pink {
    if (!__pink) {
      __pink = Color.hex("#FF77A8")
    }
    return __pink
  }

  /**
  - Signature: `static lightpeach -> Color`
  */
  static lightpeach {
    if (!__lightpeach) {
      __lightpeach = Color.hex("#FFCCAA")
    }
    return __lightpeach
  }

  // TODO: Add extended pico8 palette

  /**
  - Signature: `static all -> List`
  */
  static all {
    if (!__all) {
      __all = [
        black,
        darkblue,
        darkpurple,
        darkgreen,
        brown,
        darkgrey,
        lightgrey,
        white,
        red,
        orange,
        yellow,
        green,
        blue,
        lavender,
        pink,
        lightpeach
      ]
    }
    return __all
  }
}

/**
Based on https://lospec.com/palette-list/crtgb
- Since: 1.0.0
*/
class GBCrt is Palette {
  /**
  - Signature: `static none -> Color.none`
  */
  static none { Color.none }

  /**
  - Signature: `static black -> Color`
  */
  static black {
    if (!__black) {
      __black = Color.hex("#060601")
    }
    return __black
  }

  /**
  - Signature: `static green -> Color`
  */
  static green {
    if (!__green) {
      __green = Color.hex("#0b3e08")
    }
    return __green
  }

  /**
  - Signature: `static lightgreen -> Color`
  */
  static lightgreen {
    if (!__lightgreen) {
      __lightgreen = Color.hex("#489a0d")
    }
    return __lightgreen
  }

  /**
  - Signature: `static yellow -> Color`
  */
  static yellow {
    if (!__yellow) {
      __yellow = Color.hex("#daf222")
    }
    return __yellow
  }

  /**
  - Signature: `static all -> List`
  */
  static all {
    if (!__all) {
      __all = [
        black,
        green,
        lightgreen,
        yellow
      ]
    }
    return __all
  }
}

/**
Contains all the palettes
- Since: 1.0.0
*/
class Palettes {
  /**
  - Signature: `static onebitmonitor -> OneBitMonitor`
  */
  static onebitmonitor {OneBitMonitor}

  /**
  - Signature: `static tic -> TIC`
  */
  static tic {TIC}

  /**
  - Signature: `static pico -> Pico`
  */
  static pico {Pico}

  /**
  - Signature: `static gbcrt -> GBCrt`
  */
  static gbcrt {GBCrt}

  /**
  - Signature: `static dome -> DOME`
  */
  static dome {DOME}

  /**
  - Signature: `static all -> List`
  */
  static all {
    if (!__all) {
      __all = [dome, onebitmonitor, tic, pico, gbcrt]
    }
    return __all
  }
}
