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
      Assert.notEqual(emoji, "")
    }
  ]}

  static thatEmojiForNameWorks {[
    "thatEmojiForNameWorks",
    Fiber.new {
      var name = ":heart:"
      var emoji = Emoji.forName(name)
      Assert.equal(emoji, "❤")

      name = "heart"
      emoji = Emoji.forName(name)
      Assert.equal(emoji, "❤")

      name = ":fakeemoji:"
      emoji = Emoji.forName(name)
      Assert.isNotNull(emoji)
      Assert.equal(emoji, "")
    }
  ]}

  static thatEmojiNameForWorks {[
    "thatEmojiNameForWorks",
    Fiber.new {
      var emoji = "❤"
      var name = Emoji.nameFor(emoji)
      Assert.equal(name, ":red_heart:")

      emoji = ":fakeemoji:"
      name = Emoji.nameFor(emoji)
      Assert.equal(name, "")
    }
  ]}

  static thatEmojizeWorks {[
    "thatEmojizeWorks",
    Fiber.new {
      var text = "I :heart: :red_heart_selector: Kombucha :fakeemoji: :tropical_drink:"
      var emojized = Emoji.emojize(text)
      Assert.equal(emojized, "I ❤ ❤️ Kombucha :fakeemoji: 🍹")
    }
  ]}

  static thatDemojizeWorks {[
    "thatDemojizeWorks",
    Fiber.new {
      var text = "I ❤️ ❤️ Kombucha :fakeemoji: 🍹"
      var demojized = Emoji.demojize(text)
      //System.print(demojized)
      Assert.equal(demojized, "I :red_heart:️ :red_heart:️ Kombucha :fakeemoji: :tropical_drink:")
    }
  ]}

  static all {[
    thatRandomEmojiWorks,
    thatEmojiForNameWorks,
    thatEmojiNameForWorks,
    thatEmojizeWorks,
    thatDemojizeWorks
  ]}
}
