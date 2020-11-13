/** doc-name: utils.ogmo.wren */
import "json" for Json
import "graphics" for Color

// TODO: Add Level Parser

/** doc-header
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
*/


/**
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

  /**
  Creates an Ogmo Project from `.ogmo` data.
  - Signature: static load(path:String) -> Project
  - Parameter path: String to the file holding Ogmo data.
  - Returns: Project parsed from Ogmo file.
  */
  construct load(path) {

    var json = Json.load(path)

    _name = json["name"]
    _ogmoVersion = json["ogmoVersion"]

    _levelPaths = json["levelPaths"]

    backgroundColor = json["backgroundColor"]
    gridColor = json["gridColor"]

    _anglesRadians = json["anglesRadians"]
    _defaultExportMode = json["defaultExportMode"]
    _directoryDepth = json["directoryDepth"]
    _entityTags = json["entityTags"]

    _levelDefaultSize = Size.fromJson(json["levelDefaultSize"])
    _levelMinSize =  Size.fromJson(json["levelMinSize"])
    _levelMaxSize = Size.fromJson(json["levelMaxSize"])
    _layerGridDefaultSize = Size.fromJson(json["levelGridDefaultSize"])

    _levelValues = ProjectValue.listFromJson(json["levelValues"])
    _layers = ProjectLayer.listFromJson(json["layers"])
    _entities = ProjectEntity.listFromJson(json["entities"])
    _tilesets = ProjectTileset.listFromJson(json["tilesets"])
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
var OPrj = Project

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

// var OgmoLevel = Level
// var OLvl = Level
