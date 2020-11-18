
class State {
  toString {name}
  name {_name}
  isInit {_isInit}
  isInit = (value) {
    _isInit = value
  }

  construct new(name) {
    _name = name
  }
}

class StateTransition {

  toString {toMap.toString}
  toMap {{
    "name": name,
    "from": from,
    "to": to
  }}

  name {_name}
  from {_from}
  to {_to}

  before {_before}
  before = (callback) {
    _before = before
  }

  on {_on}
  on = (callback) {
    _on = callback
  }

  after {_after}
  after = (callback) {
    _after = callback
  }

  construct new(name, from, to) {
    _name = name
    _from = from
    _to = to
  }
}

class StateMachine {
  toString {name}
  name {_name || "StateMachine"}

  states {
    if (!_states) {
      _states = {}
    }
    return _states
  }

  transitions {
    if (!_transitions) {
      _transitions = {}
    }
    return _transitions
  }

  init {
    if (!_init) {
      for (state in states.values) {
        if (state.isInit) {
          _init = state
        }
      }
    }
    return _init
  }

  construct new(machine) {

    _transitions = {}
    _states = {}

    for (data in machine["transitions"]) {
      var state = State.new(data["from"])
      if (data["from"] == data["init"]) {
        state.isInit = true
      }

      _states[state.name] = state

      var transition = StateTransition.new(data["name"], state, states[data["to"]])
      _transitions[transition.name] = transition
    }

    for (key in machine["methods"].keys) {
      var element = data[key]
      if (element["before"]) {
        for (name in element["before"].keys) {
          var transition = _transitions[name]
          transition.before = element["before"][name]
          _transitions[name] = transition
        }
      }

      if (element["on"]) {
        for (name in element["on"].keys) {
          var transition = _transitions[name]
          transition.on = element["on"][name]
          _transitions[name] = transition
        }
      }

      if (element["after"]) {
        for (name in element["after"].keys) {
          var transition = _transitions[name]
          transition.after = element["after"][name]
          _transitions[name] = transition
        }
      }
    }

    System.print(states)
    System.print(transitions)
  }
}


var water = StateMachine.new({
  "init": "solid",
  "transitions": [
    {"name": "melt", "from": "solid", "to": "liquid"}
  ],
  "methods": {
    "before": {
      "melt": Fn.new {|transition|}
    },
    "on": {
      "melt": Fn.new {|transition|}
    },
    "after": {
      "melt": Fn.new {|transition|}
    }
  }
})

System.print(water)
