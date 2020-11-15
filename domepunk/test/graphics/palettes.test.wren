import "domepunk/graphics/palettes" for Palettes, Palette

class PalettesTests {
  static describe {"graphics/palettes.wren"}
  static all {[
    testPalettes
  ]}

  static testPalettes {[
    "Palettes", [
      [
        ".all",
        Fn.new {|assert|
          var all = Palettes.all
          assert.isKind(all, List)
          assert.equal(all.count > 0, true)

          var palette = all[0]
          assert.isKind(palette, Palette)
        }
      ],
    ]
  ]}

}
