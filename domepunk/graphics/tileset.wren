/** doc-name: graphics.tileset.wren */

import "graphics" for Drawable, ImageData
import "math" for Point

/** doc-header
## Tileset
A simple tileset builder.
- Example:
```js
import "domepunk/graphics/tileset" for Tileset

// Load a tileset of 16x16 px squares
var size = 16
var tileset = Tileset.load("tiles.png", size)
tileset.offset(30, 30)

// draw each tile horizontally
var index = 0
for (tile in tileset.tiles) {
  tile.draw(size * index, 0)
  index = index + 1
}
```
- Since: 1.0.0
*/

/**
*/
class Tileset {

  toString {toMap.toString}
  toMap {{
    "x": x,
    "y": y,
    "offset": offset,
    "width": width,
    "height": height,
    "tiles": tiles,
    "image": image,
    "defaultSize": defaultSize
  }}

  /**
  The source image of the tileset
  - Signature: `image: ImageData`
  */
  image {_image}

  /**
  The width of the tileset
  - Signature: `width : Num`
  */
  width {
    if (!_width || _width <= 0) {
      _width = defaultSize
    }
    return _width
  }

  /**
  The height of the tileset
  - Signature: `height : Num`
  */
  height {
    if (!_height || _height <= 0) {
      _height = defaultSize
    }
    return _height
  }

  /**
  The x offset of the tileset
  - Signature: `x : Num`
  */
  x {_x || 0}
  x = (value) {
    _x = value
  }

  /**
  The y offset of the tileset
  - Signature: `y : Num`
  */
  y {_y || 0}
  y = (value) {
    _y = value
  }

  /**
  The x,y offset of the tileset
  - Signature: `offset : Point`
  */
  offset {Point.new(x, y)}
  offset (x, y) {
    this.x = x
    this.y = y
  }

  /**
  The list of tiles.
  - Signature: `tiles : [Tile]`
  */
  tiles {
    if (!_tiles) {
      _tiles = []
    }
    return _tiles
  }

  /**
  The number of tiles inside tileset
  - Signature: `count : Num`
  */
  count {tiles.count}

  /**
  Default width and height
  - Signature: `defaultSize : Num = 8`
  */
  defaultSize {8}

  construct new(image, x, y, width, height) {
    _image = image
    _x = x || 0
    _y = y || 0
    _width = width
    _height = height
    _tiles = []

    var index = 0
    for (y in 0...(image.height / height)) {
      for (x in 0...(image.width / width)) {
        var tile = Tile.new(this, x * width, y * height, width, height, index)
        _tiles.add(tile)
        index = index + 1
      }
    }
  }

  /**
  Creates a new tileset giving an image path.
  - Signature: `static load(path:String, x:Num? = 0, y:Mum? = 0, width:Mum? = 8, height:Num? = 8)`
  - Parameter path: The path to the image.
  - Parameter x: The x offset for the tileset.
  - Parameter y: The y offset for the tileset.
  - Parameter width: The width for each tileset.
  - Parameter height: The height for each tileset.
  - Return: a new Tileset instance.
  */
  static load(path, x, y, width, height) {
    var image = ImageData.loadFromFile(path)
    return Tileset.new(image, x, y, width, height)
  }

  static load(path, width, height) {
    return Tileset.load(path, 0, 0, width, height)
  }

  static load(path, size) {
    return Tileset.load(path, size, size)
  }

  static load(path) {
    return Tileset.load(path, defaultSize)
  }
}

/**
A tile instance inside the tileset.tiles list
*/
class Tile is Drawable {

  toString {toMap.toString}
  toMap {{
    "x": x,
    "y": y,
    "width": width,
    "height": height,
    "index": index
  }}

  /**
  The tileset where this tile is member of
  - Signature: `tileset : Tileset`
  */
  tileset {_tileset}

  /**
  The source image of this tile
  - Signature: `image: ImageData`
  */
  image {tileset.image}

  /**
  x position inside the tileset
  - Signature: `x : Num`
  */
  x {_x}

  /**
  y position inside the tileset
  - Signature: `y : Num `
  */
  y {_y}

  /**
  width of this tile
  - Signature: `width: Num`
  */
  width {_width}

  /**
  height of this tile
  - Signature: `height: Num`
  */
  height {_height}

  /**
  Index of the tile inside tileset
  - Signature: `index: Num`
  */
  index {_index}

  construct new(tileset, x, y, width, height, index) {
    _tileset = tileset
    _x = x
    _y = y
    _width = width
    _height = height
    _index = index
  }

  /**
  Draws the tile using ImageData.drawArea.
  It would consider the offset in the tileset.
  - Signature: `draw(x:Num, y:Num) -> Void`
  */
  draw(x, y) {
    tileset.image.drawArea(this.x, this.y, this.width, this.height, tileset.x + x, tileset.y + y)
  }
}
