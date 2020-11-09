import "domepunk/utils/number" for Number

class NumberTests {
  static describe {"utils/number.wren"}
  static all {[
    testNumber
  ]}

  static testNumber {[
    "Number", [
      [
        ".new()",
        Fn.new {|assert|
          var number = Number.new(Num.pi)
          assert.equal((number is Number), true)

          assert.failure {
            Number.new("wrong")
          }
        }
      ],
      [
        ".fixed()",
        Fn.new {|assert|
          var number = Number.new(Num.pi).fixed(2).toString
          assert.equal(number, "3.14")

          number = Number.fixed(Num.pi, 2).toString
          assert.equal(number, "3.14")
        }
      ]
    ]
  ]}
}
