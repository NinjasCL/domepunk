/* 
These are some classes
For doing TDD with Wren and Dome
*/

import "dome" for Process

// Use this for Running Tests
// In Game.init() method
class Runner {
  static run(Class) {
    run(Class.name, Class.all)
  }

  static all(tests) {
    tests.each{|Test| Runner.run(Test)}
  }

  // This is the base runner method
  static run(name, tests) {

    System.print("\n🔥 Running Tests for: %(name)")

    var total = tests.count
    var count = 0
    var error = null

    tests.each{ |test|

      count = count + 1
      System.write("> Test ")

      if(test is List) {
        System.write("(%(count)/%(total)) %(test[0])")
        error = test[1].try()
      } else {
        System.write("(%(count)/%(total))")
        error = test.try()
      }

      if(error) {
        System.print("\t❌")
        Fiber.abort(error)
      } else {
        System.print("\t✅")
      }
    }

    System.print("🎉 All Tests Completed for: %(name)")
    Process.exit()
  }
}
