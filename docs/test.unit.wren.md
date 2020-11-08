<!-- file: domepunk/test/unit.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## Unit testing

These are some classes
For doing TDD with Wren and Dome
Used to make assertions about values in test cases.
Loosely inspired on [Assert.hx](https://github.com/massiveinteractive/MassiveUnit/blob/master/domepunk/massive/munit/Assert.hx)
and [Please.wren](https://github.com/EvanHahn/wren-please/blob/master/please.wren)

---
## [Class ExampleTest](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L73)


This is an example test to demostrate the creation of a new test suite.
Is not required to be child of this class. This is just an example.
```js
class ExampleTest {
  /// Required property that stores all the tests to run
  static all {[thatExampleTestWorks]}

  /// Individual test. Can be any name.
  /// Could return a List, List of List or a Single Fiber.

  /// Single Fiber Test
  static thatExampleTestWorks {
    Fn.new {|assert|
      // Run your tests here.
    }
  }

  /// Single Fiber Test with Description
  static testThatEpsilonExists {[
    "epsilon value exists",
    Fn.new { |assert|
      assert.isNotNull(Ss.epsilon)
    }
  ]}

  /// Multi Fiber Test with Description
  static testThatSumWorks {[
    ["can get the sum of two numbers",
    Fn.new{ |assert|
      assert.equal(Ss.sum([1,2]), 3)
    }],
    ["the sum of no numbers is zero",
      Fn.new{ |assert|
        assert.equal(Ss.sum([]), 0)
    }]
  ]}

  /// Multi Fiber Test with Group Description
  static testThatSumWorks2 {[
    "Ss.sum()", [
      ["can get the sum of two numbers",
      Fn.new{ |assert|
        assert.equal(Ss.sum([1,2]), 3)
      }],
      ["the sum of no numbers is zero",
        Fn.new{ |assert|
          assert.equal(Ss.sum([]), 0)
      }]
    ]
  ]}

  /// Optional methods and properties
  /// They can be omited from the test suite
  static describe { "optional description of the test suite" }
  static setup() {}
  static teardown() {}
}
```

## API

### [static describe](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L79)


Optional description of the test suite.
It defaults to the class name if not provided.
- Signature: `static var describe:String? = "%(Class)"`

### [static all](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L86)


Required static list of all the test methods that should be
executed in this test suite.
- Signature: `static var all:List`

### [static setup()](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L92)


Optional method that is called before running the test suite.
- Signature: `static func setup() -> Void`

### [static teardown()](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L98)


Optional method that is called after running the test suite.
- Signature: `static func teardown() -> Void`

### [static thatExampleTestWorks](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L107)


Every test should return at least a `Fn.new{}` object
to make the test assertions.
assert object is automatically injected
by the test runner
- Signature: `static var thatExampleTestWorks:<Fiber|List>`

---
## [Class Runner](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L132)


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
- Since: 1.0.0

## API

### [static run(Class)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L140)


It runs all the tests contained in the test Class.
- Since: 1.0.0
- Parameter Class: A class which adopts the test suite spec.
- Signature: `static func run(Class:Class) -> Void`
- Throws: `Fiber.abort(error)` if test fails.

### [static end(exit)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L256)


Ends the testing process and optionally executes a end block.
- Example:
```js
  import "dome" for Process
  Runner.end {
    Process.exit()
  }
```
- Since: 1.0.0
- Signature: `static func end<T:Fiber|Fn>(exit:T?) -> Void`
- Parameter exit: An optional block that is executed at the end of the process.

---
## [Class Assert](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L275)


Assertion class provides methods that throws `Fiber.abort` on failure.
```js
import "./test/unit" for Assert
```
- Since: 1.0.0

## API

### [static abort(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L290)


Terminates the execution by throwing a Fiber.abort()
- Since: 1.0.0
- Signature: `static abort(message:String?) -> Void`
- Parameter message: The message that will show in the abort.
- Throws: `Fiber.abort(message)` on assertion error.

### [static equal(value, expected, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L307)


Assert that two variables have the same value
- Since: 1.0.0
- Signature: `static func equal(value:Any, expected:Any, message:String?) -> Void`
- Parameter value: The first variable.
- Parameter expected: The second variable.
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isNotEqual(value, expected, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L327)


Assert that two variables have the different values
- Since: 1.0.0
- Signature: `static func isNotEqual(value:Any, expected:Any, message:String?) -> Void`
- Parameter value: The first variable.
- Parameter expected: The second variable.
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static nearlyEqual(value, expected, epsilon, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L352)


Assert that two floating point variables have the same value.
This is needed due to Floating-Point arithmetic.
Thanks to _@Dr.Henwig_ at _Wren's Discord_ for the help.
- See: [Floating Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
- See: [Floating Point Guide](https://floating-point-gui.de/formats/fp/)
- Since: 1.0.0
- Signature: `static func nearlyEqual(value:Num, expected:Num, epsilon:Num, message:String?) -> Void`
- Parameter value: The first variable.
- Parameter expected: The second variable.
- Parameter epsilon: The precision needed to consider values equal. e.g. 0.001
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isNotNearlyEqual(value, expected, epsilon, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L404)


Assert that two floating point variables have different values.
This is needed due to Floating-Point arithmetic.
- See: [Floating Point Arithmetic](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html)
- Since: 1.0.0
- Signature: `static func isNotNearlyEqual(value:Num, expected:Num, epsilon:Num, message:String?) -> Void`
- Parameter value: The first variable.
- Parameter expected: The second variable.
- Parameter epsilon: The precision needed to consider values equal. e.g. 0.001
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static above(value, expected, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L426)


Assert that one variable is above the expected.
- Since: 1.0.0
- Signature: `static func above(value:Any, expected:Any, message:String?) -> Void`
- Parameter value: The first variable.
- Parameter expected: The second variable.
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static below(value, expected, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L446)


Assert that one variable is below the expected.
- Since: 1.0.0
- Signature: `static func below(value:Any, expected:Any, message:String?) -> Void`
- Parameter value: The first variable.
- Parameter expected: The second variable.
- Parameter message: Optional mesage to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isKind(value, Kind, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L468)


Verifies that the value belongs to a certain kind of class.
- Since: 1.0.0
- Signature: `static func isKind(value:Any, Kind:Class, message:String?) -> Void`
- Parameter value: The value that will be checked.
- Parameter Kind: The Class that would be checked against the value.
- Parameter message: Optional parameter with a message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isNotKind(value, Kind, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L488)


Verifies that the value not belongs to a certain kind of class.
- Since: 1.0.0
- Signature: `static func isNotKind(value:Any, Kind:Class, message:String?) -> Void`
- Parameter value: The value that will be checked.
- Parameter Kind: The Class that would be checked against the value.
- Parameter message: Optional parameter with a message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isNull(value, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L507)


Assert that a value is null.
- Since: 1.0.0
- Signature: `static func isNull(value:Any, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isNotNull(value, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L523)


Assert that a value is not null.
- Since: 1.0.0
- Signature: `static func isNull(value:Any, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isString(value, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L539)


Asserts that a value is kind of String.
- Since: 1.0.0
- Signature: `static func isString(value:Any, message:String?) -> Void`
- Parameter value: A value to check.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static isNotString(value, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L555)


Asserts that a value is not kind of String.
- Since: 1.0.0
- Signature: `static func isString(value:Any, message:String?) -> Void`
- Parameter value: A value to check.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static failure(block, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L573)


Assert that a block of code (Fiber or Fn) fails (Throws Fiber.abort()).
- Since: 1.0.0
- Signature: `static func fail<T:Fiber|Fn>(block:T, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.

### [static success(block, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/test/unit.wren#L590)


Assert that a block of code (Fiber or Fn) succeeds (not fails) (Not throws Fiber.abort()).
- Since: 1.0.0
- Signature: `static func fail<T:Fiber|Fn>(block:T, message:String?) -> Void`
- Parameter value: The value that would be checked.
- Parameter message: Optional message to show on assertion error.
- Throws: `Fiber.abort()` on assertion error.
