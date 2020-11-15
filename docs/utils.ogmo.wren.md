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
## [Class Project](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L48)


```js
import "domepunk/utils/ogmo" for Project

// alias
import "domepunk/utils/ogmo" for OgmoProject, OProj
```

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L74)


The Name of the Ogmo Project.

### [version](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L79)


The version of Ogmo used

### [levelPaths](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L85)


Array of paths that hold the Project's levels.

### [backgroundColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L90)


The Project's background color.

### [gridColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L98)


The color of the Grid displayed in the Project's Editor

### [anglesRadians](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L107)


Flag to set whether the Project describes rotations in Radians or Degrees.
If set to `true` its in Radians. Otherwise it is in Degrees.

### [defaultExportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L112)


Sets the default exported file type of a Level.

### [directoryDepth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L117)


Maximum Depth that the Editor will search for files for its File Tree.

### [levelDefaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L122)


Default size of newly created levels in the Editor.

### [levelMinSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L127)


Minimum size a level can be.

### [levelMaxSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L132)


Maximum size a level can be.

### [levelValues](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L137)


Array of Value Templates for the Project's Levels.

### [entityTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L142)


Array containing all of the Project's available Entity Tags.

### [layers](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L147)


Array containing all of the Project's available Layer Templates.

### [entities](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L152)


Array containing all of the Project's available Entity Templates.

### [tilesets](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L157)


Array containing all of the Project's available Tilesets.

### [layerGridDefaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L161)



### [static load(path)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L219)


Creates an Ogmo Project from `.ogmo` data.
- Signature: static load(path:String) -> Project
- Parameter path: String to the file holding Ogmo data.
- Returns: Project parsed from Ogmo file.

### [entity(exportID)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L229)


Attempts to get an ProjectEntity from an exportID.
- Parameter exportID: The export id
- Returns: ProjectEntity or null

### [layer(exportID)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L243)


Attempts to get an ProjectLayer from an exportID.
- Parameter exportID: The export id
- Returns: ProjectLayer or null

### [tileset(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L257)


Attempts to get an ProjectTileset from an exportID.
- Parameter name: The tileset name
- Returns: ProjectTileset or null

---
## [Class Level](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L278)


```js
import "domepunk/utils/ogmo" for Level

// alias
import "domepunk/utils/ogmo" for OgmoLevel, OLevel
```

## API

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L293)


Width of the Level.

### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L298)


Height of the Level.

### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L303)


Size (width, height)

### [offsetX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L308)


Offset of the Level on the X axis. Useful for loading multiple chunked Levels.

### [offsetY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L313)


Offset of the Level on the Y axis. Useful for loading multiple chunked Levels.

### [offset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L318)


Point (offsetX, offsetY)

### [layers](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L323)


Array containing all of the Level's Layer Definitions.

### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L328)


Array containing all of the Level's custom values.

### [onDecalLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L335)


Callback triggered when a Decal layer is found after calling `load()` on a Level.
The first argument is an Array holding the Layer's Decal Definitions.
The second argument is the Layer Definition itself.

### [onEntityLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L351)


k triggered when an Entity layer is found after calling `load()` on a Level.
The first argument is an Array holding the Layer's Entity Definitions.
The second argument is the Layer Definition itself.

### [onGridLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L366)


Callback triggered when a Grid layer exported with a 1D Data Array is found after calling `load()` on a Level.
The first argument is a 1D Array holding the Layer's Grid Data.
The second argument is the Layer Definition itself.

### [onGrid2DLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L381)


Callback triggered when a Grid layer exported with a 2D Data Array is found after calling `load()` on a Level.
The first argument is a 2D Array holding the Layer's Grid Data.
The second argument is the Layer Definition itself.

### [onTileLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L396)


Callback triggered when a Tile layer exported with a 1D Data Array containing Tile IDs is found after calling `load()` on a Level.
The first argument is a 1D Array holding the Layer's Tile ID Data.
The second argument is the Layer Definition itself.

### [onTile2DLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L411)


Callback triggered when a Tile layer exported with a 2D Data Array containing Tile IDs is found after calling `load()` on a Level.
The first argument is a 2D Array holding the Layer's Tile ID Data.
The second argument is the Layer Definition itself.

### [onTileCoordsLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L426)


Callback triggered when a Tile layer exported with a 2D Data Array containing Tile Coords is found after calling `load()` on a Level.
The first argument is a 2D Array holding the Layer's Tile Cordinate Data.
The second argument is the Layer Definition itself.

### [onTileCoords2DLayerLoaded = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L441)


Callback triggered when a Tile layer exported with a 3D Data Array containing Tile Coords is found after calling `load()` on a Level.
The first argument is a 3D Array holding the Layer's Tile Coords Data.
The second argument is the Layer Definition itself.

### [init()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L463)


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

### [static load(path)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L548)


Creates a Level with `.json` data from Ogmo.
- Signature: static load(Path:String) -> Level
- Parameter path: Path string holding Ogmo Level Json data.
- Returns: Level parsed from Json.

---
## [Class Point](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L561)



## API

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L568)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L572)



---
## [Class Size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L587)



## API

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L596)



### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L600)



---
## [Class Shape](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L619)



## API

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L627)


- Signature: label: String

### [points](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L637)


- Signature: points: [Point]

---
## [Class OgmoColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L660)



## API

### [color](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L664)


- Signature: `color: Color`

---
## [Class ProjectValue](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L677)


Data structure value for level, layers, entity

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L696)


Name of the Value Template.

### [definition](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L701)


Definition of the Value Template.

### [defaults](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L706)


Default value(s) for the Value Template.

### [bounded](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L711)


Flag to set if the value is bounded with a min/max. Only available for Int and Float Value Templates.

### [min](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L716)


Minimum value of a Float or Int. Only available for Int and Float Value Templates.

### [max](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L721)


Maximum value of a Float or Int. Only available for Int and Float Value Templates.

### [maxLength](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L726)


Maximum length of a String. Only available for String Value Template.

### [trimWhitespace](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L731)


Flag to set whether to remove whitespace from a String. Only available for String Value Template.

### [choices](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L736)


Available options of an Enum. Only available for Enum Value Template.

### [includeAlpha](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L741)


Flag to get whether to include the Alpha component on a Color. Only available for Color Value Template.

---
## [Class ProjectLayer](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L793)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L818)


Name of the Layer Template.

### [definition](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L823)


Definition of the Layer Template.

### [gridSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L828)


Size of each cell in the Layer's Grid.

### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L833)


Unique Export ID of the Layer.

### [exportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L839)


Enum to determine whether a Tile Layer exports it's Tile Data with IDs or Coords.
Only available for Tile Layers.

### [arrayMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L844)


Enum to determine whether a Tile or Grid Layer exports it's Data as a 1D Array or a 2D Array. Only available for Tile and Grid Layers.

### [defaultTileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L849)


Name of this Layer's default Tilemap. Only available for Tile Layers.

### [legend](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L854)


String Map describing a Grid Layers available Grid Cells. Only available for Grid Layers.

### [requiredTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L859)


Array of Entity Tags that filters out any Entities that DO NOT have any of the Tags described. Only available for Entity Layers.

### [excludedTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L869)


Array of Entity Tags that filters out any Entities that DO have any of the Tags described. Only available for Entity Layers.

### [folder](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L879)


Directory to search for Decal images. Only available for Decal Layers.

### [includeImageSequence](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L884)


Flag to set whether image sequences are included as available Decals. Only available for Decal Layers.

### [scaleable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L889)


Flag to set whether Decals on this layer are scaleable. Only available for Decal Layers.

### [rotatable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L894)


Flag to set whether Decals on this layer are rotatable. Only available for Decal Layers.

### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L899)


Array of Value Templates for a Decal Layer. Only available for Decal Layers.

---
## [Class ProjectEntity](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L971)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1006)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1010)



### [limit](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1014)



### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1018)



### [origin](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1022)



### [originAnchored](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1026)



### [shape](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1030)



### [color](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1034)



### [tileX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1038)



### [tileY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1042)



### [tileSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1046)



### [resizeableX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1050)



### [resizeableY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1054)



### [rotatable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1058)



### [rotationDegrees](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1062)



### [canFlipX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1066)



### [canFlipY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1070)



### [canSetColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1074)



### [hasNodes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1078)



### [nodeLimit](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1082)



### [nodeDisplay](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1086)



### [nodeGhost](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1090)



### [tags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1094)



### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1098)



### [texture](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1102)



### [textureImage](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1106)



---
## [Class ProjectTileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1172)



## API

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1188)


Name of the Tileset.

### [path](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1193)


Path to the Tileset image, relative to the Project's path.

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1198)


Base64 version of the Tileset image.

### [tileWidth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1203)


Width of a Tile in this Tileset.

### [tileHeight](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1208)


Height of a Tile in this Tileset.

### [tile](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1213)


Size object of a tile

### [tileSeparationX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1219)


Empty pixels that separate each Tile on the X axis in this Tileset image.

### [tileSeparationY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1224)


Empty pixels that separate each Tile on the Y axis in this Tileset image.

### [tileSeparation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1229)


Point object of a tile

---
## [Class LevelEntity](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1277)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1300)



### [id](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1304)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1308)



### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1312)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1316)



### [position](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1321)



### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1325)



### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1329)



### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1334)



### [originX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1338)



### [originY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1342)



### [origin](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1347)



### [rotation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1351)



### [flippedX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1355)



### [flippedY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1359)



### [flipped](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1366)


`flippedX` and `flippedY` as a `Point` instance
- Example: `flipped.x, flipped.y`

### [nodes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1370)



### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1374)



---
## [Class LevelDecal](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1438)



## API

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1452)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1456)



### [texture](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1460)



### [rotation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1464)



### [scaleX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1468)



### [scaleY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1472)



### [scale](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1476)



### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1542)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1546)



### [offsetX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1550)



### [offsetY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1554)



### [offset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1558)



### [gridCellWidth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1562)



### [gridCellHeight](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1566)



### [gridCell](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1570)



### [gridCellsX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1574)



### [gridCellsY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1578)



### [data](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1587)



### [data2D](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1591)



### [dataCoords](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1595)



### [dataCoords2D](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1599)



### [grid](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1603)



### [grid2D](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1607)



### [entities](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1611)



### [decals](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1615)



### [exportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1619)



### [arrayMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1623)



### [tileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1627)



### [folder](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L1631)


