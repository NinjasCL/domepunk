#!/usr/bin/env python3
# -*- coding: UTF-8 -*-

import emojis

"""
This file will generate the emoji code list
for usage within a Wren environment
"""

def emojiList(items):
  out = ""
  total = len(items) - 1
  for index, (key, value) in enumerate(items):
    out += f"""
    "{key.lower()}": "{value}\""""
    if index != total:
      out +=","
  return out

def generateWrenCode():
  out = """/** doc-disable */
/*
* This class is automatically generated with
* tools/emoji/Makefile
* Do not modify directly.
* Modify misc/emoji/emoji.wren and rebuild with the Makefile tool
*/
class Codes {
  """

  # Uncomment for a separated list
  # But it would generate a 500kb file
  #
  # out += """
  # static emojis {{
  # """
  # out += emojiList(emojis.EMOJI_UNICODE.items())
  # out += """
  # }}
  # """

  # out += """
  # static alias {{
  # """
  # out += emojiList(emojis.EMOJI_ALIAS_UNICODE.items())
  # out += """
  # }}
  # """

  # merge dictionaries
  unique = {**emojis.EMOJI_UNICODE, **emojis.EMOJI_ALIAS_UNICODE}

  out += """
  static all {{
  """
  out += emojiList(unique.items())
  out += """
  }}
  """

  out += """
}
  """

  print(out)

if __name__ == "__main__":
  generateWrenCode()
