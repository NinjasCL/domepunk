"""
This is a simple documentation generator.
The idea is to parse wren files and look for
markdown style comments (/** */).

Then generate the proper .md files inside docs
directory.
"""
import re
import glob
import sys
import config
from pathlib import Path

# Avoid parsing the file
# e.g. /** doc-disable */
CMD_DISABLE = "doc-disable"

# Sets the filename for the doc
# e.g /** doc-name: MyDoc */
CMD_FILENAME = "doc-name:"

def commandIsDisable(comment):
  return comment.strip() == CMD_DISABLE

def commandIsFilename(comment):
  return comment.strip().startswith(CMD_FILENAME)

def getFiles(path = None):
  # Safely get the first arg
  # Use default path if not found
  path = path or dict(enumerate(sys.argv)).get(1) + "/" or "../../"
  files = glob.glob(f'{path}**/*.wren', recursive=True)

  return files

def getFileContent(path):
  with open(path) as file:
    return file.read()

def getFileInfo(path):
  return Path(path)

def getLineNumber(index, content):
  line = 1
  for pos, char in enumerate(content):
    if char == "\n":
      line += 1
    if index == pos:
      return line
  return None

def getComments(content, file):
  # Regex for /** comment start
  startCommentRegex = re.compile("\s*\S*(\/\*\*)")

  # for all the found matches
  # search for the corresponding */
  # and save the comment inside
  comments = []
  startMatches = startCommentRegex.finditer(content)
  endCommentChar = "*/"
  openCurlyBraceChar = "{"
  filename = None

  for startMatch in startMatches:
    start = startMatch.span()[1]
    end = content.find(endCommentChar, start)
    lineno = getLineNumber(start, content)

    if end >= 0:
      comment = content[start:end]
      # count leading spaces https://stackoverflow.com/a/13649013
      spaces = (len(comment) - 1) - len(comment.lstrip())

      if comment != "":

        if commandIsDisable(comment):
          return []

        if commandIsFilename(comment):
          filename = comment[comment.find(CMD_FILENAME) + len(CMD_FILENAME):].strip()
          continue

        nextlineStart = end + len(endCommentChar)
        nextlineEnd = content.find(openCurlyBraceChar, nextlineStart)
        nextline = content[nextlineStart:nextlineEnd]
        nextlineno = getLineNumber(nextlineStart, content)

        comments.append(
          (
            (comment, start, end, lineno),
            (nextline, nextlineStart, nextlineEnd, nextlineno),
            (spaces, filename)
          )
        )

  return comments

def getHref(line, lineno, url):
  return f"[{line}]({url}#L{lineno})\n"

def saveFile(path, content):
  file = open(path, "w+")
  file.write(content)
  file.close()

def makeMarkdownFile(comments, file):

  info = getFileInfo(file)
  # print(info, info.name, info.stem, info.parent)
  url = f"https://{config.repo}/{config.branch}/{info}"

  markdown = f"""<!-- file: {info} -->
<!-- documentation automatically generated using domepunk/tools/doc -->"""

  apiHeaderPresent = False
  headerIndex = 0

  for index, comment in enumerate(comments):
    content, line, meta = comment
    spaces, filename = meta

    content, cstart, cend, clineno = content
    line, lstart, lend, llineno = line

    line = line.strip()

    # Headers
    if line.startswith("class "):
      markdown += f"\n## {getHref(line.title(), clineno, url)}\n"
    else:
      if not apiHeaderPresent:
        markdown += "\n## API\n"
        apiHeaderPresent = True

      markdown += f"\n### {getHref(line, llineno, url)}\n"

    # Write comment contents to the markdown file
    buffer = ""
    for char in content:
      buffer += char
      if char == "\n":
        # strip leading spaces to have a proper markdown doc
        markdown += buffer[spaces:].rstrip() + char
        buffer = ""

  name = f"{info}".lower().replace("/", "-").replace("\\", "-")
  if filename:
    name = filename

  doc = f"{config.docs}/{name}.md"
  saveFile(doc, markdown)


def main():
  files = getFiles()
  for file in files:
    content = getFileContent(file)
    comments = getComments(content, file)
    if len(comments) > 0:
      makeMarkdownFile(comments, file)

if __name__ == "__main__":
  main()


