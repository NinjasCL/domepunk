<!-- file: domepunk/graphics/tileset.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
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

---
## [Class Tileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L30)



## API

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L48)


The source image of the tileset
- Signature: `image: ImageData`

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L54)


The width of the tileset
- Signature: `width : Num`

### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L65)


The height of the tileset
- Signature: `height : Num`

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L76)


The x offset of the tileset
- Signature: `x : Num`

### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L85)


The y offset of the tileset
- Signature: `y : Num`

### [offset](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L94)


The x,y offset of the tileset
- Signature: `offset : Point`

### [tiles](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L104)


The list of tiles.
- Signature: `tiles : [Tile]`

### [count](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L115)


The number of tiles inside tileset
- Signature: `count : Num`

### [defaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L121)


Default width and height
- Signature: `defaultSize : Num = 8`

### [static load(path, x, y, width, height)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L151)


Creates a new tileset giving an image path.
- Signature: `static load(path:String, x:Num? = 0, y:Mum? = 0, width:Mum? = 8, height:Num? = 8)`
- Parameter path: The path to the image.
- Parameter x: The x offset for the tileset.
- Parameter y: The y offset for the tileset.
- Parameter width: The width for each tileset.
- Parameter height: The height for each tileset.
- Return: a new Tileset instance.

---
## [Class Tile is Drawable](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L172)


A tile instance inside the tileset.tiles list

## API

### [tileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L187)


The tileset where this tile is member of
- Signature: `tileset : Tileset`

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L193)


The source image of this tile
- Signature: `image: ImageData`

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L199)


x position inside the tileset
- Signature: `x : Num`

### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L205)


y position inside the tileset
- Signature: `y : Num `

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L211)


width of this tile
- Signature: `width: Num`

### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L217)


height of this tile
- Signature: `height: Num`

### [index](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L223)


Index of the tile inside tileset
- Signature: `index: Num`

### [draw(x, y)](https://github.com/ninjascl/domepunk/blob/main/domepunk/graphics/tileset.wren#L239)


Draws the tile using ImageData.drawArea.
It would consider the offset in the tileset.
- Signature: `draw(x:Num, y:Num) -> Void`
