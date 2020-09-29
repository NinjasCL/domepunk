import "random" for Random

// Inspired on https://pypi.org/project/emoji/
class Emoji {

    static emojis {Codes.all}

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

    static nameFor(emoji) {
      var emojis = Emoji.emojis
      return Emoji.nameFor(emoji, emojis)
    }

    // Wren does not have regex module
    // so we have to use poor man regex
    static emojize(string) {
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
