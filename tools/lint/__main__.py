"""
This is a simple linter using wrenalyzer.
May need some work to do to improve the linting process.

Some false positive linting errors can occur.

This could be done by:

1 - Dome accepting params. So we can ditch creating a temp file.
2 - Improving the Wrenalizer code or create an alternative AST generator.

"""

import sys
import inspect
import os
import json
from uuid import uuid4


def getPath(path = None):
  # Safely get the first arg
  # Use default path if not found
  path = path or dict(enumerate(sys.argv)).get(1) or "../.."
  return path

def main():
  # https://stackoverflow.com/a/44592299
  filename = inspect.getframeinfo(inspect.currentframe()).filename
  path = os.path.dirname(os.path.abspath(filename))

  template = path + "/linter.wren"

  printAst = False
  jsonErrorReporter = False

  fileToLint = "../../../" + getPath()

  if not fileToLint.endswith(".wren"):
    raise Exception("only *.wren files supported")

  with open(template) as f:
    content = f.read()
    content = content.replace("{filepath}", fileToLint).replace("{json}", json.dumps(jsonErrorReporter)).replace("{ast}", json.dumps(printAst))

  name = f"temp/{uuid4()}.temp.wren"

  temp = open(path + "/" + name, "w+")
  temp.write(content)
  temp.close()

  print(name)



if __name__ == "__main__":
  main()
