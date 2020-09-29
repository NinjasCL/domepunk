import "dome" for Process
import "./unit" for Assert
import "../misc/emoji" for Emoji

class EmojiTests {
  static name { "misc/emoji.wren" }

  static thatRandomEmojiWorks {[
    "thatRandomEmojiWorks",
    Fiber.new {
      var emoji = Emoji.random
      Assert.isNotNull(emoji)
    }
  ]}

  static thatEmojiForNameWorks {[
    "thatEmojiForNameWorks",
    Fiber.new {
      var name = ":heart:"
      var emoji = Emoji.forName(name)
      Assert.equal(emoji, "❤️")

      name = "heart"
      emoji = Emoji.forName(name)
      Assert.equal(emoji, "❤️")

      name = ":fakeemoji:"
      emoji = Emoji.forName(name)
      Assert.isNotNull(emoji)
    }
  ]}

  static thatEmojizeWorks {[
    "thatEmojizeWorks",
    Fiber.new {
      var text = "I :heart: :heart: Kombucha :fakeemoji: :tropical_drink:"
      var emojized = Emoji.emojize(text)
      Assert.equal(emojized, "I ❤️ ❤️ Kombucha :fakeemoji: 🍹")
    }
  ]}

  static all {[
    thatRandomEmojiWorks,
    thatEmojiForNameWorks,
    thatEmojizeWorks
  ]}
}
