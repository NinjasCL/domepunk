
class Dependency {

  version {_version}
  name {_name}

  construct new(name, version) {
    _name = name
    _version = version
  }

  major { toList[0] }
  minor { toList[1] }
  patch { toList[2] }

  toString {{"name":name, "version":version}.toString}

  toList {
    if (!_list) {
      _list = version.split(".").map {|value| Num.fromString(value) }.toList
    }
    return _list
  }

  atLeast(version) {
    // Code Extracted from Dome Engine's dome.wren
    var values = version.split(".").map {|value| Num.fromString(value) }.toList
    var actual = this.toList
    if (values[0] > actual[0]) {
      return false
    }
    if (values[0] < actual[0]) {
      return true
    }
    if (values.count > 1) {
      if (values[1] > actual[1]) {
        return false
      }
      if (values[1] < actual[1]) {
        return true
      }
    }
    if (values.count > 2) {
      if (values[2] > actual[2]) {
        return false
      }
      if (values[2] < actual[2]) {
        return true
      }
    }
    return true
  }
}

class Dependencies {

  static objects {
    if (!__stack) {
      __stack = {}
    }
    return __stack
  }

  static factories {
    if (!__stackFactories) {
      __stackFactories = {}
    }
    return __stackFactories
  }

  static classes {
    if (!__stackClasses) {
      __stackClasses = {}
    }
    return __stackClasses
  }

  static addObject (key, value) {
    objects[key] = value
  }

  static addFactory (key, fn) {
    factories[key] = fn
  }

  static addClass (key, Class) {
    classes[key] = Class
  }

  static object (key) { stack[key] }
  static factory (key) { factories[key] }
  static kind (key) { classes[key] }
}

var DI = Dependencies
var Di = Dependencies
var Deps = Dependencies
