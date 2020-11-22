/** doc-name: graphics.res.wren */

/** doc-header
## Screen Resolutions

A collection of different screen resolutions.

- Example:

```js
import "domepunk/graphics/res" for Snes
System.print(Snes.size)
```
*/

/**
Holds width and height
*/
class Resolution {

  toString {toMap.toString}

  toMap {{
    "width" : width,
    "height": height
  }}

  /**
  - Signature: `width:Num`
  */
  width {_width}

  /**
  - Signature: `height:Num`
  */
  height {_height}

  construct new(w, h) {
    _width = w
    _height = h
  }
}

/**
Based on the Arduboy specs _(128 x 64)_

https://arduboy.com/faq/

- Since: `1.0.0`
*/
class Arduboy is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(128, 64)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

/**
Based on the TIC-80 specs _(240 x 136)_

https://github.com/nesbox/TIC-80/wiki#specification

- Since: `1.0.0`
*/
class TIC80 is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(240, 136)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

var Tic80 = TIC80

/**
Based on the Pico8 specs _(128 x 128)_

https://pico-8.fandom.com/wiki/Pico8

- Since: `1.0.0`
*/
class Pico8 is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(128, 128)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

/**
Based on the NES specs _(256 x 240)_

https://en.wikipedia.org/wiki/Nintendo_Entertainment_System

- Since: `1.0.0`
*/
class NES is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(256, 240)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

var Nes = NES

/**
Based on the SNES specs _(256 x 224)_ or _(512 x 448)_

https://en.wikipedia.org/wiki/Super_Nintendo_Entertainment_System

- Since: `1.0.0`
*/
class SNES is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(256, 224)
    }
    return __size
  }

  /**
  512 x 448
  - Signature: `size:Resolution`
  */
  static interlaced {
    if (!__interlaced) {
      __interlaced = Resolution.new(512, 448)
    }
    return __interlaced
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

var Snes = SNES

/**
Based on the Gameboy specs _(160 x 144)_

https://en.wikipedia.org/wiki/Game_Boy

- Since: `1.0.0`
*/
class Gameboy is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(160, 144)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

/**
Based on the Gameboy Advance specs _(240 x 160)_

https://en.wikipedia.org/wiki/Game_Boy_Advance

- Since: `1.0.0`
*/
class GameboyAdvance is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(240, 160)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

/**
Based on the Playstation Portable specs _(480 x 272)_

https://en.wikipedia.org/wiki/PlayStation_Portable

- Since: `1.0.0`
*/
class PSP is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(480, 272)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}


/**
Based on the Commondore 64 specs _(320 x 200)_ or _(160 x 200)_

https://en.wikipedia.org/wiki/Commodore_64

- Since: `1.0.0`
*/
class C64 is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(320, 200)
    }
    return __size
  }

  /**
  Multicolor mode _(160 x 200)_
  - Signature: `size:Resolution`
  */
  static multicolor {
    if (!__multi) {
      __multi = Resolution.new(160, 200)
    }
    return __multi
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}

/**
Based on the Atari 2600 specs _(160 x 192)_

https://en.wikipedia.org/wiki/Atari_2600_hardware

- Since: `1.0.0`
*/
class Atari2600 is Resolution {

  /**
  - Signature: `size:Resolution`
  */
  static size {
    if (!__size) {
      __size = Resolution.new(160, 192)
    }
    return __size
  }

  /**
  - Signature: `width:Num`
  */
  static width {size.width}

  /**
  - Signature: `height:Num`
  */
  static height {size.height}
}
