/** doc-name: utils.string.wren */
/**
Simple string functions.
Some code was based on [Recto.wren](https://github.com/BrianOtto/Recto/blob/master/Recto.wren) library.
- Example:
```js
import "domepunk/utils/string" for Str
```
- Since: 1.0.0
*/
class Str {

  // MARK: - Properties
  static asciitable {
    if (!__asciitable) {
      // Extended ASCII table (0 - 255).
      __asciitable = [
          "\x00", "\x01", "\x02", "\x03", "\x04", "\x05", "\x06", "\x07",
          "\x08", "\x09", "\x0A", "\x0B", "\x0C", "\x0D", "\x0E", "\x0F",
          "\x10", "\x11", "\x12", "\x13", "\x14", "\x15", "\x16", "\x17",
          "\x18", "\x19", "\x1A", "\x1B", "\x1C", "\x1D", "\x1E", "\x1F",
          "\x20", "\x21", "\x22", "\x23", "\x24", "\x25", "\x26", "\x27",
          "\x28", "\x29", "\x2A", "\x2B", "\x2C", "\x2D", "\x2E", "\x2F",
          "\x30", "\x31", "\x32", "\x33", "\x34", "\x35", "\x36", "\x37",
          "\x38", "\x39", "\x3A", "\x3B", "\x3C", "\x3D", "\x3E", "\x3F",
          "\x40", "\x41", "\x42", "\x43", "\x44", "\x45", "\x46", "\x47",
          "\x48", "\x49", "\x4A", "\x4B", "\x4C", "\x4D", "\x4E", "\x4F",
          "\x50", "\x51", "\x52", "\x53", "\x54", "\x55", "\x56", "\x57",
          "\x58", "\x59", "\x5A", "\x5B", "\x5C", "\x4D", "\x5E", "\x5F",
          "\x60", "\x61", "\x62", "\x63", "\x64", "\x65", "\x66", "\x67",
          "\x68", "\x69", "\x6A", "\x6B", "\x6C", "\x6D", "\x6E", "\x6F",
          "\x70", "\x71", "\x72", "\x73", "\x74", "\x75", "\x76", "\x77",
          "\x78", "\x79", "\x7A", "\x7B", "\x7C", "\x7D", "\x7E", "\x7F",
          "\x80", "\x81", "\x82", "\x83", "\x84", "\x85", "\x86", "\x87",
          "\x88", "\x89", "\x8A", "\x8B", "\x8C", "\x8D", "\x8E", "\x8F",
          "\x90", "\x91", "\x92", "\x93", "\x94", "\x95", "\x96", "\x97",
          "\x98", "\x99", "\x9A", "\x9B", "\x9C", "\x9D", "\x9E", "\x9F",
          "\xA0", "\xA1", "\xA2", "\xA3", "\xA4", "\xA5", "\xA6", "\xA7",
          "\xA8", "\xA9", "\xAA", "\xAB", "\xAC", "\xAD", "\xAE", "\xAF",
          "\xB0", "\xB1", "\xB2", "\xB3", "\xB4", "\xB5", "\xB6", "\xB7",
          "\xB8", "\xB9", "\xBA", "\xBB", "\xBC", "\xBD", "\xBE", "\xBF",
          "\xC0", "\xC1", "\xC2", "\xC3", "\xC4", "\xC5", "\xC6", "\xC7",
          "\xC8", "\xC9", "\xCA", "\xCB", "\xCC", "\xCD", "\xCE", "\xCF",
          "\xD0", "\xD1", "\xD2", "\xD3", "\xD4", "\xD5", "\xD6", "\xD7",
          "\xD8", "\xD9", "\xDA", "\xDB", "\xDC", "\xDD", "\xDE", "\xDF",
          "\xE0", "\xE1", "\xE2", "\xE3", "\xE4", "\xE5", "\xE6", "\xE7",
          "\xE8", "\xE9", "\xEA", "\xEB", "\xEC", "\xED", "\xEE", "\xEF",
          "\xF0", "\xF1", "\xF2", "\xF3", "\xF4", "\xF5", "\xF6", "\xF7",
          "\xF8", "\xF9", "\xFA", "\xFB", "\xFC", "\xFD", "\xFE", "\xFF",
      ]
    }
    return __asciitable
  }

  // MARK: - Instance methods

  toString {
    if (!_string) {
      _string = ""
    }
    return _string
  }

  /**
  Creates a new String object
  - Signature: construct new(string:String) -> Str
  - Since: 1.0.0
  - Parameter string: A string object
  */
  construct new(string) {
    _string = string.toString
  }

  /**
  Limits string length (or less) characters from the string.
  This is safer than using slices since it would not
  throws if the number of characters available is less than
  the picked length.
  - Signature: limit(length:Num) -> Str
  - Since: 1.0.0
  - Example:
  ```js
  // returns: hello
  Str.new("hello wren").limit(5)
  ```
  - Parameter length: How many characters to limit
  - Returns: a new string with the specified length characters.
  */
  limit(length) {
    return Str.new(toString.take(length).join())
  }

  /**
  Reverses a string value.
  - Signature: reverse() -> Str
  - Since: 1.0.0
  - Example:
  ```js
  // returns: "olleh"
  Str.new("hello").reverse()

  // also available as static
  Str.reverse("hello")
  ```
  - Returns: a reversed string
  */
  reverse() {
    return Str.new(toString[(toString.count - 1)..0])
  }

  /**
  Convert a string to lowercase.
  - Signature: lower() -> Str
  - Since: 1.0.0
  - Example:
  ```js
  // Result is "camelcaseisawesome!"
  Str.new("camelCaseIsAwesome!").lower().toString

  // Also available as a static method
  Str.lower("camelCaseIsAwesome!")
  ```
  - Returns: The lowercased string
  */
  lower() {
    return Str.new(toString.bytes.map {|ord|
        if (ord >= 65 && ord <= 90) {
            ord = ord + 32
        }

        return Str.toChr(ord)
    }.join())
  }

  /**
  Convert a string to uppercase
  - Signature: upper() -> Str
  - Since: 1.0.0
  - Example:
  ```js
  // Result is "CAMELCASEISAWESOME!"
  Str.new("camelCaseIsAwesome!").upper().toString

  // Also available as a static method
  Str.upper("camelCaseIsAwesome!")
  ```
  - Returns: The uppercased string
  */
  upper() {
      return Str.new(toString.bytes.map {|ord|
          if (ord >= 97 && ord <= 122) {
              ord = ord - 32
          }

          return Str.toChr(ord)
      }.join())
  }

  /**
  Uppercase the first letter in each word. Title Case.
  - Signature: title() -> Str
  - Since: 1.0.0
  - Example:
  ```js
  // Result is "The Unicorn Prances"
  Str.new("the unicorn prances").title().toString

  // Or using the static method
  Str.title("the unicorn prances")
  ````
  - Returns: The updated string.
  */
  title() {
    var words = ""

    for (word in toString.split(" ")) {
        if (word.count > 1) {
          words = words + Str.upper(word[0]) + Str.lower(word[1...word.count]) + " "
        }
    }

    return Str.new(words.trim())
  }

  // MARK: - Static Methods
  static limit(string, quantity) {
    return Str.new(string).limit(quantity).toString
  }

  static reverse(string) {
    return Str.new(string).reverse().toString
  }

  static lower(string) {
    return Str.new(string).lower().toString
  }

  static upper(string) {
    return Str.new(string).upper().toString
  }

  static title(string) {
    return Str.new(string).title().toString
  }

  /**
  Convert a character to its numeric ASCII value
  This only works with a single character.
  This works with the extended ASCII table (0 - 255).
  - Signature: static toOrd(chr:String) -> Num
  - Since: 1.0.0
  - Example:
  ```js
  // Result is 33 as Num
  Str.toOrd("!")
  ```
  - Parameter chr: The character to convert.
  - Returns: The numeric ASCII value it represents.
  */
  static toOrd(chr) {
    if (chr.bytes.count > 0) {
      return chr.bytes[0]
    }
    return null
  }

  /**
  Convert a numeric ASCII value to its character
  This only works with a single number.
  This works with the extended ASCII table (0 - 255).
  - Signature: static toChr(ord:Num) -> String
  - Since: 1.0.0
  - Example:
  ```js
  // Result is "!"
  Str.toChr(33)
  ```
  - Parameter ord: The ASCII numeric value to convert.
  - Returns: A string of the character it represents.
  */
  static toChr(ord) {
    return Str.asciitable[ord]
  }
}
