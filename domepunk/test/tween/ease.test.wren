// TODO: Implement Ease and Tweens
import "dome" for Process
import "./unit" for Assert
import "../utils/ease" for Ease

class EaseTests {
  static name { "utils/ease.wren" }

  static value { 10 }

  static thatLinearWorks {[
    "thatLinearWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.linear(value), 10)
    }
  ]}

  static thatQuadInWorks {[
    "thatQuadInWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.quadIn(value), 100)
    }
  ]}

  static thatQuadOutWorks {[
    "thatQuadOutWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.quadOut(value), -80)
    }
  ]}

  static thatQuadInOutWorks {[
    "thatQuadInOutWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.quadInOut(value), 0)
    }
  ]}

  static thatCubeInWorks {[
    "thatCubeInWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.cubeIn(value), 1000)
    }
  ]}

  static thatCubeOutWorks {[
    "thatCubeOutWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.cubeOut(value), 1001)
    }
  ]}

  static thatCubeInOutWorks {[
    "thatCubeInOutWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.cubeInOut(value), 4001)
    }
  ]}

  static thatQuartInWorks {[
    "thatQuartInWorks",
    Fiber.new {
      var value = EaseTests.value
      Assert.equal(Ease.quartIn(value), 10000)
    }
  ]}

  static all {[
    thatLinearWorks,
    thatQuadInWorks,
    thatQuadOutWorks,
    thatCubeInWorks,
    thatCubeOutWorks,
    thatCubeInOutWorks,
    thatQuartInWorks,
  ]}
}
