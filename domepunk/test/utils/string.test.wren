import "domepunk/utils/string" for Str

class StrTests {
  static describe {"utils/string.wren"}
  static all {[
    testString
  ]}

  static testString {[
    "Str", [
      [
        ".new()",
        Fn.new {|assert|
          var string = Str.new("hello")
          assert.equal((string is Str), true)
        }
      ],
      [
        ".limit()",
        Fn.new {|assert|
          var string = Str.new("hello").limit(2).toString
          assert.equal(string, "he")

          string = Str.limit("hello", 3)
          assert.equal(string, "hel")
        }
      ],
      [
        ".upper()",
        Fn.new {|assert|
          var string = Str.new("hello").upper().toString
          assert.equal(string, "HELLO")

          string = Str.upper("hello")
          assert.equal(string, "HELLO")
        }
      ],
      [
        ".lower()",
        Fn.new {|assert|
          var string = Str.new("HeLlo").lower().toString
          assert.equal(string, "hello")

          string = Str.lower("HeLlo")
          assert.equal(string, "hello")
        }
      ],
      [
        ".title()",
        Fn.new {|assert|
          var string = Str.new("HeLlo Wren").title().toString
          assert.equal(string, "Hello Wren")

          string = Str.title("HeLlo WReN")
          assert.equal(string, "Hello Wren")

          // TODO: Check Emojis (Codepoints)
          //string = Str.title("I ❤️ WreN")
          //assert.equal(string, "I ❤ Wren")
        }
      ],
    ]
  ]}
}
