import "graphics" for ImageData
import "domepunk/graphics/tileset" for Tileset, Tile

class TilesetTests {
  static describe {"graphics/tileset.wren"}
  static all {[
    test
  ]}

  static test {[
    "Tileset", [
      [
        "load",
        Fn.new {|assert|
          var tileset = Tileset.load("domepunk/test/assets/tiles.png", 16)
          assert.isKind(tileset, Tileset)
          assert.isKind(tileset.image, ImageData)
          assert.equal(tileset.tiles.count, 4)
          assert.equal(tileset.width, 16)
          assert.equal(tileset.height, 16)

          var first = tileset.tiles[0]
          assert.isKind(first, Tile)
          assert.equal(first.width, 16)
          assert.equal(first.height, 16)

          assert.success {
            first.draw(0, 0)
          }
        }
      ],
    ]
  ]}

}
