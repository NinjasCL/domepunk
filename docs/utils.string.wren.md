<!-- file: domepunk/utils/string.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
---
## [Class Str](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L6)


Simple string functions.
Some code was based on [Recto.wren](https://github.com/BrianOtto/Recto/blob/master/Recto.wren) library.

## API

### [construct new(string)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L64)


Creates a new String object
- Signature: construct new(string:String) -> Str
- Parameter string: A string object

### [limit(length)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L82)


Limits string length (or less) characters from the string.
This is safer than using slices since it would not
throws if the number of characters available is less than
the picked length.
- Signature: limit(length:Num) -> Str
- Example:
```js
// returns: hello
Str.new("hello wren").limit(5)
```
- Parameter length: How many characters to limit
- Returns: a new string with the specified length characters.

### [reverse()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L99)


Reverses a string value.
- Signature: reverse() -> Str
- Example:
```js
// returns: "olleh"
Str.new("hello").reverse()

// also available as static
Str.reverse("hello")
```
- Returns: a reversed string

### [lower()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L116)


Convert a string to lowercase.
- Signature: lower() -> Str
- Example:
```js
// Result is "camelcaseisawesome!"
Str.new("camelCaseIsAwesome!").lower().toString

// Also available as a static method
Str.lower("camelCaseIsAwesome!")
```
- Returns: The lowercased string

### [upper()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L139)


Convert a string to uppercase
- Signature: upper() -> Str
- Example:
```js
// Result is "CAMELCASEISAWESOME!"
Str.new("camelCaseIsAwesome!").upper().toString

// Also available as a static method
Str.upper("camelCaseIsAwesome!")
```
- Returns: The uppercased string

### [title()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L162)


Uppercase the first letter in each word. Title Case.
- Signature: title() -> Str
- Example:
```js
// Result is "The Unicorn Prances"
Str.new("the unicorn prances").title().toString

// Or using the static method
Str.title("the unicorn prances")
````
- Returns: The updated string.

### [static toOrd(chr)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L209)


Convert a character to its numeric ASCII value

This only works with a single character.
This works with the extended ASCII table (0 - 255).

- Example:
```js
// Result is 33 as Num
Str.toOrd("!")
```
- Parameter chr: The character to convert.
- Returns: The numeric ASCII value it represents.

### [static toChr(ord)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/string.wren#L229)


Convert a numeric ASCII value to its character
This only works with a single number.
This works with the extended ASCII table (0 - 255).
- Signature: static toChr(ord:Num) -> String
- Example:
```js
// Result is "!"
Str.toChr(33)
```
- Parameter ord: The ASCII numeric value to convert.
- Returns: A string of the character it represents.
