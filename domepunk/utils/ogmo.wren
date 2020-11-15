/** doc-name: utils.ogmo.wren */
import "json" for Json
import "graphics" for Color

/** doc-header
## [Ogmo](https://ogmo-editor-3.github.io/)
Utility Classes for Parsing Ogmo Json files.

Based on https://github.com/Ogmo-Editor-3/ogmo-3-lib

- Example:
```js
import "ogmo" for Project, Level

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
*/

// MARK: - Core Classes

/**
```js
import "domepunk/utils/ogmo" for Project

// alias
import "domepunk/utils/ogmo" for OgmoProject, OProj
```
*/
class Project {

  toString {Json.encode(toMap)}
  toMap {{
    "name": name,
    "ogmoVersion": ogmoVersion,
    "levelPaths": levelPaths,
    "backgroundColor": backgroundColor.toString,
    "gridColor": gridColor.toString,
    "anglesRadians": anglesRadians,
    "defaultExportMode": defaultExportMode,
    "directoryDepth": directoryDepth,
    "levelDefaultSize": levelDefaultSize,
    "levelMinSize": levelMinSize,
    "levelMaxSize": levelMaxSize,
    "levelValues": levelValues,
    "entityTags": entityTags,
    "layers": layers,
    "entities": entities,
    "tilesets": tilesets,
    "layerGridDefaultSize": layerGridDefaultSize
  }}

  /**
  The Name of the Ogmo Project.
  */
  name {_name}

  /**
  The version of Ogmo used
  */
  version {_ogmoVersion}
  ogmoVersion {_ogmoVersion}

  /**
  Array of paths that hold the Project's levels.
  */
  levelPaths {_levelPaths}

  /**
  The Project's background color.
  */
  backgroundColor {_backgroundColor}
  backgroundColor = (value) {
    _backgroundColor = OgmoColor.new(value)
  }

  /**
  The color of the Grid displayed in the Project's Editor
  */
  gridColor {_gridColor}
  gridColor = (value) {
    _gridColor = OgmoColor.new(value)
  }

  /**
  Flag to set whether the Project describes rotations in Radians or Degrees.
  If set to `true` its in Radians. Otherwise it is in Degrees.
  */
  anglesRadians {_anglesRadians}

  /**
  Sets the default exported file type of a Level.
  */
  defaultExportMode {_defaultExportMode}

  /**
  Maximum Depth that the Editor will search for files for its File Tree.
  */
  directoryDepth {_directoryDepth}

  /**
  Default size of newly created levels in the Editor.
  */
  levelDefaultSize {_levelDefaultSize}

  /**
  Minimum size a level can be.
  */
  levelMinSize {_levelMinSize}

  /**
  Maximum size a level can be.
  */
  levelMaxSize {_levelMaxSize}

  /**
  Array of Value Templates for the Project's Levels.
  */
  levelValues {_levelValues}

  /**
  Array containing all of the Project's available Entity Tags.
  */
  entityTags {_entityTags}

  /**
  Array containing all of the Project's available Layer Templates.
  */
  layers {_layers}

  /**
  Array containing all of the Project's available Entity Templates.
  */
  entities {_entities}

  /**
  Array containing all of the Project's available Tilesets.
  */
  tilesets {_tilesets}

  /**
  */
  layerGridDefaultSize {_layerGridDefaultSize}

  construct new(params) {
    _name = params["name"]
    _ogmoVersion = params["ogmoVersion"]
    _levelPaths = params["levelPaths"]

    backgroundColor = params["backgroundColor"]
    gridColor = params["gridColor"]

    _anglesRadians = params["anglesRadians"]
    _defaultExportMode = params["defaultExportMode"]
    _directoryDepth = params["directoryDepth"]
    _entityTags = params["entityTags"]
    _levelDefaultSize = params["levelDefaultSize"]
    _levelMinSize = params["levelMinSize"]
    _levelMaxSize = params["levelMaxSize"]
    _layerGridDefaultSize = params["layerGridDefaultSize"]
    _levelValues = params["levelValues"]
    _layers = params["layers"]
    _entities = params["entities"]
    _tilesets = params["tilesets"]
  }

  static fromJson(json) {
    var params = {
      "name": json["name"],
      "ogmoVersion": json["ogmoVersion"],

      "levelPaths": json["levelPaths"],

      "backgroundColor": json["backgroundColor"],
      "gridColor": json["gridColor"],

      "anglesRadians": json["anglesRadians"],
      "deaultExportMode": json["defaultExportMode"],
      "directoryDepth": json["directoryDepth"],
      "entityTags": json["entityTags"],

      "levelDefaultSize": Size.fromJson(json["levelDefaultSize"]),
      "levelMinSize": Size.fromJson(json["levelMinSize"]),
      "levelMaxSize": Size.fromJson(json["levelMaxSize"]),
      "levelGridDefaultSize": Size.fromJson(json["levelGridDefaultSize"]),

      "levelValues": ProjectValue.listFromJson(json["levelValues"]),
      "layers": ProjectLayer.listFromJson(json["layers"]),
      "entities": ProjectEntity.listFromJson(json["entities"]),
      "tilesets": ProjectTileset.listFromJson(json["tilesets"])
    }
    return Project.new(params)
  }

  /**
  Creates an Ogmo Project from `.ogmo` data.
  - Signature: static load(path:String) -> Project
  - Parameter path: String to the file holding Ogmo data.
  - Returns: Project parsed from Ogmo file.
  */
  static load(path) {
    var json = Json.load(path)
    return Project.fromJson(json)
  }

  /**
  Attempts to get an ProjectEntity from an exportID.
  - Parameter exportID: The export id
  - Returns: ProjectEntity or null
  */
  entity(exportID) {
    for (entity in entities) {
      if (entity.exportID == exportID) {
        return entity
      }
    }
    return null
  }

  /**
  Attempts to get an ProjectLayer from an exportID.
  - Parameter exportID: The export id
  - Returns: ProjectLayer or null
  */
  layer(exportID) {
    for (layer in layers) {
      if (layer.exportID == exportID) {
        return layer
      }
    }
    return null
  }

  /**
  Attempts to get an ProjectTileset from an exportID.
  - Parameter name: The tileset name
  - Returns: ProjectTileset or null
  */
  tileset(name) {
    for (tileset in tilesets) {
      if (tileset.label == name) {
        return tileset
      }
    }
    return null
  }
}

var OgmoProject = Project
var OProj = Project

/**
```js
import "domepunk/utils/ogmo" for Level

// alias
import "domepunk/utils/ogmo" for OgmoLevel, OLevel
```
*/
class Level {

  toString {Json.encode(toMap)}
  toMap {{
    "width": width,
    "height": height,
    "offsetX": offsetX,
    "offsetY": offsetY,
    "layers": layers,
    "values": values
  }}

  /**
  Width of the Level.
  */
  width {_width}

  /**
  Height of the Level.
  */
  height {_height}

  /**
  Size (width, height)
  */
  size {Size.new(width, height)}

  /**
  Offset of the Level on the X axis. Useful for loading multiple chunked Levels.
  */
  offsetX {_offsetX}

  /**
  Offset of the Level on the Y axis. Useful for loading multiple chunked Levels.
  */
  offsetY {_offsetY}

  /**
  Point (offsetX, offsetY)
  */
  offset {Point.new(offsetX, offsetY)}

  /**
  Array containing all of the Level's Layer Definitions.
  */
  layers {_layers}

  /**
  Array containing all of the Level's custom values.
  */
  values {_values}

  /**
  Callback triggered when a Decal layer is found after calling `load()` on a Level.
  The first argument is an Array holding the Layer's Decal Definitions.
  The second argument is the Layer Definition itself.
  */
  onDecalLayerLoaded = (value) {
    _onDecalLayerLoaded = value
  }

  // Support block syntax
  onDecalLayerLoaded (value) {
    onDecalLayerLoaded = value
  }

  decalLayerLoaded {_onDecalLayerLoaded}

  /**
  k triggered when an Entity layer is found after calling `load()` on a Level.
  The first argument is an Array holding the Layer's Entity Definitions.
  The second argument is the Layer Definition itself.
  */
  onEntityLayerLoaded = (value) {
    _onEntityLayerLoaded = value
  }

  onEntityLayerLoaded (value) {
    onEntityLayerLoaded = value
  }

  entityLayerLoaded {_onEntityLayerLoaded}

  /**
  Callback triggered when a Grid layer exported with a 1D Data Array is found after calling `load()` on a Level.
  The first argument is a 1D Array holding the Layer's Grid Data.
  The second argument is the Layer Definition itself.
  */
  onGridLayerLoaded = (value) {
    _onGridLayerLoaded = value
  }

  onGridLayerLoaded (value) {
    onGridLayerLoaded = value
  }

  gridLayerLoaded {_onGridLayerLoaded}

  /**
  Callback triggered when a Grid layer exported with a 2D Data Array is found after calling `load()` on a Level.
  The first argument is a 2D Array holding the Layer's Grid Data.
  The second argument is the Layer Definition itself.
  */
  onGrid2DLayerLoaded = (value) {
    _onGrid2DLayerLoaded = value
  }

  onGrid2DLayerLoaded (value) {
    onGrid2DLayerLoaded = value
  }

  grid2DLayerLoaded {_onGrid2DLayerLoaded}

  /**
  Callback triggered when a Tile layer exported with a 1D Data Array containing Tile IDs is found after calling `load()` on a Level.
  The first argument is a 1D Array holding the Layer's Tile ID Data.
  The second argument is the Layer Definition itself.
  */
  onTileLayerLoaded = (value) {
    _onTileLayerLoaded = value
  }

  onTileLayerLoaded (value) {
    onTileLayerLoaded = value
  }

  tileLayerLoaded {_onTileLayerLoaded}

  /**
  Callback triggered when a Tile layer exported with a 2D Data Array containing Tile IDs is found after calling `load()` on a Level.
  The first argument is a 2D Array holding the Layer's Tile ID Data.
  The second argument is the Layer Definition itself.
  */
  onTile2DLayerLoaded = (value) {
    _onTile2DLayerLoaded = value
  }

  onTile2DLayerLoaded (value) {
    onTile2DLayerLoaded = value
  }

  tile2DLayerLoaded {_onTile2DLayerLoaded}

  /**
  Callback triggered when a Tile layer exported with a 2D Data Array containing Tile Coords is found after calling `load()` on a Level.
  The first argument is a 2D Array holding the Layer's Tile Cordinate Data.
  The second argument is the Layer Definition itself.
  */
  onTileCoordsLayerLoaded = (value) {
    _onTileCoordsLayerLoaded = value
  }

  onTileCoordsLayerLoaded (value) {
    onTileCoordsLayerLoaded = value
  }

  tileCoordsLayerLoaded {_onTileCoordsLayerLoaded}

  /**
  Callback triggered when a Tile layer exported with a 3D Data Array containing Tile Coords is found after calling `load()` on a Level.
  The first argument is a 3D Array holding the Layer's Tile Coords Data.
  The second argument is the Layer Definition itself.
  */
  onTileCoords2DLayerLoaded = (value) {
    _onTileCoords2DLayerLoaded = value
  }

  onTileCoords2DLayerLoaded (value) {
    onTileCoords2DLayerLoaded = value
  }

  tileCoords2DLayerLoaded {_onTileCoords2DLayerLoaded}

  /**
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
  */
  init() {
    for (layer in layers) {
      if (layer.data) {
        if (tileLayerLoaded is Fn || tileLayerLoaded is Fiber) {
          tileLayerLoaded.call(layer.data, layer)
        }
      }

      if (layer.data2D) {
        if (tile2DLayerLoaded is Fn || tile2DLayerLoaded is Fiber) {
          tile2DLayerLoaded.call(layer.data2D, layer)
        }
      }

      if (layer.dataCoords) {
        if (tileCoordsLayerLoaded is Fn || tileCoordsLayerLoaded is Fiber) {
          tileCoordsLayerLoaded.call(layer.dataCoords, layer)
        }
      }

      if (layer.dataCoords2D) {
        if (tileCoords2DLayerLoaded is Fn || tileCoords2DLayerLoaded is Fiber) {
          tileCoords2DLayerLoaded.call(layer.dataCoords2D, layer)
        }
      }

      if (layer.grid) {
        if (gridLayerLoaded is Fn || gridLayerLoaded is Fiber) {
          gridLayerLoaded.call(layer.grid, layer)
        }
      }

      if (layer.grid2D) {
        if (grid2DLayerLoaded is Fn || grid2DLayerLoaded is Fiber) {
          grid2DLayerLoaded.call(layer.grid2D, layer)
        }
      }

      if (layer.decals) {
        if (decalLayerLoaded is Fn || decalLayerLoaded is Fiber) {
          decalLayerLoaded.call(layer.decals, layer)
        }
      }

      if (layer.entities) {
        if (entityLayerLoaded is Fn || entityLayerLoaded is Fiber) {
          entityLayerLoaded.call(layer.entities, layer)
        }
      }
    }
  }

  construct new(
    width,
    height,
    offsetX,
    offsetY,
    layers,
    values) {
    _width = width
    _height = height
    _offsetX = offsetX
    _offsetY = offsetY
    _layers = layers
    _values = values
  }

  construct fromJson(json) {
    var layers = LevelLayer.listFromJson(json["layers"])
    return Level.new(
      json["width"],
      json["height"],
      json["offsetX"],
      json["offsetY"],
      layers,
      json["values"]
    )
  }

  /**
  Creates a Level with `.json` data from Ogmo.
  - Signature: static load(Path:String) -> Level
  - Parameter path: Path string holding Ogmo Level Json data.
  - Returns: Level parsed from Json.
  */
  static load(path) {
    var json = Json.load(path)
    return Level.fromJson(json)
  }
}

var OgmoLevel = Level
var OLevel = Level

// MARK: Helper Classes

/**
*/
class Point {

  toString {Json.encode(toMap)}
  toMap {{"x":x, "y":y}}

  /**
  */
  x {_x}

  /**
  */
  y {_y}

  construct new(x, y) {
    _x = x
    _y = y
  }

  static fromJson(json) {
    json = json || {}
    return Point.new(json["x"], json["y"])
  }
}

/**
*/
class Size {

  toString {Json.encode(toMap)}

  // use x and y to be compatible with ogmo format
  toMap {{"x": width, "y": height}}

  /**
  */
  width {_width}

  /**
  */
  height {_height}

  // aliases
  x {_width}
  y {_height}

  construct new(width, height) {
    _width = width
    _height = height
  }

  static fromJson(json) {
    json = json || {}
    return Size.new(json["x"], json["y"])
  }
}

/**
*/
class Shape {

  toString {Json.encode(toMap)}
  toMap {{"label":label, "points":points}}

  /**
  - Signature: label: String
  */
  label {
    if (!_label) {
      _label = ""
    }
    return _label
  }

  /**
  - Signature: points: [Point]
  */
  points {
    if (!_points) {
      _points = []
    }
    return _points
  }

  construct new(label, points) {
    _label = label
    _points = points
  }

  static fromJson(json) {
    var points = []
    for (point in json["points"]) {
      points.add(Point.fromJson(point))
    }
    return Shape.new(json["label"], points)
  }
}

/**
*/
class OgmoColor {
  /**
  - Signature: `color: Color`
  */
  color {_color}
  toString {_raw}

  construct new(color) {
    _color = Color.hex(color) || Color.rgb(color) || color
    _raw = color.toString
  }
}

// MARK: Project Inner Classes
/**
Data structure value for level, layers, entity
*/
class ProjectValue {

  toString {Json.encode(toMap)}
  toMap {{
    "name": name,
    "definition": definition,
    "defaults": defaults,
    "bounded": bounded,
    "min": min,
    "max": max,
    "maxLength": maxLength,
    "trimWhitespace": trimWhitespace,
    "choices": choices,
    "includeAlpha": includeAlpha
  }}

  /**
  Name of the Value Template.
  */
  name {_name}

  /**
  Definition of the Value Template.
  */
  definition {_definition}

  /**
  Default value(s) for the Value Template.
  */
  defaults {_defaults}

  /**
  Flag to set if the value is bounded with a min/max. Only available for Int and Float Value Templates.
  */
  bounded {_bounded}

  /**
  Minimum value of a Float or Int. Only available for Int and Float Value Templates.
  */
  min {_min}

  /**
  Maximum value of a Float or Int. Only available for Int and Float Value Templates.
  */
  max {_max}

  /**
  Maximum length of a String. Only available for String Value Template.
  */
  maxLength {_maxLength}

  /**
  Flag to set whether to remove whitespace from a String. Only available for String Value Template.
  */
  trimWhitespace {_trimWhitespace}

  /**
  Available options of an Enum. Only available for Enum Value Template.
  */
  choices {_choices}

  /**
  Flag to get whether to include the Alpha component on a Color. Only available for Color Value Template.
  */
  includeAlpha {_includeAlpha}

  construct new(
    name,
    definition,
    defaults,
    bounded,
    min,
    max,
    maxLength,
    trimWhitespace,
    choices,
    includeAlpha) {
    _name = name
    _definition = definition
    _defaults = defaults
    _bounded = bounded
    _min = min
    _max = max
    _maxLength = maxLength
    _trimWhitespace = trimWhitespace
    _choices = choices
    _includeAlpha = includeAlpha
  }

  static fromJson(json) {
    return ProjectValue.new(
      json["name"],
      json["definition"],
      json["defaults"],
      json["bounded"],
      json["min"],
      json["max"],
      json["maxLength"],
      json["trimWhitespace"],
      json["choices"],
      json["includeAlpha"]
    )
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(ProjectValue.fromJson(json))
    }
    return items
  }
}

/**
*/
class ProjectLayer {

  toString {Json.encode(toMap)}
  toMap {{
    "name": name,
    "definition": definition,
    "gridSize": gridSize,
    "exportID": exportID,
    "_eid": exportID,
    "exportMode": exportMode,
    "arrayMode": arrayMode,
    "defaultTileset": defaultTileset,
    "legend": legend,
    "requiredTags": requiredTags,
    "excludedTags": excludedTags,
    "folder": folder,
    "includeImageSequence": includeImageSequence,
    "scaleable": scaleable,
    "rotatable": rotatable,
    "values": values
  }}

  /**
  Name of the Layer Template.
  */
  name {_name}

  /**
  Definition of the Layer Template.
  */
  definition {_definition}

  /**
  Size of each cell in the Layer's Grid.
  */
  gridSize {_gridSize}

  /**
  Unique Export ID of the Layer.
  */
  exportID {_exportID}

  /**
  Enum to determine whether a Tile Layer exports it's Tile Data with IDs or Coords.
  Only available for Tile Layers.
  */
  exportMode {_exportMode}

  /**
  Enum to determine whether a Tile or Grid Layer exports it's Data as a 1D Array or a 2D Array. Only available for Tile and Grid Layers.
  */
  arrayMode {_arrayMode}

  /**
  Name of this Layer's default Tilemap. Only available for Tile Layers.
  */
  defaultTileset {_defaultTileset}

  /**
  String Map describing a Grid Layers available Grid Cells. Only available for Grid Layers.
  */
  legend {_legend}

  /**
  Array of Entity Tags that filters out any Entities that DO NOT have any of the Tags described. Only available for Entity Layers.
  */
  requiredTags {
    if (!_requiredTags) {
      _requiredTags = []
    }
    return _requiredTags
  }

  /**
  Array of Entity Tags that filters out any Entities that DO have any of the Tags described. Only available for Entity Layers.
  */
  excludedTags {
    if (!_excludedTags) {
      _excludedTags = []
    }
    return _excludedTags
  }

  /**
  Directory to search for Decal images. Only available for Decal Layers.
  */
  folder {_folder}

  /**
  Flag to set whether image sequences are included as available Decals. Only available for Decal Layers.
  */
  includeImageSequence {_includeImageSequence}

  /**
  Flag to set whether Decals on this layer are scaleable. Only available for Decal Layers.
  */
  scaleable {_scaleable}

  /**
  Flag to set whether Decals on this layer are rotatable. Only available for Decal Layers.
  */
  rotatable {_rotatable}

  /**
  Array of Value Templates for a Decal Layer. Only available for Decal Layers.
  */
  values {_values}

  construct new(
    name,
    definition,
    gridSize,
    exportID,
    exportMode,
    arrayMode,
    defaultTileset,
    legend,
    requiredTags,
    excludedTags,
    folder,
    includeImageSequence,
    scaleable,
    rotatable,
    values) {
    _name = name
    _definition = definition
    _gridSize = gridSize
    _exportID = exportID
    _exportMode = exportMode
    _arrayMode = arrayMode
    _defaultTileset = defaultTileset
    _legend = legend
    _requiredTags = requiredTags
    _excludedTags = excludedTags
    _folder = folder
    _includeImageSequence = includeImageSequence
    _scaleable = scaleable
    _rotatable = rotatable
    _values = values
  }

  static fromJson(json) {

    var gridSize = Size.fromJson(json["gridSize"])
    var values = ProjectValue.listFromJson(json["values"])

    return ProjectLayer.new(
      json["name"],
      json["definition"],
      gridSize,
      json["exportID"],
      json["exportMode"],
      json["arrayMode"],
      json["defaultTileset"],
      json["legend"],
      json["requiredTags"],
      json["excludedTags"],
      json["folder"],
      json["includeImageSequence"],
      json["scaleable"],
      json["rotatable"],
      values
    )
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(ProjectLayer.fromJson(json))
    }
    return items
  }
}

// TODO: Document
/**
*/
class ProjectEntity {

  toString {Json.encode(toMap)}
  toMap {{
    "name": name,
    "exportID": exportID,
    "_eid": exportID,
    "limit": limit,
    "size": size,
    "origin": origin,
    "originAnchored": originAnchored,
    "shape": shape,
    "color": color.toString,
    "tileX": tileX,
    "tileY": tileY,
    "tileSize": tileSize,
    "resizeableX": resizeableX,
    "resizeableY": resizeableY,
    "rotatable": rotatable,
    "rotationDegrees": rotationDegrees,
    "canFlipX": canFlipX,
    "canFlipY": canFlipY,
    "canSetColor": canSetColor,
    "hasNodes": hasNodes,
    "nodeLimit": nodeLimit,
    "nodeDisplay": nodeDisplay,
    "nodeGhost": nodeGhost,
    "tags": tags,
    "values": values,
    "texture": texture,
    "textureImage": textureImage
  }}

  /**
  */
  name {_name}

  /**
  */
  exportID {_exportID}

  /**
  */
  limit {_limit}

  /**
  */
  size {_size}

  /**
  */
  origin {_origin}

  /**
  */
  originAnchored {_originAnchored}

  /**
  */
  shape {_shape}

  /**
  */
  color {_color}

  /**
  */
  tileX {_tileX}

  /**
  */
  tileY {_tileY}

  /**
  */
  tileSize {_tileSize}

  /**
  */
  resizeableX {_resizeableX}

  /**
  */
  resizeableY {_resizeableY}

  /**
  */
  rotatable {_rotatable}

  /**
  */
  rotationDegrees {_rotationDegrees}

  /**
  */
  canFlipX {_canFlipX}

  /**
  */
  canFlipY {_canFlipY}

  /**
  */
  canSetColor {_canSetColor}

  /**
  */
  hasNodes {_hasNodes}

  /**
  */
  nodeLimit {_nodeLimit}

  /**
  */
  nodeDisplay {_nodeDisplay}

  /**
  */
  nodeGhost {_nodeGhost}

  /**
  */
  tags {_tags}

  /**
  */
  values {_values}

  /**
  */
  texture {_texture}

  /**
  */
  textureImage {_textureImage}

  // Wren supports up to 16 method params.
  construct new(params) {
    _name = params["name"]
    _exportID = params["exportID"]
    _limit = params["limit"]
    _size = params["size"]
    _origin = params["origin"]
    _originAnchored = params["originAnchored"]
    _shape = params["shape"]
    _color = params["color"]
    _tileX = params["tileX"]
    _tileY = params["tileY"]
    _tileSize = params["tileSize"]
    _resizeableX = params["resizeableX"]
    _resizeableY = params["resizeableY"]
    _rotatable = params["rotatable"]
    _rotationDegrees = params["rotationDegrees"]
    _canFlipX = params["canFlipX"]
    _canFlipY = params["canFlipY"]
    _canSetColor = params["canSetColor"]
    _hasNodes = params["hasNodes"]
    _nodeLimit = params["nodeLimit"]
    _nodeDisplay = params["nodeDisplay"]
    _nodeGhost = params["nodeGhost"]
    _tags = params["tags"]
    _values = params["value"]
    _texture = params["texture"]
    _textureImage = params["textureImage"]
  }

  static fromJson(json) {

    var color = OgmoColor.new(json["color"])
    var origin = Point.fromJson(json["origin"])

    var size = Size.fromJson(json["size"])
    var shape = Shape.fromJson(json["shape"])

    var tileSize = Size.fromJson(json["tileSize"])
    var values = ProjectValue.listFromJson(json["values"])

    json["color"] = color
    json["origin"] = origin

    json["size"] = size
    json["shape"] = shape
    json["tileSize"] = tileSize
    json["values"] = values

    return ProjectEntity.new(json)
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(ProjectEntity.fromJson(json))
    }
    return items
  }
}

/**
*/
class ProjectTileset {

  toString {Json.encode(toMap)}
  toMap {{
    "label": label,
    "path": path,
    "image": image,
    "tileWidth": tileWidth,
    "tileHeight": tileHeight,
    "tileSeparationX": tileSeparationX,
    "tileSeparationY": tileSeparationY
  }}

  /**
  Name of the Tileset.
  */
  label {_label}

  /**
  Path to the Tileset image, relative to the Project's path.
  */
  path {_path}

  /**
  Base64 version of the Tileset image.
  */
  image {_image}

  /**
  Width of a Tile in this Tileset.
  */
  tileWidth {_tileWidth}

  /**
  Height of a Tile in this Tileset.
  */
  tileHeight {_tileHeight}

  /**
  Size object of a tile
  */
  tile {_tileSize}
  tileSize {_tileSize}

  /**
  Empty pixels that separate each Tile on the X axis in this Tileset image.
  */
  tileSeparationX {_tileSeparationX}

  /**
  Empty pixels that separate each Tile on the Y axis in this Tileset image.
  */
  tileSeparationY {_tileSeparationY}

  /**
  Point object of a tile
  */
  tileSeparation {_tileSeparation}

  construct new(
    label,
    path,
    image,
    tileWidth,
    tileHeight,
    tileSeparationX,
    tileSeparationY) {

    _label = label
    _path = path
    _image = image
    _tileWidth = tileWidth
    _tileHeight = tileHeight
    _tileSeparationX = tileSeparationX
    _tileSeparationY = tileSeparationY

    _tileSeparation = Point.new(tileSeparationX, tileSeparationY)
    _tileSize = Size.new(tileWidth, tileHeight)
  }

  static fromJson(json) {
    return ProjectTileset.new(
      json["label"],
      json["path"],
      json["image"],
      json["tileWidth"],
      json["tileHeight"],
      json["tileSeparationX"],
      json["tileSeparationY"]
    )
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(ProjectTileset.fromJson(json))
    }
    return items
  }
}

// MARK: - Level
/**
*/
class LevelEntity {

  toString {Json.encode(toMap)}
  toMap {{
    "name":name,
    "id": id,
    "_eid": exportID,
    "exportID": exportID,
    "x": x,
    "y": y,
    "width": width,
    "height": height,
    "originX": originX,
    "originY": originY,
    "rotation": rotation,
    "flippedX": flippedX,
    "flippedY": flippedY,
    "nodes": nodes,
    "values": values
  }}

  /**
  */
  name {_name}

  /**
  */
  id {_id}

  /**
  */
  exportID {_exportID}

  /**
  */
  x {_x}

  /**
  */
  y {_y}

  // Point position
  /**
  */
  position {Point.new(x, y)}

  /**
  */
  width {_width}

  /**
  */
  height {_height}

  // Size size
  /**
  */
  size {Size.new(width, height)}

  /**
  */
  originX {_originX}

  /**
  */
  originY {_originY}

  // Point origin
  /**
  */
  origin {Point.new(originX, originY)}

  /**
  */
  rotation {_rotation}

  /**
  */
  flippedX {_flippedX}

  /**
  */
  flippedY {_flippedY}

  // Point flipped
  /**
  `flippedX` and `flippedY` as a `Point` instance
  - Example: `flipped.x, flipped.y`
  */
  flipped {Point.new(flippedX, flippedY)}

  /**
  */
  nodes {_nodes}

  /**
  */
  values {_values}

  construct new(
    name,
    id,
    exportID,
    x,
    y,
    width,
    height,
    originX,
    originY,
    rotation,
    flippedX,
    flippedY,
    nodes,
    values) {
    _name = name
    _id = id
    _exportID = exportID
    _x = x
    _y = y
    _width = width
    _height = height
    _originX = originX
    _originY = originY
    _rotation = rotation
    _flippedX = flippedX
    _flippedY = flippedY
    _nodes = nodes
    _values = values
  }

  static fromJson(json) {
    return LevelEntity.new(
      json["name"],
      json["id"],
      json["_eid"] || json["exportID"],
      json["x"],
      json["y"],
      json["width"],
      json["height"],
      json["originX"],
      json["originY"],
      json["rotation"],
      json["flippedX"],
      json["flippedY"],
      json["nodes"],
      json["values"]
    )
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(LevelEntity.fromJson(json))
    }
    return items
  }
}

/**
*/
class LevelDecal {

  toString {Json.encode(toMap)}
  toMap {{
    "x": x,
    "y": y,
    "texture": texture,
    "rotation": rotation,
    "scaleX": scaleX,
    "scaleY": scaleY
  }}

  /**
  */
  x {_x}

  /**
  */
  y {_y}

  /**
  */
  texture {_texture}

  /**
  */
  rotation {_rotation}

  /**
  */
  scaleX {_scaleX}

  /**
  */
  scaleY {_scaleY}

  /**
  */
  scale {Point.new(scaleX, scaleY)}

  construct new(
    x,
    y,
    texture,
    rotation,
    scaleX,
    scaleY){
    _x = x
    _y = y
    _texture = texture
    _rotation = rotation
    _scaleX = scaleX
    _scaleY = scaleY
  }

  static fromJson(json) {
    return LevelDecal.new(
      json["x"],
      json["y"],
      json["texture"],
      json["rotation"],
      json["scaleX"],
      json["scaleY"]
    )
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(LevelDecal.fromJson(json))
    }
    return items
  }
}

class LevelLayer {
  toString {Json.encode(toMap)}
  toMap {{
    "name": name,
    "exportID": exportID,
    "_eid": exportID,
    "offsetX": offsetX,
    "offsetY": offsetY,
    "gridCellWidth": gridCellWidth,
    "gridCellHeight": gridCellHeight,
    "gridCellsX": gridCellsX,
    "gridCellsY": gridCellsY,
    "data": data,
    "data2D": data2D,
    "dataCoords": dataCoords,
    "dataCoords2D": dataCoords2D,
    "grid": grid,
    "grid2D": grid2D,
    "entities": entities,
    "decals": decals,
    "exportMode": exportMode,
    "arrayMode": arrayMode,
    "tileset": tileset,
    "folder": folder
  }}

  /**
  */
  name {_name}

  /**
  */
  exportID {_exportID}

  /**
  */
  offsetX {_offsetX}

  /**
  */
  offsetY {_offsetY}

  /**
  */
  offset {Point.new(offsetX, offsetY)}

  /**
  */
  gridCellWidth {_gridCellWidth}

  /**
  */
  gridCellHeight {_gridCellHeight}

  /**
  */
  gridCell {Size.new(gridCellWidth, gridCellHeight)}

  /**
  */
  gridCellsX {_gridCellsX}

  /**
  */
  gridCellsY {_gridCellsY}

  /*
  */
  gridCellsPosition {Point.new(gridCellsX, gridCellsY)}


  /**
  */
  data {_data}

  /**
  */
  data2D {_data2D}

  /**
  */
  dataCoords {_dataCoords}

  /**
  */
  dataCoords2D {_dataCoords2D}

  /**
  */
  grid {_grid}

  /**
  */
  grid2D {_grid2D}

  /**
  */
  entities {_entities}

  /**
  */
  decals {_decals}

  /**
  */
  exportMode {_exportMode}

  /**
  */
  arrayMode {_arrayMode}

  /**
  */
  tileset {_tileset}

  /**
  */
  folder {_folder}

  construct new(params) {
    _exportID = params["_eid"] || params["exportID"]
    _name = params["name"]
    _offsetX = params["offsetX"]
    _offsetY = params["offsetY"]
    _gridCellWidth = params["gridCellWidth"]
    _gridCellHeight = params["gridCellHeight"]
    _gridCellsX = params["gridCellsX"]
    _gridCellsY = params["gridCellsY"]
    _data = params["data"]
    _data2D = params["data2D"]
    _dataCoords = params["dataCoords"]
    _dataCoords2D = params["dataCoords2D"]
    _grid = params["grid"]
    _grid2D = params["grid2D"]
    _entities = params["entities"]
    _decals = params["decals"]
    _exportMode = params["exportMode"]
    _arrayMode = params["arrayMode"]
    _tileset = params["tileset"]
    _folder = params["folder"]
  }

  static fromJson(json) {
    var entities = LevelEntity.listFromJson(json["entities"])
    var decals = LevelDecal.listFromJson(json["decals"])
    var params = {
      "exportID": json["_eid"] || json["exportID"],
      "name": json["name"],
      "offsetX": json["offsetX"],
      "offsetY": json["offsetY"],
      "gridCellWidth": json["gridCellWidth"],
      "gridCellHeight": json["gridCellHeight"],
      "gridCellsX": json["gridCellsX"],
      "gridCellsY": json["gridCellsY"],
      "data": json["data"],
      "data2D": json["data2D"],
      "dataCoords": json["dataCoords"],
      "dataCoords2D": json["dataCoords2D"],
      "grid": json["grid"],
      "grid2D": json["grid2D"],
      "entities": entities,
      "decals": decals,
      "exportMode": json["exportMode"],
      "arrayMode": json["arrayMode"],
      "tileset": json["tileset"],
      "folder": json["folder"]
    }

    return LevelLayer.new(params)
  }

  static listFromJson(jsonList) {
    var items = []
    jsonList = jsonList || []
    for (json in jsonList) {
      items.add(LevelLayer.fromJson(json))
    }
    return items
  }
}
