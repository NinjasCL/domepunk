## [Emoji](https://github.com/NinjasCL/domepunk/blob/main/src/misc/emoji.wren)

This simple lib will help you working with emojis in _Wren_.
Is inspired by the [Python Emoji Lib](https://pypi.org/project/emoji/).

### Quick Example

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

### API

#### static func emojize(text:String) -> String

Will transform the text changing the emoji tags. E.g. `:thumbsup:` to 👍

#### static func demojize(text:String) -> String

It the reverse process to emojize. Transform emoji to emoji tags. E.g. 👍 to `:thumbsup:`

#### static func forName(name:String) -> String

It will return the emoji for the specified name.

#### static func nameFor(emoji:String) -> String

It will return the name for the specified emoji.

#### static var random: String

Will return a random emoji.
