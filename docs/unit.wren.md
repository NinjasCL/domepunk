<!-- file: src/test/unit.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## Unit testing

These are some classes
For doing TDD with Wren and Dome
Used to make assertions about values in test cases.
Loosely inspired on [Assert.hx](https://github.com/massiveinteractive/MassiveUnit/blob/master/src/massive/munit/Assert.hx)
and [Please.wren](https://github.com/EvanHahn/wren-please/blob/master/please.wren)

---

## [Class Runner](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L35)


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

### [static run(Class)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L42)


It runs all the tests contained in the test Class.
- Parameter Class: A class which adopts the test suite spec.
- Signature: `static func run(Class:Class) -> Void`
- Throws: `Fiber.abort(error)` if test fails.

### [static end()](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L54)


Ends the testing process and quits the engine.
- Signature: `static func end() -> Void`

## [Class Assert](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L98)


Assertion class provides methods that throws `Fiber.abort` on failure.

## API

### [static abort(message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L112)


Terminates the execution by throwing a Fiber.abort()
- Signature: `static abort(message:String)
- Parameter message: The message that will show in the abort.
- Throws: `Fiber.abort(message)`

### [static equal(a, b, message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L124)


Assert that two variables have the same value
- Signature: `static func equal(a:Any, b:Any, message:String?) -> Void`
- Parameter a: The first variable.
- Parameter b: The second variable.
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort("%(a) is not equal to %(b)")`

### [static isNotEqual(a, b, message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L143)


Assert that two variables have the different values
- Signature: `static func notEqual(a:Any, b:Any, message:String?) -> Void`
- Parameter a: The first variable.
- Parameter b: The second variable.
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort("%(a) is equal to %(b)")`

### [static isNull(value, message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L163)


Assert that a value is null.
- Signature: `static func isNull(value:Any, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()`

### [static isNotNull(value, message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L178)


Assert that a value is not null.
- Signature: `static func isNull(value:Any, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()`

### [static failure(block, message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L195)


Assert that a block of code (Fiber or Fn) fails (Throws Fiber.abort()).
- Signature: `static func fail<T:Fiber|Fn>(block:T, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()`

### [static success(block, message)](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L212)


Assert that a block of code (Fiber or Fn) succeeds (not fails) (Not throws Fiber.abort()).
- Signature: `static func fail<T:Fiber|Fn>(block:T, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()`

## [Class ExampleTest](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L594)


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

### [static describe](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L600)


Optional description of the test suite.
It defaults to the class name if not provided.
- Signature: `static var describe:String? = "%(Class)"`

### [static all](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L607)


Required static list of all the test methods that should be
executed in this test suite.
- Signature: `static var all:List`

### [static setup()](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L613)


Optional method that is called before running the test suite.
- Signature: `static func setup() -> Void`

### [static teardown()](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L619)


Optional method that is called after running the test suite.
- Signature: `static func teardown() -> Void`

### [static thatExampleTestWorks](https://github.com/ninjascl/domepunk/blob/main/src/test/unit.wren#L628)


Every test should return at least a `Fiber.new{}` object
to make the test assertions.
assert object is automatically injected
by the test runner
- Signature: `static var thatExampleTestWorks:List`
