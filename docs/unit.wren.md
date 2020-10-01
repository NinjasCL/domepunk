<!-- file: src/test/unit.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## [Class Assert](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L12)


These are some classes
For doing TDD with Wren and Dome
Used to make assertions about values in test cases.
Loosely inspired on [Assert.hx](https://github.com/massiveinteractive/MassiveUnit/blob/master/src/massive/munit/Assert.hx)
and [Please.wren](https://github.com/EvanHahn/wren-please/blob/master/please.wren)

## API

### [static equal(a, b)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L25)


Assert that two variables have the same value
- Signature: `static func equal(a:Any, b:Any) -> Void`
- Parameter a: The first variable.
- Parameter b: The second variable.
- Throws: `Fiber.abort("%(a) is not equal to %(b)")`

## [Class ExampleTest](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L455)


This is an example test to demostrate the creation of a new test suite.
Is not required to be child of this class. This is just an example.
```js
class ExampleTest {
  /// Required property that stores all the tests to run
  static all {[thatExampleTestWorks]}

  /// Individual test. Can be any name.
  /// Could return a List or a single Fiber.
  static thatExampleTestWorks {[
    "description of the individual test",
    Fiber.new {|assert|
      // Run your tests here.
    }
  ]}

  /// Optional methods and properties
  /// They can be omited from the test suite
  static describe { "optional description of the test suite" }
  static setup() {}
  static teardown() {}
}
```

## API

### [static describe](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L461)


Optional description of the test suite.
It defaults to the class name if not provided.
- Signature: `static var describe:String? = "%(Class)"`

### [static all](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L468)


Required static list of all the test methods that should be
executed in this test suite.
- Signature: `static var all:List`

### [static setup()](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L474)


Optional method that is called before running the test suite.
- Signature: `static func setup() -> Void`

### [static teardown()](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L480)


Optional method that is called after running the test suite.
- Signature: `static func teardown() -> Void`

### [static thatExampleTestWorks](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L489)


Every test should return at least a `Fiber.new{}` object
to make the test assertions.
assert object is automatically injected
by the test runner
- Signature: `static var thatExampleTestWorks:List`

## [Class Runner](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L513)


This is a simple test runner. It will execute the test lifecycle
of _setup_, _execution_ and _teardown_ for each Test Suite.

### Example
```js
import "./unit" for Runner
import "./misc/emoji.test" for EmojiTests

class Game {
    static init() {
      // Add your tests here
      Runner.run(EmojiTests)
      Runner.end()
    }
}
```

## API

### [static run(Class)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L520)


It runs all the tests contained in the test Class.
- Parameter Class: A class which adopts the test suite spec.
- Signature: `static func run(Class:Class) -> Void`
- Throws: `Fiber.abort(error)` if test fails.

### [static end()](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L532)


Ends the testing process and quits the engine.
- Signature: `static func end() -> Void`
