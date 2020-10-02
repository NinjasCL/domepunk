/*
-- DOMEPUNK --
This class is used as a template
for analyzing dome wren code.
Is modified by the Python script on the fly.
Replacing {json} {filepath} and {ast} with proper values.
And then executed by dome.

This class is under the Mozilla Public License 2.0

Permissions of this weak copyleft
license are conditioned on making
available source code of licensed
files and modifications of those files
under the same license
(or in certain cases, one of the GNU licenses).
Copyright and license notices must be preserved.
Contributors provide an express grant of patent rights.
However, a larger work using the licensed work may be
distributed under different terms and without source code for
files added in the larger work.

*/
import "dome" for Process
import "io" for FileSystem

class Game {
  static init() {

    var reporter = PrettyReporter.new()
    if ({json}) {
      reporter = JsonReporter.new()
    }

    var code = FileSystem.load("{filepath}")
    var source = SourceFile.new("{filepath}", code)
    var lexer = Lexer.new(source)
    var parser = Parser.new(lexer, reporter)
    var ast = parser.parseModule()

    var resolver = Resolver.new(reporter)
    resolver.resolve(ast)

    if ({ast}) {
      System.print(ast)
    }

    Process.exit()
  }
}
