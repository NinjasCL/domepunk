<!-- file: domepunk/utils/ogmo.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## [Ogmo](https://ogmo-editor-3.github.io/)
Utility Classes for Parsing Ogmo Json files.

Based on https://github.com/Ogmo-Editor-3/ogmo-3-lib

- Example:
```js
import "domepunk/utils/ogmo" for Project, Level

// symlinks
import "domepunk/utils/ogmo" for OgmoProject, OgmoLevel
import "domepunk/utils/ogmo" for OPrj, OLvl
```
- Since: 1.0.0
- Dome: 1.4.0
- Ogmo: 3.2.2

---
## [Class Point](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L29)



## API

### [x](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L36)



### [y](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L40)



---
## [Class Size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L55)



## API

### [width](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L64)



### [height](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L68)



---
## [Class Shape](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L87)



## API

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L95)


- Signature: label: String

### [points](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L105)


- Signature: points: [Point]

---
## [Class OgmoColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L128)



## API

### [color](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L132)


- Signature: `color: Color`

---
## [Class ProjectValue](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L144)


Data structure value for level, layers, entity

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L163)


Name of the Value Template.

### [definition](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L168)


Definition of the Value Template.

### [defaults](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L173)


Default value(s) for the Value Template.

### [bounded](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L178)


Flag to set if the value is bounded with a min/max. Only available for Int and Float Value Templates.

### [min](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L183)


Minimum value of a Float or Int. Only available for Int and Float Value Templates.

### [max](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L188)


Maximum value of a Float or Int. Only available for Int and Float Value Templates.

### [maxLength](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L193)


Maximum length of a String. Only available for String Value Template.

### [trimWhitespace](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L198)


Flag to set whether to remove whitespace from a String. Only available for String Value Template.

### [choices](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L203)


Available options of an Enum. Only available for Enum Value Template.

### [includeAlpha](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L208)


Flag to get whether to include the Alpha component on a Color. Only available for Color Value Template.

---
## [Class ProjectLayer](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L260)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L284)


Name of the Layer Template.

### [definition](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L289)


Definition of the Layer Template.

### [gridSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L294)


Size of each cell in the Layer's Grid.

### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L299)


Unique Export ID of the Layer.

### [exportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L305)


Enum to determine whether a Tile Layer exports it's Tile Data with IDs or Coords.
Only available for Tile Layers.

### [arrayMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L310)


Enum to determine whether a Tile or Grid Layer exports it's Data as a 1D Array or a 2D Array. Only available for Tile and Grid Layers.

### [defaultTileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L315)


Name of this Layer's default Tilemap. Only available for Tile Layers.

### [legend](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L320)


String Map describing a Grid Layers available Grid Cells. Only available for Grid Layers.

### [requiredTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L325)


Array of Entity Tags that filters out any Entities that DO NOT have any of the Tags described. Only available for Entity Layers.

### [excludedTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L335)


Array of Entity Tags that filters out any Entities that DO have any of the Tags described. Only available for Entity Layers.

### [folder](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L345)


Directory to search for Decal images. Only available for Decal Layers.

### [includeImageSequence](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L350)


Flag to set whether image sequences are included as available Decals. Only available for Decal Layers.

### [scaleable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L355)


Flag to set whether Decals on this layer are scaleable. Only available for Decal Layers.

### [rotatable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L360)


Flag to set whether Decals on this layer are rotatable. Only available for Decal Layers.

### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L365)


Array of Value Templates for a Decal Layer. Only available for Decal Layers.

---
## [Class ProjectEntity](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L437)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L471)



### [exportID](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L475)



### [limit](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L479)



### [size](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L483)



### [origin](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L487)



### [originAnchored](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L491)



### [shape](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L495)



### [color](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L499)



### [tileX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L503)



### [tileY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L507)



### [tileSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L511)



### [resizeableX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L515)



### [resizeableY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L519)



### [rotatable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L523)



### [rotationDegrees](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L527)



### [canFlipX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L531)



### [canFlipY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L535)



### [canSetColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L539)



### [hasNodes](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L543)



### [nodeLimit](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L547)



### [nodeDisplay](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L551)



### [nodeGhost](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L555)



### [tags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L559)



### [values](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L563)



### [texture](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L567)



### [textureImage](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L571)



---
## [Class ProjectTileset](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L637)



## API

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L653)


Name of the Tileset.

### [path](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L658)


Path to the Tileset image, relative to the Project's path.

### [image](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L663)


Base64 version of the Tileset image.

### [tileWidth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L668)


Width of a Tile in this Tileset.

### [tileHeight](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L673)


Height of a Tile in this Tileset.

### [tile](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L678)


Size object of a tile

### [tileSeparationX](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L684)


Empty pixels that separate each Tile on the X axis in this Tileset image.

### [tileSeparationY](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L689)


Empty pixels that separate each Tile on the Y axis in this Tileset image.

### [tileSeparation](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L694)


Point object of a tile

---
## [Class Project](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L741)



## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L767)


The Name of the Ogmo Project.

### [version](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L772)


The version of Ogmo used

### [levelPaths](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L778)


Array of paths that hold the Project's levels.

### [backgroundColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L783)


The Project's background color.

### [gridColor](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L791)


The color of the Grid displayed in the Project's Editor

### [anglesRadians](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L800)


Flag to set whether the Project describes rotations in Radians or Degrees.
If set to `true` its in Radians. Otherwise it is in Degrees.

### [defaultExportMode](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L805)


Sets the default exported file type of a Level.

### [directoryDepth](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L810)


Maximum Depth that the Editor will search for files for its File Tree.

### [levelDefaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L815)


Default size of newly created levels in the Editor.

### [levelMinSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L820)


Minimum size a level can be.

### [levelMaxSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L825)


Maximum size a level can be.

### [levelValues](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L830)


Array of Value Templates for the Project's Levels.

### [entityTags](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L835)


Array containing all of the Project's available Entity Tags.

### [layers](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L840)


Array containing all of the Project's available Layer Templates.

### [entities](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L845)


Array containing all of the Project's available Entity Templates.

### [tilesets](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L850)


Array containing all of the Project's available Tilesets.

### [layerGridDefaultSize](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L854)



### [construct load(path)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L862)


Creates an Ogmo Project from `.ogmo` data.
- Signature: static load(path:String) -> Project
- Parameter path: String to the file holding Ogmo data.
- Returns: Project parsed from Ogmo file.

### [entity(exportID)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L895)


Attempts to get an ProjectEntity from an exportID.
- Parameter exportID: The export id
- Returns: ProjectEntity or null

### [layer(exportID)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L909)


Attempts to get an ProjectLayer from an exportID.
- Parameter exportID: The export id
- Returns: ProjectLayer or null

### [tileset(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/ogmo.wren#L923)


Attempts to get an ProjectTileset from an exportID.
- Parameter name: The tileset name
- Returns: ProjectTileset or null
