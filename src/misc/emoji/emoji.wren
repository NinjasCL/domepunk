// Inspired on https://pypi.org/project/emoji/
import "random" for Random

/**
This simple lib will help you working with emojis in _Wren_.
Is inspired by the [Python Emoji Lib](https://pypi.org/project/emoji/).

The entire set of Emoji codes as defined by the [unicode consortium](http://www.unicode.org/Public/emoji/1.0/full-emoji-list.html)
is supported in addition to a bunch of [aliases](http://www.emoji-cheat-sheet.com/).

### Example

```js
import "./misc/emoji" for Emoji

// Wren is 👍
System.print(Emoji.emojize('Wren is :thumbs_up:'))

// Wren is 👍
System.print(Emoji.emojize('Wren is :thumbsup:'))

// Wren is :thumbs_up:
System.print(Emoji.demojize('Wren is 👍'))

// Wren is ❤️
System.print("Wren is %(Emoji.random)")
```

### Developing

For generating the emoji codes we use the [tools/emoji](https://github.com/NinjasCL/domepunk/tree/main/tools/emoji) _Python_ script. This script
utilizes the [unicode_codes.py](https://raw.githubusercontent.com/carpedm20/emoji/master/emoji/unicode_codes.py) file from _Python_ emoji.

The main class is [src/misc/emoji/emoji.wren](https://github.com/NinjasCL/domepunk/blob/main/src/misc/emoji/emoji.wren). _misc/emoji/codes.wren_ and _misc/emoji.wren_ are automatically generated by _tools/emoji_'s _Makefile_.

To generate a new version of the emoji codes, Execute `make` inside _tools/emoji_ dir. This will generate _misc/emojis/codes.wren_ and merge it with _misc/emojis/emoji.wren_ in a single file called _misc/emoji.wren_.

#### Testing

The test file is found in [src/test/misc/emoji.test.wren](https://github.com/NinjasCL/domepunk/blob/main/src/test/misc/emoji.test.wren)
Execute `make tests` to run all tests.

### Links

- [Emoji Cheat Sheet](http://www.emoji-cheat-sheet.com/)

- [Official unicode list](http://www.unicode.org/Public/emoji/1.0/full-emoji-list.html)

### Thanks

To the folks of _Python_ emoji for its wonderful lib.

- Taehoon Kim / [@carpedm20](http://carpedm20.github.io/about/)
- Kevin Wurster / [@geowurster](http://twitter.com/geowurster/)
*/
class Emoji {

    /**
    Will return all the available emoji tags and emojis.

    Signature:
      - `static var emojis: Map`
    */
    static emojis {Codes.all}

    /**
    Will return a random emoji.

    Signature:
      - `static var random: String`
    */
    static random {
      var rand = Random.new()
      return rand.sample(Emoji.emojis.values.toList)
    }

    static forName(name, emojis) {

      if (!name || name == "") {
        return ""
      }

      var emoji = emojis[name]

      if (!emoji) {
        // maybe we should add ":"
        name = name.replace(":", "")
        name = ":%(name):"
        emoji = emojis[name]
      }

      return emoji ? emoji : ""
    }

    /**
    It will return the emoji for the specified name.

    Signature:
      - `static func forName(name:String) -> String`
    */
    static forName(name) {
      var emojis = Emoji.emojis
      return Emoji.forName(name, emojis)
    }

    static nameFor(emoji, emojis) {

      if (!emoji || emoji == "") {
        return ""
      }

      var names = emojis.keys
      for (name in names) {
        if (emoji == emojis[name]) {
          return name
        }
      }

      return ""
    }

    /*
    It will return the name for the specified emoji.

    Signature:
      - `static func nameFor(emoji:String) -> String`
    */
    static nameFor(emoji) {
      var emojis = Emoji.emojis
      return Emoji.nameFor(emoji, emojis)
    }

    /**
    Will replace emoji tags to emojis.

    E.g. `:thumbsup:` to 👍

    Signature:
      - `static func emojize(text:String) -> String`
    */
    static emojize(string) {

      // Wren does not have regex module
      // so we have to use poor man regex

      if (!string || string == "") {
        return ""
      }

      var emojis = Emoji.emojis
      var matches = []

      for (name in emojis.keys) {
        if (string.indexOf(name) > 0) {
          if (!matches.contains(name)) {
            matches.add(name)
          }
        }
      }

      for (name in matches) {
        string = string.replace(name, Emoji.forName(name, emojis))
      }

      return string
    }

    /**
    It the reverse process to emojize. Transform emoji to emoji tags.

    E.g. 👍 to `:thumbsup:`

    Signature:
      - `static func demojize(text:String) -> String`
    */
    static demojize(string) {
      if (!string || string == "") {
        return ""
      }

      var emojis = Emoji.emojis
      var matches = []

      for (emoji in emojis.values) {
        if (string.indexOf(emoji) > 0) {
          if (!matches.contains(emoji)) {
            matches.add(emoji)
          }
        }
      }

      for (emoji in matches) {
        string = string.replace(emoji, Emoji.nameFor(emoji, emojis))
      }

      return string
    }
}
