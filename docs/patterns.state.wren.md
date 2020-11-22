<!-- file: domepunk/patterns/state.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## State Machine
Utility classes for creating simple _State Machines_.

- References:
  - https://github.com/jakesgordon/javascript-state-machine
  - http://gameprogrammingpatterns.com/state.html

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
## [Class StateMachine](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L114)


```js
import "domepunk/patterns/state" for StateMachine

// alias
import "domepunk/patterns/state" for SM
```

## API

### [data](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L132)


Get or set the state machine `data`

### [ignoreErrors](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L149)


By default state errors triggers a `fiber.abort()`.
use `"ignoreErrors":true` on the constructor's Map to ignore all errors.

### [onError](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L155)


By default state errors triggers a `fiber.abort()`.
use `"onError": Fn.new {|message, name, transition, machine|}` to catch errors.

### [error](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L167)


Error message if available
- Signature: `error:String?`

### [state](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L172)


Get the current state

### [isState(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L183)


Returns true if the provided name is equal to the current state name.
- Signature: `is(name:String) -> Bool`

### [states](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L188)


Map of possible states

### [transitions](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L198)


Map of possible transitions

### [do(name)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L219)


Tries to execute a transition by name.
- Signature: `do(name:String) -> this`
- Example: `ice.do("melt")`
- Throws: `Fiber.abort()` if `ignoreErrors` and `onError` properties are not set.

### [reset()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L255)


Resets the state to the `init` value.

### [construct new(machine)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L267)


Creates a new state machine.
- Signature: `construct new(machine:Map) -> StateMachine`.
- Throws: `Fiber.abort()` if `machine` is not a Map.

---
## [Class StateTransitionBuilder](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L418)


```js
import "domepunk/patterns/state" for StateTransitionBuilder

// alias
import "domepunk/patterns/state" for STB
```

## API

### [from](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L432)


Get or sets the `from` state

### [from = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L442)



### [from(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L450)


Fluent interface
- Signature: `from(value:<String|List>) -> this`

### [any()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L459)


Fluent interface to set from = "*"
- Signature: `any() -> this`

### [to](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L467)


Get or sets the `to` state

### [to = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L471)



### [to(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L479)


Fluent interface
- Signature: `to(value:String) -> this`

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L487)


Get or sets the `name` for the transition

### [name = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L491)



### [name(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L499)


Fluent interface
- Signature: `name(value:String) -> this`

### [when](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L507)


Get or set the `when` function to determine if the transition is possible

### [when(value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L516)


Fluent interface
- Signature: `when(value:Fn) -> this`

### [construct new(name, from, to, when)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L529)


Creates a new transition.
- Signature: `construct new(name:String?, from:String?, to:String?, when:Fn?) -> StateTransitionBuilder`
- Example:
```js
STB.new("melt").from("solid").to("liquid")
```

---
## [Class State](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L554)


The basic State

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L561)


The state name

### [machine](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L566)


The machine where this state belongs

### [isInit](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L571)


Is the initial state?

### [children](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L580)


States to transition to
- Signature: `children : [State]`

### [parents](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L599)


States from which this originates.
- Signature: `parents : [State]`

---
## [Class StateTransition](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L623)


A state transition.

## API

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L635)


name of the transition

### [from](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L641)


origin state
- Signature: `from:<String|List>`

### [to](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L646)


final state

### [machine](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L651)


state machine reference

### [before](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L656)


Get or sets the `before` callback

### [before()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L672)


Executes the `before` callback

### [on](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L679)


Get or sets the `on` callback

### [on()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L695)


Executes the `on` callback

### [after](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L702)


Get or sets the `before` callback

### [after()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L718)


Executes the `after` callback

### [when](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L726)


Get or sets the `when` callback.
Return false if this transition should not be executed.

### [when()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L742)


Executes the `when` callback

### [step()](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L750)


Triggers the `on` callback, then
return the `to` property

### [construct new(name, from, to, when, machine)](https://github.com/ninjascl/domepunk/blob/main/domepunk/patterns/state.wren#L758)


Creates a new StateTransition
