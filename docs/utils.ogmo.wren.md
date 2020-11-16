<!-- file: domepunk/utils/ogmo.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## [Ogmo](https://ogmo-editor-3.github.io/)
Utility Classes for Parsing Ogmo Json files.

Based on https://github.com/Ogmo-Editor-3/ogmo-3-lib

- Example:
```js
import "domepunk/utils/ogmo" for Project, Level

class Game {
    static init() {
      var ogmo = Project.load("project.ogmo")
      System.print(ogmo.version)

      var level = Level.load("level.json")
      level.onTileLayerLoaded {|data, layer|
        System.print("onTileLayerLoaded triggered")
        System.print(data)
      }

      level.init()

    }
    static update() {}
    static draw(dt) {}
}
```
- Since: 1.0.0
- Dome: 1.4.0
- Ogmo: 3.2.2

---
## [Class Project](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L55)


```js
import "domepunk/utils/ogmo" for Project

// alias
import "domepunk/utils/ogmo" for OgmoProject, OProj
```

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L81)


The Name of the Ogmo Project.

### [version](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L86)


The version of Ogmo used

### [levelPaths](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L92)


Array of paths that hold the Project's levels.

### [backgroundColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L97)


The Project's background color.

### [gridColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L105)


The color of the Grid displayed in the Project's Editor

### [anglesRadians](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L114)


Flag to set whether the Project describes rotations in Radians or Degrees.
If set to `true` its in Radians. Otherwise it is in Degrees.

### [defaultExportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L119)


Sets the default exported file type of a Level.

### [directoryDepth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L124)


Maximum Depth that the Editor will search for files for its File Tree.

### [levelDefaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L129)


Default size of newly created levels in the Editor.

### [levelMinSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L134)


Minimum size a level can be.

### [levelMaxSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L139)


Maximum size a level can be.

### [levelValues](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L144)


Array of Value Templates for the Project's Levels.

### [entityTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L149)


Array containing all of the Project's available Entity Tags.

### [layers](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L154)


Array containing all of the Project's available Layer Templates.

### [entities](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L159)


Array containing all of the Project's available Entity Templates.

### [tilesets](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L164)


Array containing all of the Project's available Tilesets.

### [layerGridDefaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L168)



### [static load(path)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L226)


Creates an Ogmo Project from `.ogmo` data.
- Signature: static load(path:String) -> Project
- Parameter path: String to the file holding Ogmo data.
- Returns: Project parsed from Ogmo file.

### [entity(exportID)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L236)


Attempts to get an ProjectEntity from an exportID.
- Parameter exportID: The export id
- Returns: ProjectEntity or null

### [layer(exportID)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L250)


Attempts to get an ProjectLayer from an exportID.
- Parameter exportID: The export id
- Returns: ProjectLayer or null

### [tileset(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L264)


Attempts to get an ProjectTileset from an exportID.
- Parameter name: The tileset name
- Returns: ProjectTileset or null

---
## [Class Level](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L285)


```js
import "domepunk/utils/ogmo" for Level

// alias
import "domepunk/utils/ogmo" for OgmoLevel, OLevel
```

## API

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L300)


Width of the Level.

### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L305)


Height of the Level.

### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L310)


Size (width, height)

### [offsetX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L315)


Offset of the Level on the X axis. Useful for loading multiple chunked Levels.

### [offsetY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L320)


Offset of the Level on the Y axis. Useful for loading multiple chunked Levels.

### [offset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L325)


Point (offsetX, offsetY)

### [layers](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L330)


Array containing all of the Level's Layer Definitions.

### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L335)


Array containing all of the Level's custom values.

### [onDecalLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L342)


Callback triggered when a Decal layer is found after calling `load()` on a Level.
The first argument is an Array holding the Layer's Decal Definitions.
The second argument is the Layer Definition itself.

### [onEntityLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L358)


k triggered when an Entity layer is found after calling `load()` on a Level.
The first argument is an Array holding the Layer's Entity Definitions.
The second argument is the Layer Definition itself.

### [onGridLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L373)


Callback triggered when a Grid layer exported with a 1D Data Array is found after calling `load()` on a Level.
The first argument is a 1D Array holding the Layer's Grid Data.
The second argument is the Layer Definition itself.

### [onGrid2DLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L388)


Callback triggered when a Grid layer exported with a 2D Data Array is found after calling `load()` on a Level.
The first argument is a 2D Array holding the Layer's Grid Data.
The second argument is the Layer Definition itself.

### [onTileLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L403)


Callback triggered when a Tile layer exported with a 1D Data Array containing Tile IDs is found after calling `load()` on a Level.
The first argument is a 1D Array holding the Layer's Tile ID Data.
The second argument is the Layer Definition itself.

### [onTile2DLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L418)


Callback triggered when a Tile layer exported with a 2D Data Array containing Tile IDs is found after calling `load()` on a Level.
The first argument is a 2D Array holding the Layer's Tile ID Data.
The second argument is the Layer Definition itself.

### [onTileCoordsLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L433)


Callback triggered when a Tile layer exported with a 2D Data Array containing Tile Coords is found after calling `load()` on a Level.
The first argument is a 2D Array holding the Layer's Tile Cordinate Data.
The second argument is the Layer Definition itself.

### [onTileCoords2DLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L448)


Callback triggered when a Tile layer exported with a 3D Data Array containing Tile Coords is found after calling `load()` on a Level.
The first argument is a 3D Array holding the Layer's Tile Coords Data.
The second argument is the Layer Definition itself.

### [init()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L470)


Loops through all layers, triggering each layer's callback if defined on this Level.
Available Callbacks:
- onTileLayerLoaded
- onTile2DLayerLoaded
- onTileCoordsLayerLoaded
- onTileCoords2DLayerLoaded
- onDecalLayerLoaded
- onEntityLayerLoaded
- onGridLayerLoaded
- onGrid2DLayerLoaded

### [static load(path)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L555)


Creates a Level with `.json` data from Ogmo.
- Signature: static load(Path:String) -> Level
- Parameter path: Path string holding Ogmo Level Json data.
- Returns: Level parsed from Json.

---
## [Class Point](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L568)



## API

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L575)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L579)



---
## [Class Size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L594)



## API

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L603)



### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L607)



---
## [Class Shape](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L626)



## API

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L634)


- Signature: label: String

### [points](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L644)


- Signature: points: [Point]

---
## [Class OgmoColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L667)



## API

### [color](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L671)


- Signature: `color: Color`

---
## [Class ProjectValue](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L684)


Data structure value for level, layers, entity

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L703)


Name of the Value Template.

### [definition](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L708)


Definition of the Value Template.

### [defaults](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L713)


Default value(s) for the Value Template.

### [bounded](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L718)


Flag to set if the value is bounded with a min/max. Only available for Int and Float Value Templates.

### [min](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L723)


Minimum value of a Float or Int. Only available for Int and Float Value Templates.

### [max](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L728)


Maximum value of a Float or Int. Only available for Int and Float Value Templates.

### [maxLength](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L733)


Maximum length of a String. Only available for String Value Template.

### [trimWhitespace](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L738)


Flag to set whether to remove whitespace from a String. Only available for String Value Template.

### [choices](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L743)


Available options of an Enum. Only available for Enum Value Template.

### [includeAlpha](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L748)


Flag to get whether to include the Alpha component on a Color. Only available for Color Value Template.

---
## [Class ProjectLayer](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L800)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L825)


Name of the Layer Template.

### [definition](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L830)


Definition of the Layer Template.

### [gridSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L835)


Size of each cell in the Layer's Grid.

### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L840)


Unique Export ID of the Layer.

### [exportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L846)


Enum to determine whether a Tile Layer exports it's Tile Data with IDs or Coords.
Only available for Tile Layers.

### [arrayMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L851)


Enum to determine whether a Tile or Grid Layer exports it's Data as a 1D Array or a 2D Array. Only available for Tile and Grid Layers.

### [defaultTileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L856)


Name of this Layer's default Tilemap. Only available for Tile Layers.

### [legend](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L861)


String Map describing a Grid Layers available Grid Cells. Only available for Grid Layers.

### [requiredTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L866)


Array of Entity Tags that filters out any Entities that DO NOT have any of the Tags described. Only available for Entity Layers.

### [excludedTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L876)


Array of Entity Tags that filters out any Entities that DO have any of the Tags described. Only available for Entity Layers.

### [folder](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L886)


Directory to search for Decal images. Only available for Decal Layers.

### [includeImageSequence](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L891)


Flag to set whether image sequences are included as available Decals. Only available for Decal Layers.

### [scaleable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L896)


Flag to set whether Decals on this layer are scaleable. Only available for Decal Layers.

### [rotatable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L901)


Flag to set whether Decals on this layer are rotatable. Only available for Decal Layers.

### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L906)


Array of Value Templates for a Decal Layer. Only available for Decal Layers.

---
## [Class ProjectEntity](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L978)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1013)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1017)



### [limit](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1021)



### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1025)



### [origin](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1029)



### [originAnchored](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1033)



### [shape](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1037)



### [color](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1041)



### [tileX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1045)



### [tileY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1049)



### [tileSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1053)



### [resizeableX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1057)



### [resizeableY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1061)



### [rotatable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1065)



### [rotationDegrees](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1069)



### [canFlipX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1073)



### [canFlipY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1077)



### [canSetColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1081)



### [hasNodes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1085)



### [nodeLimit](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1089)



### [nodeDisplay](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1093)



### [nodeGhost](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1097)



### [tags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1101)



### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1105)



### [texture](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1109)



### [textureImage](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1113)



---
## [Class ProjectTileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1179)



## API

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1195)


Name of the Tileset.

### [path](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1200)


Path to the Tileset image, relative to the Project's path.

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1205)


Base64 version of the Tileset image.

### [tileWidth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1210)


Width of a Tile in this Tileset.

### [tileHeight](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1215)


Height of a Tile in this Tileset.

### [tile](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1220)


Size object of a tile

### [tileSeparationX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1226)


Empty pixels that separate each Tile on the X axis in this Tileset image.

### [tileSeparationY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1231)


Empty pixels that separate each Tile on the Y axis in this Tileset image.

### [tileSeparation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1236)


Point object of a tile

---
## [Class LevelEntity](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1284)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1307)



### [id](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1311)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1315)



### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1319)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1323)



### [position](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1328)



### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1332)



### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1336)



### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1341)



### [originX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1345)



### [originY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1349)



### [origin](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1354)



### [rotation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1358)



### [flippedX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1362)



### [flippedY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1366)



### [flipped](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1373)


`flippedX` and `flippedY` as a `Point` instance
- Example: `flipped.x, flipped.y`

### [nodes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1377)



### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1381)



---
## [Class LevelDecal](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1445)



## API

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1459)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1463)



### [texture](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1467)



### [rotation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1471)



### [scaleX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1475)



### [scaleY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1479)



### [scale](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1483)



### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1549)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1553)



### [offsetX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1557)



### [offsetY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1561)



### [offset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1565)



### [gridCellWidth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1569)



### [gridCellHeight](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1573)



### [gridCell](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1577)



### [gridCellsX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1581)



### [gridCellsY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1585)



### [data](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1594)



### [data2D](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1598)



### [dataCoords](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1602)



### [dataCoords2D](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1606)



### [grid](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1610)



### [grid2D](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1614)



### [entities](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1618)



### [decals](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1622)



### [exportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1626)



### [arrayMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1630)



### [tileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1634)



### [folder](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1638)


