import "dome" for Process
import "../Test" for Runner, Assert
import "../../utils/Ease" for Ease

class EaseTests {
  static name { "utils/Ease.wren" }

  static value { 10 }

  static thatLinearWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.linear(value), 10)
    }
  }

  static thatQuadInWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.quadIn(value), 100)
    }
  }

  static thatQuadOutWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.quadOut(value), -80)
    }
  }

  static thatQuadInOutWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.quadInOut(value), 0)
    }
  }

  static thatCubeInWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.cubeIn(value), 1000)
    }
  }

  static thatCubeOutWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.cubeOut(value), 1001)
    }
  }

  static thatCubeInOutWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.cubeInOut(value), 4001)
    }
  }

  static thatQuartInWorks() {
    return Fn.new() {
      var value = EaseTests.value
      Assert.equal(Ease.quartIn(value), 10000)
    }
  }

  static all {[
    ["thatLinearWorks", thatLinearWorks()],
    ["thatQuadInWorks", thatQuadInWorks()],
    ["thatQuadOutWorks", thatQuadOutWorks()],
    ["thatCubeInWorks", thatCubeInWorks()],
    ["thatCubeOutWorks", thatCubeOutWorks()],
    ["thatCubeInOutWorks", thatCubeInOutWorks()],
    ["thatQuartInWorks", thatQuartInWorks()]
  ]}
}

class Game {
    static init() {
      Runner.run(EaseTests)
    }
}
