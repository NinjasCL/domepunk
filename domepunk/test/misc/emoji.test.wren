import "dome" for Process
import "domepunk/misc/emoji" for Emoji

class EmojiTests {
  static describe { "misc/emoji.wren" }

  static all {[
    thatRandomEmojiWorks,
    thatEmojiForNameWorks,
    thatEmojiNameForWorks,
    thatEmojizeWorks,
    thatDemojizeWorks
  ]}

  static thatRandomEmojiWorks {[
    "thatRandomEmojiWorks",
    Fiber.new { |assert|
      var emoji = Emoji.random
      assert.isNotNull(emoji)
      assert.isNotEqual(emoji, "")
    }
  ]}

  static thatEmojiForNameWorks {[
    "thatEmojiForNameWorks",
    Fiber.new { |assert|
      var name = ":heart:"
      var emoji = Emoji.forName(name)
      assert.equal(emoji, "❤")

      name = "heart"
      emoji = Emoji.forName(name)
      assert.equal(emoji, "❤")

      name = ":fakeemoji:"
      emoji = Emoji.forName(name)
      assert.isNotNull(emoji)
      assert.equal(emoji, "")
    }
  ]}

  static thatEmojiNameForWorks {[
    "thatEmojiNameForWorks",
    Fiber.new { |assert|
      var emoji = "❤"
      var name = Emoji.nameFor(emoji)
      assert.equal(name, ":red_heart:")

      emoji = ":fakeemoji:"
      name = Emoji.nameFor(emoji)
      assert.equal(name, "")
    }
  ]}

  static thatEmojizeWorks {[
    "thatEmojizeWorks",
    Fiber.new { |assert|
      var text = "I :heart: :red_heart_selector: Kombucha :fakeemoji: :tropical_drink:"
      var emojized = Emoji.emojize(text)
      assert.equal(emojized, "I ❤ ❤️ Kombucha :fakeemoji: 🍹")
    }
  ]}

  static thatDemojizeWorks {[
    "thatDemojizeWorks",
    Fiber.new { |assert|
      var text = "I ❤️ ❤️ Kombucha :fakeemoji: 🍹"
      var demojized = Emoji.demojize(text)
      assert.equal(demojized, "I :red_heart:️ :red_heart:️ Kombucha :fakeemoji: :tropical_drink:")
    }
  ]}
}
