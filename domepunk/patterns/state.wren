/** doc-name: patterns.state.wren */

/** doc-header
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
*/

/**
```js
import "domepunk/patterns/state" for StateMachine

// alias
import "domepunk/patterns/state" for SM
```
*/
class StateMachine {

  toString {toMap.toString}
  toMap {{
    "name": name,
    "states": states,
    "state": state,
    "transitions": transitions,
    "data": data,
    "ignoreErrors": ignoreErrors,
    "onError": errorHandler
  }}

  name {_name || "StateMachine"}

  /**
  Get or set the state machine `data`
  */
  data {
    if (!_data) {
      _data = {}
    }
    return _data
  }

  data = (value) {
    if (value) {
      _data = value
    }
  }

  /**
  By default state errors triggers a `fiber.abort()`.
  use `"ignoreErrors":true` on the constructor's Map to ignore all errors.
  */
  ignoreErrors {_ignoreErrors != null}

  /**
  By default state errors triggers a `fiber.abort()`.
  use `"onError": Fn.new {|message, name, transition, machine|}` to catch errors.
  */
  onError {_errorHandler}
  errorHandler {_errorHandler}
  errorHandler = (value) {
    if (value is Fn || value is Fiber) {
      _errorHandler = value
    }
  }

  /**
  Error message if available
  - Signature: `error:String?`
  */
  error {_error}

  /**
  Get the current state
  */
  state {
    if (!_state) {
      _state = State.new("invalid", this)
    }
    return _state
  }

  /**
  Returns true if the provided name is equal to the current state name.
  - Signature: `is(name:String) -> Bool`
  */
  isState(name) {name == state.name}

  /**
  Map of possible states
  */
  states {
    if (!_states) {
      _states = {}
    }
    return _states
  }

  /**
  Map of possible transitions
  */
  transitions {
    if (!_transitions) {
      _transitions = {}
    }
    return _transitions
  }

  /**
  Tries to execute a transition by name.
  - Signature: `do(name:String) -> this`
  - Example: `ice.do("melt")`
  - Throws: `Fiber.abort()` if `ignoreErrors` and `onError` properties are not set.
  */
  do(name) {
    var transition = transitions[name]
    var error = null
    if (transition is StateTransition) {
      if (state.name == transition.from.name) {
        if (transition.when()) {
          transition.before()
          _state = transition.step()
          transition.after()
          return this
        } else {
          error = "Transition `%(name)` not possible since `when` function returned `false`."
        }
      } else {
        error = "Transition from `%(transition.from.name)` to `%(transition.to.name)` not possible since current is `%(state.name)`."
      }
    } else {
      error = "Transition `%(name)` not found."
    }

    _error = error

    if (error && !ignoreErrors) {
      if (errorHandler) {
        errorHandler.call(error, name, transition, this)
      } else {
        Fiber.abort(error)
      }
    }

    return this
  }

  /**
  Resets the state to the `init` value.
  */
  reset() {
    var transition = transitions["init"]
    _state = transition.step()
    _error = null
    return this
  }

  /**
  Creates a new state machine.
  - Signature: `construct new(machine:Map) -> StateMachine`.
  - Throws: `Fiber.abort()` if `machine` is not a Map.
  */
  construct new(machine) {

    // TODO: Support multiple states for a transition
    // Example: https://github.com/jakesgordon/javascript-state-machine/blob/master/docs/states-and-transitions.md#multiple-states-for-a-transition
    if (!(machine is Map)) {
      Fiber.abort("State Machine %(machine) is not a Map instance")
    }

    _transitions = {}
    _states = {}
    data = machine["data"]

    errorHandler = machine["onError"]
    if (machine["ignoreErrors"]) {
      errorHandler = Fn.new{}
    }

    // Transform builder values to a Map
    machine["transitions"] = machine["transitions"].map{|element|
      if (element is Map) {
        return element
      }

      if (element is StateTransitionBuilder) {
        return element.toMap
      }

      return {}
    }

    var unique = {}
    for (data in machine["transitions"]) {
      var name = data["from"]
      unique[name] = name
      name = data["to"]
      unique[name] = name
    }

    unique = unique.values.toList

    for (name in unique) {
      var state = State.new(name, this)
      if (name == machine["init"]) {
        state.isInit = true
        _state = state
        _transitions["init"] = StateTransition.new("init", State.new("init", this), state, null, this)
      }

      _states[state.name] = state
    }

    for (data in machine["transitions"]) {

      var name = data["name"]
      var from = states[data["from"]]
      var to = states[data["to"]]
      var when = data["when"]

      var transition = StateTransition.new(name, from, to, when, this)
      _transitions[transition.name] = transition
    }

    for (key in machine["methods"].keys) {
      var methods = machine["methods"][key]
      for (name in methods.keys) {
        var callback = methods[name]
        var transition = transitions[name]

        if (key == "before") {
          transition.before = callback
        }

        if (key == "on") {
          transition.on = callback
        }

        if (key == "after") {
          transition.after = callback
        }

        _transitions[name] = transition
      }
    }

    reset()
  }
}

var SM = StateMachine

/**
```js
import "domepunk/patterns/state" for StateTransitionBuilder

// alias
import "domepunk/patterns/state" for STB
```
*/
class StateTransitionBuilder {

  toString {toMap.toString}

  toMap {{
    "name": name,
    "from": from,
    "to": to,
    "when": when
  }}

  /**
  Get or sets the `from` state
  */
  from {_from}

  /**
  */
  from = (value) {
    _from = value
  }

  /**
  Fluent interface
  - Signature: `from(value:String) -> this`
  */
  from(value) {
    from = value
    return this
  }

  /**
  Get or sets the `to` state
  */
  to {_to}

  /**
  */
  to = (value) {
    _to = value
  }

  /**
  Fluent interface
  - Signature: `to(value:String) -> this`
  */
  to(value) {
    to = value
    return this
  }

  /**
  Get or sets the `name` for the transition
  */
  name {_name}

  /**
  */
  name = (value) {
    _name = value
  }

  /**
  Fluent interface
  - Signature: `name(value:String) -> this`
  */
  name(value) {
    name = value
    return this
  }

  /**
  Get or set the `when` function to determine if the transition is possible
  */
  when {_when}
  when = (value) {
    _when = value
  }

  /**
  Fluent interface
  - Signature: `when(value:Fn) -> this`
  */
  when(value) {
    when = value
    return this
  }

  /**
  Creates a new transition.
  - Signature: `construct new(name:String?, from:String?, to:String?, when:Fn?) -> StateTransitionBuilder`
  - Example:
  ```js
  STB.new("melt").from("solid").to("liquid")
  ```
  */
  construct new(name, from, to, when) {
    this.name = name
    this.from = from
    this.to = to
    this.when = when
  }

  construct new(name, from, to) {
    this.name = name
    this.from = from
    this.to = to
  }

  construct new(name) {
    this.name = name
  }

  construct new() {}
}

var STB = StateTransitionBuilder

/**
The basic State
*/
class State {

  toString {name}

  /**
  The state name
  */
  name {_name}

  /**
  The machine where this state belongs
  */
  machine {_machine}

  /**
  Is the initial state?
  */
  isInit {_isInit}
  isInit = (value) {
    _isInit = value
  }

  /**
  States to transition to
  - Signature: `children : [State]`
  */
  children {
    if (!_children) {
      _children = []
    }
    return _children
  }

  children = (value) {
    _children = value
  }

  addChild(state) {
    children.add(state)
  }

  /**
  States from which this originates.
  - Signature: `parents : [State]`
  */
  parents {
    if (!_parents) {
      _parents = []
    }
    return _parents
  }

  parents = (value) {
    _parents = value
  }

  addParent(state) {
    parents.add(state)
  }

  construct new(name, machine) {
    _name = name
    _machine = machine
  }
}

/**
A state transition.
*/
class StateTransition {

  toString {toMap.toString}
  toMap {{
    "name": name,
    "from": from,
    "to": to
  }}

  /**
  name of the transition
  */
  name {_name}

  /**
  origin state
  */
  from {_from}

  /**
  final state
  */
  to {_to}

  /**
  state machine reference
  */
  machine {_machine}

  /**
  Get or sets the `before` callback
  */
  before {
    if (!_before) {
      _before = Fn.new {}
    }
    return _before
  }

  before = (callback) {
    if (callback is Fn || callback is Fiber) {
      _before = callback
    }
  }

  /**
  Executes the `before` callback
  */
  before() {
    before.call(this)
  }

  /**
  Get or sets the `on` callback
  */
  on {
    if (!_on) {
      _on = Fn.new {}
    }
    return _on
  }

  on = (callback) {
    if (callback is Fn || callback is Fiber) {
      _on = callback
    }
  }

  /**
  Executes the `on` callback
  */
  on() {
    on.call(this)
  }

  /**
  Get or sets the `before` callback
  */
  after {
    if (!_after) {
      _after = Fn.new {}
    }
    return _after
  }

  after = (callback) {
    if (callback is Fn || callback is Fiber) {
      _after = callback
    }
  }

  /**
  Executes the `after` callback
  */
  after() {
    after.call(this)
  }

  /**
  Get or sets the `when` callback.
  Return false if this transition should not be executed.
  */
  when {
    if (!_when) {
      _when = Fn.new{true}
    }
    return _when
  }

  when = (callback) {
    if (callback is Fn || callback is Fiber) {
      _when = callback
    }
  }

  /**
  Executes the `when` callback
  */
  when() {
    return when.call(this)
  }

  /**
  Triggers the `on` callback, then
  return the `to` property
  */
  step() {
    on()
    return to
  }

  /**
  Creates a new StateTransition
  */
  construct new(name, from, to, when, machine) {
    _name = name
    _from = from
    _to = to
    _machine = machine

    this.when = when

    from.addChild(to)
    to.addParent(from)
  }
}
