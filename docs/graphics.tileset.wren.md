<!-- file: domepunk/graphics/tileset.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## Tileset
A simple tileset builder.
Some code based on [Ogmo Lib](https://github.com/Ogmo-Editor-3/ogmo-3-lib/blob/master/sample/Main.hx).

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

---
## [Class Tileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L32)



## API

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L50)


The source image of the tileset
- Signature: `image: ImageData`

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L56)


The width of the tileset
- Signature: `width : Num`

### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L67)


The height of the tileset
- Signature: `height : Num`

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L78)


The x offset of the tileset
- Signature: `x : Num`

### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L87)


The y offset of the tileset
- Signature: `y : Num`

### [offset](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L96)


The x,y offset of the tileset
- Signature: `offset : Point`

### [tiles](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L106)


The list of tiles.
- Signature: `tiles : [Tile]`

### [count](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L117)


The number of tiles inside tileset
- Signature: `count : Num`

### [defaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L123)


Default width and height
- Signature: `defaultSize : Num = 8`

### [static load(path, x, y, width, height)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L153)


Creates a new tileset giving an image path.
- Signature: `static load(path:String, x:Num? = 0, y:Num? = 0, width:Num? = 8, height:Num? = 8)`
- Parameter path: The path to the image.
- Parameter x: *optional* The x offset for the tileset.
- Parameter y: *optional* The y offset for the tileset.
- Parameter width: *optional* The width for each tileset.
- Parameter height: *optional* The height for each tileset.
- Return: a new Tileset instance.

### [static load(path, width, height)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L160)



### [static load(path, size)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L166)



### [static load(path)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L172)



---
## [Class Tile is Drawable](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L180)


A tile instance inside the tileset.tiles list

## API

### [tileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L195)


The tileset where this tile is member of
- Signature: `tileset : Tileset`

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L201)


The source image of this tile
- Signature: `image: ImageData`

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L207)


x position inside the tileset
- Signature: `x : Num`

### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L213)


y position inside the tileset
- Signature: `y : Num `

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L219)


width of this tile
- Signature: `width: Num`

### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L225)


height of this tile
- Signature: `height: Num`

### [index](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L231)


Index of the tile inside tileset
- Signature: `index: Num`

### [draw(x, y)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L247)


Draws the tile using ImageData.drawArea.
It would consider the offset in the tileset.
- Signature: `draw(x:Num, y:Num) -> Void`
