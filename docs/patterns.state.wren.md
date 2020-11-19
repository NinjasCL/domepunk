<!-- file: domepunk/patterns/state.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## State Machine
Utility classes for creating simple [State Machines](http://gameprogrammingpatterns.com/state.html).

Inspired on https://github.com/jakesgordon/javascript-state-machine

- Since: `1.0.0`
- Example:
```js
import "domepunk/patterns/state" for StateMachine, STB

// Create a new state machine
var water = StateMachine.new({
  "data": {
    "mydata":true
  },
  // Optional
  "ignoreErrors": false,

  "onError": Fn.new {|message, name, transition, machine|
    System.print("Error Handler")
    System.print(name)
    System.print(message)
  },

  "init": "solid",
  "transitions": [
    STB.new("melt").from("solid").to("liquid"),
    STB.new("freeze").from("liquid").to("solid"),
    STB.new("vaporize").from("liquid").to("gas"),
    STB.new("condense").from("gas").to("liquid"),
    STB.new("magnetize").from("solid").to("magnet").when {|transition|
      var canBeMagnetized = false
      System.print(transition)
      System.print("Can be magnetized? " + canBeMagnetized.toString)
      return canBeMagnetized
    }
  ],

  "methods": {
    "before": {
      "melt": Fn.new {|transition|
        System.print("Before Melting " + transition.toString)
      },
      "freeze": Fn.new{|transition|
        System.print("Before Freezing " + transition.toString)
      }
    },
    "on": {
      "melt": Fn.new{|transition|
        System.print("Is Melting " + transition.toString)
      }
    },
    "after": {
      "melt": Fn.new{|transition|
        System.print("After Melting " + transition.toString)
      }
    }
  }
})

// Start moving through states
System.print(water.state)
water.do("melt")
System.print(water.state)

water.do("vaporize")
System.print(water.state)

water.do("condense")
System.print(water.state)

// Go back to solid
water.do("freeze")
System.print(water.state)

// Condense is only possible from gas to liquid
// Current state should be solid
water.do("condense")

// State should remain solid
System.print(water.state)

// now should be liquid
water.do("melt")
System.print(water.state)

// And back to solid
water.reset()
System.print(water.state)

// This state is not possible
// since when condition is not true
water.do("magnetize")
System.print(water.state)

// This should be ignored
water.do("invalid")
```

---
## [Class StateMachine](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L112)


```js
import "domepunk/patterns/state" for StateMachine

// alias
import "domepunk/patterns/state" for SM
```

## API

### [data](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L130)


Get or set the state machine `data`

### [ignoreErrors](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L147)


By default state errors triggers a `fiber.abort()`.
use `"ignoreErrors":true` on the constructor's Map to ignore all errors.

### [onError](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L153)


By default state errors triggers a `fiber.abort()`.
use `"onError": Fn.new {|message, name, transition, machine|}` to catch errors.

### [error](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L165)


Error message if available
- Signature: `error:String?`

### [state](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L170)


Get the current state

### [isState(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L181)


Returns true if the provided name is equal to the current state name.
- Signature: `is(name:String) -> Bool`

### [states](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L186)


Map of possible states

### [transitions](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L196)


Map of possible transitions

### [do(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L209)


Tries to execute a transition by name.
- Signature: `do(name:String) -> this`
- Example: `ice.do("melt")`
- Throws: `Fiber.abort()` if `ignoreErrors` and `onError` properties are not set.

### [reset()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L245)


Resets the state to the `init` value.

### [construct new(machine)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L257)


Creates a new state machine.
- Signature: `construct new(machine:Map) -> StateMachine`.
- Throws: `Fiber.abort()` if `machine` is not a Map.

---
## [Class StateTransitionBuilder](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L355)


```js
import "domepunk/patterns/state" for StateTransitionBuilder

// alias
import "domepunk/patterns/state" for STB
```

## API

### [from](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L369)


Get or sets the `from` state

### [from = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L373)



### [from(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L381)


Fluent interface
- Signature: `from(value:String) -> this`

### [to](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L389)


Get or sets the `to` state

### [to = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L393)



### [to(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L401)


Fluent interface
- Signature: `to(value:String) -> this`

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L409)


Get or sets the `name` for the transition

### [name = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L413)



### [name(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L421)


Fluent interface
- Signature: `name(value:String) -> this`

### [when](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L429)


Get or set the `when` function to determine if the transition is possible

### [when(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L438)


Fluent interface
- Signature: `when(value:Fn) -> this`

### [construct new(name, from, to, when)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L451)


Creates a new transition.
- Signature: `construct new(name:String?, from:String?, to:String?, when:Fn?) -> StateTransitionBuilder`
- Example:
```js
STB.new("melt").from("solid").to("liquid")
```

---
## [Class State](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L476)


The basic State

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L483)


The state name

### [machine](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L488)


The machine where this state belongs

### [isInit](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L493)


Is the initial state?

### [children](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L502)


States to transition to
- Signature: `children : [State]`

### [parents](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L521)


States from which this originates.
- Signature: `parents : [State]`

---
## [Class StateTransition](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L545)


A state transition.

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L557)


name of the transition

### [from](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L562)


origin state

### [to](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L567)


final state

### [machine](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L572)


state machine reference

### [before](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L577)


Get or sets the `before` callback

### [before()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L593)


Executes the `before` callback

### [on](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L600)


Get or sets the `on` callback

### [on()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L616)


Executes the `on` callback

### [after](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L623)


Get or sets the `before` callback

### [after()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L639)


Executes the `after` callback

### [// Return false if this transition should not be executed
  when](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L646)


Get or sets the `when` callback

### [when()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L663)


Executes the `when` callback

### [step()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L671)


Triggers the `on` callback, then
return the `to` property

### [construct new(name, from, to, when, machine)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L679)


Creates a new StateTransition
