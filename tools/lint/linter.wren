/** doc-disable */
// automatically generated from https://github.com/munificent/wrenalyzer/archive/master.zip
/*
MIT License

Copyright (c) 2015 Robert Nystrom

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
class Node {}

class Expr is Node {}

class Stmt is Node {}

class Module is Node {
  construct new(statements) {
    _statements = statements
  }

  statements { _statements }

  accept(visitor) { visitor.visitModule(this) }

  toString { "Module(%(_statements))" }
}

class MapEntryNode {
  construct new(key, value) {
    _key = key
    _value = value
  }

  key { _key }
  value { _value }

  toString { "%(_key): %(_value)" }
}

class Method {
  construct new(foreignKeyword, staticKeyword, constructKeyword, name, body) {
    _foreignKeyword = foreignKeyword
    _staticKeyword = staticKeyword
    _constructKeyword = constructKeyword
    _name = name
    _body = body
  }

  foreignKeyword { _foreignKeyword }
  staticKeyword { _staticKeyword }
  constructKeyword { _constructKeyword }
  name { _name }
  body { _body }

  accept(visitor) { visitor.visitMethod(this) }

  toString {
    return "Method(%(_staticKeyword) %(_constructKeyword) %(_name) %(_body))"
  }
}

/// A block argument or method body.
class Body {
  construct new(parameters, expression, statements) {
    _parameters = parameters
    _expression = expression
    _statements = statements
  }

  parameters { _parameters }
  expression { _expression }
  statements { _statements }

  accept(visitor) { visitor.visitBody(this) }

  toString {
    return "Body(%(_parameters) %(_expression) %(_statements))"
  }
}

class ListExpr is Expr {
  construct new(leftBracket, elements, rightBracket) {
    _leftBracket = leftBracket
    _elements = elements
    _rightBracket = rightBracket
  }

  leftBracket { _leftBracket }
  elements { _elements }
  rightBracket { _rightBracket }

  accept(visitor) { visitor.visitListExpr(this) }

  toString {
    return "List(%(_leftBracket) %(_elements) %(_rightBracket))"
  }
}

class ThisExpr is Expr {
  construct new(keyword) {
    _keyword = keyword
  }

  keyword { _keyword }

  accept(visitor) { visitor.visitThisExpr(this) }

  toString {
    return "This(%(_keyword))"
  }
}

class NullExpr is Expr {
  construct new(value) {
    _value = value
  }

  value { _value }

  accept(visitor) { visitor.visitNullExpr(this) }

  toString {
    return "Null(%(_value))"
  }
}

class StaticFieldExpr is Expr {
  construct new(name) {
    _name = name
  }

  name { _name }

  accept(visitor) { visitor.visitStaticFieldExpr(this) }

  toString {
    return "StaticField(%(_name))"
  }
}

class FieldExpr is Expr {
  construct new(name) {
    _name = name
  }

  name { _name }

  accept(visitor) { visitor.visitFieldExpr(this) }

  toString {
    return "Field(%(_name))"
  }
}

class CallExpr is Expr {
  construct new(receiver, name, arguments, blockArgument) {
    _receiver = receiver
    _name = name
    _arguments = arguments
    _blockArgument = blockArgument
  }

  receiver { _receiver }
  name { _name }
  arguments { _arguments }
  blockArgument { _blockArgument }

  accept(visitor) { visitor.visitCallExpr(this) }

  toString {
    return "Call(%(_receiver) %(_name) %(_arguments) %(_blockArgument))"
  }
}

class PrefixExpr is Expr {
  construct new(operator, right) {
    _operator = operator
    _right = right
  }

  operator { _operator }
  right { _right }

  accept(visitor) { visitor.visitPrefixExpr(this) }

  toString {
    return "Prefix(%(_operator) %(_right))"
  }
}

class GroupingExpr is Expr {
  construct new(leftParen, expression, rightParen) {
    _leftParen = leftParen
    _expression = expression
    _rightParen = rightParen
  }

  leftParen { _leftParen }
  expression { _expression }
  rightParen { _rightParen }

  accept(visitor) { visitor.visitGroupingExpr(this) }

  toString {
    return "Grouping(%(_leftParen) %(_expression) %(_rightParen))"
  }
}

class AssignmentExpr is Expr {
  construct new(target, equal, value) {
    _target = target
    _equal = equal
    _value = value
  }

  target { _target }
  equal { _equal }
  value { _value }

  accept(visitor) { visitor.visitAssignmentExpr(this) }

  toString {
    return "Assignment(%(_target) %(_equal) %(_value))"
  }
}

class InfixExpr is Expr {
  construct new(left, operator, right) {
    _left = left
    _operator = operator
    _right = right
  }

  left { _left }
  operator { _operator }
  right { _right }

  accept(visitor) { visitor.visitInfixExpr(this) }

  toString {
    return "Infix(%(_left) %(_operator) %(_right))"
  }
}

class MapExpr is Expr {
  construct new(leftBrace, entries, rightBrace) {
    _leftBrace = leftBrace
    _entries = entries
    _rightBrace = rightBrace
  }

  leftBrace { _leftBrace }
  entries { _entries }
  rightBrace { _rightBrace }

  accept(visitor) { visitor.visitMapExpr(this) }

  toString {
    return "Map(%(_leftBrace) %(_entries) %(_rightBrace))"
  }
}

class ConditionalExpr is Expr {
  construct new(condition, question, thenBranch, colon, elseBranch) {
    _condition = condition
    _question = question
    _thenBranch = thenBranch
    _colon = colon
    _elseBranch = elseBranch
  }

  condition { _condition }
  question { _question }
  thenBranch { _thenBranch }
  colon { _colon }
  elseBranch { _elseBranch }

  accept(visitor) { visitor.visitConditionalExpr(this) }

  toString {
    return "Conditional(%(_condition) %(_question) %(_thenBranch) %(_colon) %(_elseBranch))"
  }
}

class NumExpr is Expr {
  construct new(value) {
    _value = value
  }

  value { _value }

  accept(visitor) { visitor.visitNumExpr(this) }

  toString {
    return "Num(%(_value))"
  }
}

class SuperExpr is Expr {
  construct new(name, arguments, blockArgument) {
    _name = name
    _arguments = arguments
    _blockArgument = blockArgument
  }

  name { _name }
  arguments { _arguments }
  blockArgument { _blockArgument }

  accept(visitor) { visitor.visitSuperExpr(this) }

  toString {
    return "Super(%(_name) %(_arguments) %(_blockArgument))"
  }
}

class StringExpr is Expr {
  construct new(value) {
    _value = value
  }

  value { _value }

  accept(visitor) { visitor.visitStringExpr(this) }

  toString {
    return "String(%(_value))"
  }
}

class SubscriptExpr is Expr {
  construct new(receiver, leftBracket, arguments, rightBracket) {
    _receiver = receiver
    _leftBracket = leftBracket
    _arguments = arguments
    _rightBracket = rightBracket
  }

  receiver { _receiver }
  leftBracket { _leftBracket }
  arguments { _arguments }
  rightBracket { _rightBracket }

  accept(visitor) { visitor.visitSubscriptExpr(this) }

  toString {
    return "Subscript(%(_receiver) %(_leftBracket) %(_arguments) %(_rightBracket))"
  }
}

class BoolExpr is Expr {
  construct new(value) {
    _value = value
  }

  value { _value }

  accept(visitor) { visitor.visitBoolExpr(this) }

  toString {
    return "Bool(%(_value))"
  }
}

class InterpolationExpr is Expr {
  construct new(strings, expressions) {
    _strings = strings
    _expressions = expressions
  }

  strings { _strings }
  expressions { _expressions }

  accept(visitor) { visitor.visitInterpolationExpr(this) }

  toString {
    return "Interpolation(%(_strings) %(_expressions))"
  }
}

class ForStmt is Stmt {
  construct new(variable, iterator, body) {
    _variable = variable
    _iterator = iterator
    _body = body
  }

  variable { _variable }
  iterator { _iterator }
  body { _body }

  accept(visitor) { visitor.visitForStmt(this) }

  toString {
    return "For(%(_variable) %(_iterator) %(_body))"
  }
}

class ReturnStmt is Stmt {
  construct new(keyword, value) {
    _keyword = keyword
    _value = value
  }

  keyword { _keyword }
  value { _value }

  accept(visitor) { visitor.visitReturnStmt(this) }

  toString {
    return "Return(%(_keyword) %(_value))"
  }
}

class BlockStmt is Stmt {
  construct new(statements) {
    _statements = statements
  }

  statements { _statements }

  accept(visitor) { visitor.visitBlockStmt(this) }

  toString {
    return "Block(%(_statements))"
  }
}

class VarStmt is Stmt {
  construct new(name, initializer) {
    _name = name
    _initializer = initializer
  }

  name { _name }
  initializer { _initializer }

  accept(visitor) { visitor.visitVarStmt(this) }

  toString {
    return "Var(%(_name) %(_initializer))"
  }
}

class ImportStmt is Stmt {
  construct new(path, variables) {
    _path = path
    _variables = variables
  }

  path { _path }
  variables { _variables }

  accept(visitor) { visitor.visitImportStmt(this) }

  toString {
    return "Import(%(_path) %(_variables))"
  }
}

class IfStmt is Stmt {
  construct new(condition, thenBranch, elseBranch) {
    _condition = condition
    _thenBranch = thenBranch
    _elseBranch = elseBranch
  }

  condition { _condition }
  thenBranch { _thenBranch }
  elseBranch { _elseBranch }

  accept(visitor) { visitor.visitIfStmt(this) }

  toString {
    return "If(%(_condition) %(_thenBranch) %(_elseBranch))"
  }
}

class BreakStmt is Stmt {
  construct new(keyword) {
    _keyword = keyword
  }

  keyword { _keyword }

  accept(visitor) { visitor.visitBreakStmt(this) }

  toString {
    return "Break(%(_keyword))"
  }
}

class WhileStmt is Stmt {
  construct new(condition, body) {
    _condition = condition
    _body = body
  }

  condition { _condition }
  body { _body }

  accept(visitor) { visitor.visitWhileStmt(this) }

  toString {
    return "While(%(_condition) %(_body))"
  }
}

class ClassStmt is Stmt {
  construct new(foreignKeyword, name, superclass, methods) {
    _foreignKeyword = foreignKeyword
    _name = name
    _superclass = superclass
    _methods = methods
  }

  foreignKeyword { _foreignKeyword }
  name { _name }
  superclass { _superclass }
  methods { _methods }

  accept(visitor) { visitor.visitClassStmt(this) }

  toString {
    return "Class(%(_foreignKeyword) %(_name) %(_superclass) %(_methods))"
  }
}
// Utilities for working with characters.
class Chars {
  static tab { 0x09 }
  static lineFeed { 0x0a }
  static carriageReturn { 0x0d }
  static space { 0x20 }
  static bang { 0x21 }
  static quote { 0x22 }
  static percent { 0x25 }
  static amp { 0x26 }
  static leftParen { 0x28 }
  static rightParen { 0x29 }
  static star { 0x2a }
  static plus { 0x2b }
  static comma { 0x2c }
  static minus { 0x2d }
  static dot { 0x2e }
  static slash { 0x2f }

  static zero { 0x30 }
  static nine { 0x39 }

  static colon { 0x3a }
  static less { 0x3c }
  static equal { 0x3d }
  static greater { 0x3e }
  static question { 0x3f }

  static upperA { 0x41 }
  static upperF { 0x46 }
  static upperZ { 0x5a }

  static leftBracket { 0x5b }
  static backslash { 0x5c }
  static rightBracket { 0x5d }
  static caret { 0x5e }
  static underscore { 0x5f }

  static lowerA { 0x61 }
  static lowerF { 0x66 }
  static lowerX { 0x78 }
  static lowerZ { 0x7a }

  static leftBrace { 0x7b }
  static pipe { 0x7c }
  static rightBrace { 0x7d }
  static tilde { 0x7e }

  static isAlpha(c) {
    return c >= lowerA && c <= lowerZ ||
           c >= upperA && c <= upperZ ||
           c == underscore
  }

  static isDigit(c) { c >= zero && c <= nine }

  static isAlphaNumeric(c) { isAlpha(c) || isDigit(c) }

  static isHexDigit(c) {
    return c >= zero && c <= nine ||
           c >= lowerA && c <= lowerF ||
           c >= upperA && c <= upperF
  }

  static isLowerAlpha(c) { c >= lowerA && c <= lowerZ }
}
class Token {
  // Punctuators.
  static leftParen { "leftParen" }
  static rightParen { "rightParen" }
  static leftBracket { "leftBracket" }
  static rightBracket { "rightBracket" }
  static leftBrace { "leftBrace" }
  static rightBrace { "rightBrace" }
  static colon { "colon" }
  static dot { "dot" }
  static dotDot { "dotDot" }
  static dotDotDot { "dotDotDot" }
  static comma { "comma" }
  static star { "star" }
  static slash { "slash" }
  static percent { "percent" }
  static plus { "plus" }
  static minus { "minus" }
  static pipe { "pipe" }
  static pipePipe { "pipePipe" }
  static caret { "caret" }
  static amp { "amp" }
  static ampAmp { "ampAmp" }
  static question { "question" }
  static bang { "bang" }
  static tilde { "tilde" }
  static equal { "equal" }
  static less { "less" }
  static lessEqual { "lessEqual" }
  static lessLess { "lessLess" }
  static greater { "greater" }
  static greaterEqual { "greaterEqual" }
  static greaterGreater { "greaterGreater" }
  static equalEqual { "equalEqual" }
  static bangEqual { "bangEqual" }

  // Keywords.
  static breakKeyword { "break" }
  static classKeyword { "class" }
  static constructKeyword { "construct" }
  static elseKeyword { "else" }
  static falseKeyword { "false" }
  static forKeyword { "for" }
  static foreignKeyword { "foreign" }
  static ifKeyword { "if" }
  static importKeyword { "import" }
  static inKeyword { "in" }
  static isKeyword { "is" }
  static nullKeyword { "null" }
  static returnKeyword { "return" }
  static staticKeyword { "static" }
  static superKeyword { "super" }
  static thisKeyword { "this" }
  static trueKeyword { "true" }
  static varKeyword { "var" }
  static whileKeyword { "while" }

  static field { "field" }
  static staticField { "staticField" }
  static name { "name" }
  static number { "number" }
  static string { "string" }
  static interpolation { "interpolation" }
  static line { "line" }
  static error { "error" }
  static eof { "eof" }

  construct new(source, type, start, length) {
    _source = source
    _type = type
    _start = start
    _length = length
  }

  /// The source file this token was parsed from.
  source { _source }
  type { _type }
  text { _source.substring(_start, _length) }

  start { _start }
  length { _length }
  
  /// The 1-based line number that the token starts on.
  lineStart { _source.lineAt(_start) }
  lineEnd { _source.lineAt(_start + _length) }

  /// The 1-based column number that the token starts on.
  columnStart { _source.columnAt(_start) }
  columnEnd { _source.columnAt(_start + _length) }

  toString { text }
}
/// Base visitor class that walks the entire AST.
class RecursiveVisitor {
  visitModule(node) {
    for (statement in node.statements) {
      statement.accept(this)
    }
  }

  visitMethod(node) {
    // Foreign methods do not have a body.
    if (node.body != null) node.body.accept(this)
  }

  visitBody(node) {
    if (node.expression != null) node.expression.accept(this)
    if (node.statements != null) {
      for (statement in node.statements) {
        statement.accept(this)
      }
    }
  }

  // Expressions.

  visitAssignmentExpr(node) {
    node.target.accept(this)
    node.value.accept(this)
  }

  visitBoolExpr(node) {}

  visitCallExpr(node) {
    if (node.receiver != null) node.receiver.accept(this)
    if (node.arguments != null) {
      for (argument in node.arguments) {
        argument.accept(this)
      }
    }

    if (node.blockArgument != null) node.blockArgument.accept(this)
  }

  visitConditionalExpr(node) {
    node.condition.accept(this)
    node.thenBranch.accept(this)
    node.elseBranch.accept(this)
  }

  visitFieldExpr(node) {}

  visitGroupingExpr(node) {
    node.expression.accept(this)
  }

  visitInfixExpr(node) {
    node.left.accept(this)
    node.right.accept(this)
  }

  visitInterpolationExpr(node) {
    for (expression in node.expressions) {
      expression.accept(this)
    }
  }

  visitListExpr(node) {
    for (element in node.elements) {
      element.accept(this)
    }
  }

  visitMapExpr(node) {
    for (entry in node.entries) {
      entry.key.accept(this)
      entry.value.accept(this)
    }
  }

  visitNullExpr(node) {}

  visitNumExpr(node) {}

  visitPrefixExpr(node) {
    node.right.accept(this)
  }

  visitStaticFieldExpr(node) {}

  visitStringExpr(node) {}

  visitSubscriptExpr(node) {
    node.receiver.accept(this)
    for (argument in node.arguments) {
      argument.accept(this)
    }
  }

  visitSuperExpr(node) {
    if (node.arguments != null) {
      for (argument in node.arguments) {
        argument.accept(this)
      }
    }

    if (node.blockArgument != null) node.blockArgument.accept(this)
  }

  visitThisExpr(node) {}

  // Statements.

  visitBlockStmt(node) {
    for (statement in node.statements) {
      statement.accept(this)
    }
  }

  visitBreakStmt(node) {}

  visitClassStmt(node) {
    for (method in node.methods) {
      method.accept(this)
    }
  }

  visitForStmt(node) {
    node.iterator.accept(this)
    node.body.accept(this)
  }

  visitIfStmt(node) {
    node.condition.accept(this)
    node.thenBranch.accept(this)
    if (node.elseBranch != null) node.elseBranch.accept(this)
  }

  visitImportStmt(node) {}

  visitReturnStmt(node) {
    if (node.value != null) node.value.accept(this)
  }

  visitVarStmt(node) {
    if (node.initializer != null) node.initializer.accept(this)
  }

  visitWhileStmt(node) {
    node.condition.accept(this)
    node.body.accept(this)
  }
}

var KEYWORDS = {
  "break": Token.breakKeyword,
  "class": Token.classKeyword,
  "construct": Token.constructKeyword,
  "else": Token.elseKeyword,
  "false": Token.falseKeyword,
  "for": Token.forKeyword,
  "foreign": Token.foreignKeyword,
  "if": Token.ifKeyword,
  "import": Token.importKeyword,
  "in": Token.inKeyword,
  "is": Token.isKeyword,
  "null": Token.nullKeyword,
  "return": Token.returnKeyword,
  "static": Token.staticKeyword,
  "super": Token.superKeyword,
  "this": Token.thisKeyword,
  "true": Token.trueKeyword,
  "var": Token.varKeyword,
  "while": Token.whileKeyword
}

// Data table for tokens that are tokenized using maximal munch.
//
// The key is the character that starts the token or tokens. After that is a
// list of token types and characters. As long as the next character is matched,
// the type will update to the type after that character.
var PUNCTUATORS = {
  Chars.leftParen: [Token.leftParen],
  Chars.rightParen: [Token.rightParen],
  Chars.leftBracket: [Token.leftBracket],
  Chars.rightBracket: [Token.rightBracket],
  Chars.leftBrace: [Token.leftBrace],
  Chars.rightBrace: [Token.rightBrace],
  Chars.colon: [Token.colon],
  Chars.comma: [Token.comma],
  Chars.star: [Token.star],
  Chars.slash: [Token.slash],
  Chars.percent: [Token.percent],
  Chars.plus: [Token.plus],
  Chars.minus: [Token.minus],
  Chars.tilde: [Token.tilde],
  Chars.caret: [Token.caret],
  Chars.question: [Token.question],
  Chars.lineFeed: [Token.line],

  Chars.pipe: [Token.pipe, Chars.pipe, Token.pipePipe],
  Chars.amp: [Token.amp, Chars.amp, Token.ampAmp],
  Chars.bang: [Token.bang, Chars.equal, Token.bangEqual],
  Chars.equal: [Token.equal, Chars.equal, Token.equalEqual],

  Chars.dot: [Token.dot, Chars.dot, Token.dotDot, Chars.dot, Token.dotDotDot]
}

class Lexer {
  construct new(source) {
    _source = source
    _start = 0
    _current = 0

    // The stack of ongoing interpolated strings. Each element in the list is
    // a single level of interpolation nesting. The value of the element is the
    // number of unbalanced "(" still remaining to be closed.
    _interpolations = []
  }

  readToken() {
    if (_current >= _source.count) return makeToken(Token.eof)

    skipWhitespace()

    // TODO: Skip comments.

    _start = _current
    var c = _source[_current]
    advance()

    if (!_interpolations.isEmpty) {
      if (c == Chars.leftParen) {
        _interpolations[-1] = _interpolations[-1] + 1
      } else if (c == Chars.rightParen) {
        _interpolations[-1] = _interpolations[-1] - 1

        // The last ")" in an interpolated expression ends the expression and
        // resumes the string.
        if (_interpolations[-1] == 0) {
          // This is the final ")", so the interpolation expression has ended.
          // This ")" now begins the next section of the template string.
          _interpolations.removeAt(-1)
          return readString()
        }
      }
    }

    if (PUNCTUATORS.containsKey(c)) {
      var punctuator = PUNCTUATORS[c]
      var type = punctuator[0]
      var i = 1
      while (i < punctuator.count) {
        if (!match(punctuator[i])) break
        type = punctuator[i + 1]
        i = i + 2
      }

      return makeToken(type)
    }

    // Handle "<", "<<", and "<=".
    if (c == Chars.less) {
      if (match(Chars.less)) return makeToken(Token.lessLess)
      if (match(Chars.equal)) return makeToken(Token.lessEqual)
      return makeToken(Token.less)
    }

    // Handle ">", ">>", and ">=".
    if (c == Chars.greater) {
      if (match(Chars.greater)) return makeToken(Token.greaterGreater)
      if (match(Chars.equal)) return makeToken(Token.greaterEqual)
      return makeToken(Token.greater)
    }

    if (c == Chars.underscore) return readField()
    if (c == Chars.quote) return readString()

    if (c == Chars.zero && peek() == Chars.lowerX) return readHexNumber()
    if (Chars.isDigit(c)) return readNumber()
    if (Chars.isAlpha(c)) return readName()

    return makeToken(Token.error)
  }

  // Skips over whitespace and comments.
  skipWhitespace() {
    while (true) {
      var c = peek()
      if (c == Chars.tab || c == Chars.carriageReturn || c == Chars.space) {
        // Whitespace is ignored.
        advance()
      } else if (c == Chars.slash && peek(1) == Chars.slash) {
        // A line comment stops at the newline since newlines are significant.
        while (peek() != Chars.lineFeed && !isAtEnd) {
          advance()
        }
      } else if (c == Chars.slash && peek(1) == Chars.star) {
        advance()
        advance()

        // Block comments can nest.
        var nesting = 1
        while (nesting > 0) {
          // TODO: Report error.
          if (isAtEnd) return

          if (peek() == Chars.slash && peek(1) == Chars.star) {
            advance()
            advance()
            nesting = nesting + 1
          } else if (peek() == Chars.star && peek(1) == Chars.slash) {
            advance()
            advance()
            nesting = nesting - 1
            if (nesting == 0) break
          } else {
            advance()
          }
        }
      } else {
        break
      }
    }
  }

  // Reads a static or instance field.
  readField() {
    var type = Token.field
    if (match(Chars.underscore)) type = Token.staticField

    // Read the rest of the name.
    while (match {|c| Chars.isAlphaNumeric(c) }) {}

    return makeToken(type)
  }

  // Reads a string literal.
  readString() {
    var type = Token.string

    while (_current < _source.count - 1) {
      var c = _source[_current]
      advance()

      if (c == Chars.backslash) {
        // TODO: Process specific escapes and validate them.
        advance()
      } else if (c == Chars.percent) {
        // Consume the '('.
        advance()
        // TODO: Handle missing '('.
        _interpolations.add(1)
        type = Token.interpolation
        break
      } else if (c == Chars.quote) {
        break
      }
    }

    // TODO: Handle unterminated string.

    return makeToken(type)
  }

  // Reads a number literal.
  readHexNumber() {
    // Skip past the `x`.
    advance()

    // Read the rest of the number.
    while (match {|c| Chars.isHexDigit(c) }) {}
    return makeToken(Token.number)
  }

  // Reads a number literal.
  readNumber() {
    // Read the rest of the number.
    while (match {|c| Chars.isDigit(c) }) {}

    // TODO: Floating point, scientific.
    return makeToken(Token.number)
  }

  // Reads an identifier or keyword token.
  readName() {
    // Read the rest of the name.
    while (match {|c| Chars.isAlphaNumeric(c) }) {}

    var text = _source.substring(_start, _current - _start)
    var type = Token.name
    if (KEYWORDS.containsKey(text)) {
      type = KEYWORDS[text]
    }

    return Token.new(_source, type, _start, _current - _start)
  }

  // Returns `true` if we have scanned all characters.
  isAtEnd { _current >= _source.count }

  // Advances past the current character.
  advance() {
    _current = _current + 1
  }

  // Returns the byte value of the current character.
  peek() { peek(0) }

  // Returns the byte value of the character [n] bytes past the current
  // character.
  peek(n) {
    if (_current + n >= _source.count) return -1
    return _source[_current + n]
  }

  // Consumes the current character if it matches [condition], which can be a
  // numeric code point value or a function that takes a code point and returns
  // `true` if the code point matches.
  match(condition) {
    if (isAtEnd) return false

    var c = _source[_current]
    if (condition is Fn) {
      if (!condition.call(c)) return false
    } else if (c != condition) {
      return false
    }

    advance()
    return true
  }

  // Creates a token of [type] from the current character range.
  makeToken(type) { Token.new(_source, type, _start, _current - _start) }
}

/// A single file of Wren source code.
///
/// Handles mapping token offsets to lines and columns.
class SourceFile {
  construct new(path, string) {
    _path = path
    _string = string

    // Due to the magic of UTF-8, we can safely treat Wren source as a series
    // of bytes, since the only code points that are meaningful to Wren fit in
    // ASCII. The only place where non-ASCII code points can occur is inside
    // string literals and comments and the lexer safely treats those as opaque
    // bytes.
    _bytes = string.bytes
  }

  /// Gets the byte at [index] in the source file.
  [index] { _bytes[index] }

  /// The number of bytes in the source file.
  count { _bytes.count }

  /// The file path of the source file.
  path { _path }

  /// Gets the 1-based line that the byte at offset lies on.
  columnAt(offset) {
    var column = 1

    // Walk backwards until we hit a newline.
    for (i in (offset - 1)..0) {
      if (_bytes[i] == Chars.lineFeed) break
      column = column + 1
    }
    return column
  }

  /// Gets the 1-based line that the byte at offset lies on.
  lineAt(offset) {
    // Count all of the newlines before the offset.
    // TODO: Binary search to optimize.
    var line = 0
    findLines_()
    for (i in 0..._lines.count) {
      if (offset < _lines[i]) return i
    }
    return _lines.count
  }

  /// Gets the source text of [line], where 1 is the first line.
  getLine(line) {
    var newlines = findLines_()
    return _string[newlines[line - 1]...(newlines[line] - 1)]
  }

  /// Gets a substring of the source string starting at [start] with [length]
  /// bytes.
  substring(start, length) { _string[start...(start + length)] }

  /// Finds the byte offset of the beginning of every line in the source file.
  /// This lets us quickly map offsets to lines and vice versa.
  findLines_() {
    if (_lines != null) return _lines

    _lines = [0]
    for (i in 0..._bytes.count) {
      if (_bytes[i] == Chars.lineFeed) _lines.add(i + 1)
    }
    return _lines
  }
}

class Scope {
  construct new(reporter) {
    _reporter = reporter

    // TODO: Hard-coding these is a hack (as is using "true" for their value
    // instead of a token). Should load the core library and implicitly import
    // it.
    var moduleScope = {
      "Bool": true,
      "Class": true,
      "Fiber": true,
      "Fn": true,
      "List": true,
      "Map": true,
      "MapKeySequence": true,
      "MapSequence": true,
      "MapValueSequence": true,
      "Null": true,
      "Num": true,
      "Object": true,
      "Range": true,
      "Sequence": true,
      "String": true,
      "StringByteSequence": true,
      "StringCodePointSequence": true,
      "System": true,
      "WhereSequence": true
    }
    _scopes = [moduleScope]

    _forwardReferences = []
  }

  /// Declares a variable with [name] in the current scope.
  declare(name) {
    var scope = _scopes[-1]
    if (scope.containsKey(name.text)) {
      _reporter.error(
            "A variable named '%(name.text)' is already defined in " +
            "this scope, on line %(scope[name.text].lineStart).",
            [scope[name.text], name])
      return
    }

    scope[name.text] = name
  }

  /// Looks for a previously declared variable with [name].
  ///
  /// Reports an error if not found.
  resolve(name) {
    var reachedClass = false
    for (i in (_scopes.count - 1)..0) {
      // Don't walk past a class definition.
      if (_scopes[i] == null) {
        reachedClass = true
        break
      }

      if (_scopes[i].containsKey(name.text)) {
        // Found it in a containing lexical scope.
        return _scopes[i][name.text]
      }
    }

    if (reachedClass) {
      if (Chars.isLowerAlpha(name.text.bytes[0])) {
        // A lowercase name inside a class is treated like a self-send so do
        // nothing.
        return null
      } else {
        // A capitalized name is resolved at the module level.
        if (_scopes[0].containsKey(name.text)) {
          // Found it in a containing lexical scope.
          return _scopes[0][name.text]
        } else {
          // Assume it's a forward reference for now.
          _forwardReferences.add(name)
          return
        }
      }
    }

    // If we got here, it's not defined.
    _reporter.error("Variable '%(name.text)' is not defined.", [name])
  }

  // Begins a new lexical block scope.
  begin() {
    _scopes.add({})
  }

  // Ends the innermost scope.
  end() {
    _scopes.removeAt(-1)
  }

  /// Marks that we are inside a class definition.
  ///
  /// When walking up lexical scopes for a name, we stop at a class definition
  /// so we can detect implicit self sends.
  beginClass() {
    // TODO: Using a null scope as a sentinel is kind of hacky.
    _scopes.add(null)
  }

  /// Ends the current class definition.
  endClass() {
    _scopes.removeAt(-1)
  }

  /// Report errors for any module-level variables that were referenced but
  /// never defined.
  checkForwardReferences() {
    for (use in _forwardReferences) {
      if (!_scopes[0].containsKey(use.text)) {
        _reporter.error("Variable '%(use.text)' is not defined.", [use])
      }
    }
  }
}

// ANSI color escapes.
var RED = "\x1b[31m"
var CYAN = "\x1b[36m"
var GRAY = "\x1b[30;1m"
var NORMAL = "\x1b[0m"

/// Reports analysis results in an easily machine-parseable form.
class JsonReporter {
  construct new() {}

  /// Reports an error with [message] stemming from the given list of [tokens].
  /// The last token, if there is more than one, is consideRED the primary
  /// token that led to the error. The others are informative and related to it.
  error(message, tokens) {
    var source = tokens[-1].source

    var tokensJson = tokens.map {|token|
      return {
        "start": token.start,
        "length": token.length,
        "lineStart": token.lineStart,
        "lineEnd": token.lineEnd,
        "columnStart": token.columnStart,
        "columnEnd": token.columnEnd
      }
    }.toList

    var json = {
      // TODO: Other severities.
      "severity": "error",
      "path": source.path,
      "message": message,
      "tokens": tokensJson
    }

    var parts = []
    jsonToBuffer(json, parts)
    System.print(parts.join())
  }

  jsonToBuffer(json, parts) {
    if (json is List) {
      parts.add("[")
      var first = true
      for (element in json) {
        if (!first) parts.add(",")
        first = false
        jsonToBuffer(element, parts)
      }
      parts.add("]")
    } else if (json is Map) {
      parts.add("{")
      var first = true
      for (key in json.keys) {
        if (!first) parts.add(",")
        first = false
        jsonToBuffer(key, parts)
        parts.add(":")
        jsonToBuffer(json[key], parts)
      }
      parts.add("}")
    } else if (json is String) {
      // TODO: Escape quotes and other special characters.
      parts.add("\"%(json)\"")
    } else {
      // Num, Bool, Null.
      parts.add(json)
    }
  }
}

/// Outputs errors and other analysis results in a human-friendly form.
class PrettyReporter {
  construct new() {}

  /// Reports an error with [message] stemming from the given list of [tokens].
  /// The last token, if there is more than one, is considered the primary
  /// token that led to the error. The others are informative and related to it.
  error(message, tokens) {
    // The main erroneous token is always the last.
    var mainToken = tokens[-1]

    var source = mainToken.source
    System.print(
        "[%(source.path) %(mainToken.lineStart):%(mainToken.columnStart)] " +
        "%(RED)Error:%(NORMAL) %(message)")

    var lineWidth = 0
    for (token in tokens) {
      var width = token.lineEnd.toString.count
      if (width > lineWidth) lineWidth = width
    }

    // TODO: Collapse output if multiple tokens are on the same line.
    for (token in tokens) {
      var color = token == mainToken ? RED : CYAN
      var end = token == mainToken ? "^" : "."
      var mid = token == mainToken ? "-" : "."

      var line = source.getLine(token.lineStart)
      var lineNum = "%(GRAY)%(padLeft_(token.lineStart, lineWidth)):%(NORMAL) "
      var indent = padLeft_(" ", lineWidth + 2)

      if (token.type == Token.line) {
        // The newline is the error, so make it visible.
        System.print("%(lineNum)%(line)%(GRAY)\\n%(NORMAL)")
        System.print("%(indent)%(" " * line.count)" +
            "%(color)%(end)%(end)%(NORMAL)")
      } else {
        System.print("%(lineNum)%(line)")

        var space = " " * (token.columnStart - 1)
        var highlight = end
        var length = token.columnEnd - token.columnStart
        if (length > 1) {
          highlight = end + mid * (length - 2) + end
        }
        System.print("%(indent)%(space)%(color)%(highlight)%(NORMAL)")
      }
    }
  }

  // TODO: Add padBefore() and padAfter() to String?
  padLeft_(value, width) {
    var result = value.toString
    while (result.count < width) result = " " + result
    return result
  }
}

/// Walks a parsed AST and resolves identifiers.
class Resolver is RecursiveVisitor {
  construct new(reporter) {
    _scope = Scope.new(reporter)
  }

  resolve(node) {
    node.accept(this)
  }

  visitModule(node) {
    // TODO: Implicitly import core.
    super(node)
    _scope.checkForwardReferences()
  }

//  visitMethod(node) { super(node) }

  visitBody(node) {
    _scope.begin()
    declareVariables(node.parameters)
    super(node)
    _scope.end()
  }

  // Expressions.

  // TODO: Make sure LHS is valid.
//  visitAssignmentExpr(node) { super(node) }
//  visitBoolExpr(node) { super(node) }

  visitCallExpr(node) {
    // TODO: Resolve name if there is no receiver.
    if (node.receiver != null) {
      node.receiver.accept(this)
    } else {
      _scope.resolve(node.name)
    }

    // TODO: Error if name is a variable and we have arguments.

    if (node.arguments != null) {
      for (argument in node.arguments) {
        argument.accept(this)
      }
    }

    if (node.blockArgument != null) node.blockArgument.accept(this)
  }

//  visitConditionalExpr(node) { super(node) }

  // TODO: Make sure we're inside instance method.
//  visitFieldExpr(node) { super(node) }
//  visitGroupingExpr(node) { super(node) }

//  visitInfixExpr(node) { super(node) }
//  visitInterpolationExpr(node) { super(node) }
//  visitListExpr(node) { super(node) }
//  visitMapExpr(node) { super(node) }
//  visitNullExpr(node) { super(node) }
//  visitNumExpr(node) { super(node) }
//  visitPrefixExpr(node) { super(node) }
  // TODO: Make sure we're inside class.
//  visitStaticFieldExpr(node) { super(node) }
//  visitStringExpr(node) { super(node) }
//  visitSubscriptExpr(node) { super(node) }
//  visitThisExpr(node) { super(node) }

  // Statements.

  visitBlockStmt(node) {
    _scope.begin()
    super(node)
    _scope.end()
  }

  // TODO: Warn on dead code.
//  visitBreakStmt(node) { super(node) }

  visitClassStmt(node) {
    _scope.declare(node.name)
    _scope.beginClass()
    super(node)
    _scope.endClass()
  }

  visitForStmt(node) {
    _scope.begin()
    _scope.declare(node.variable)

    super(node)

    _scope.end()
  }

//  visitIfStmt(node) { super(node) }

  visitImportStmt(node) {
    declareVariables(node.variables)
    super(node)
  }

  // TODO: Warn on dead code.
//  visitReturnStmt(node) { super(node) }

  visitVarStmt(node) {
    _scope.declare(node.name)
    super(node)
  }

//  visitWhileStmt(node) { super(node) }

  /// Declare [variables] in the current scope from the given list of name
  /// tokens.
  declareVariables(variables) {
    if (variables == null) return
    for (variable in variables) {
      _scope.declare(variable)
    }
  }
}

var EQUALITY_OPERATORS = [
  Token.equalEqual,
  Token.bangEqual
]

var COMPARISON_OPERATORS = [
  Token.less,
  Token.lessEqual,
  Token.greater,
  Token.greaterEqual
]

var BITWISE_SHIFT_OPERATORS = [
  Token.lessLess,
  Token.greaterGreater
]

var RANGE_OPERATORS = [
  Token.dotDot,
  Token.dotDotDot
]

var TERM_OPERATORS = [
  Token.plus,
  Token.minus
]

var FACTOR_OPERATORS = [
  Token.star,
  Token.slash,
  Token.percent
]

var PREFIX_OPERATORS = [
  Token.minus,
  Token.bang,
  Token.tilde
]

var INFIX_OPERATORS = [
  Token.pipePipe,
  Token.ampAmp,
  Token.equalEqual,
  Token.bangEqual,
  Token.isKeyword,
  Token.less,
  Token.lessEqual,
  Token.greater,
  Token.greaterEqual,
  Token.pipe,
  Token.caret,
  Token.amp,
  Token.lessLess,
  Token.greaterGreater,
  Token.dotDot,
  Token.dotDotDot,
  Token.plus,
  Token.minus,
  Token.star,
  Token.slash,
  Token.percent
]

class Parser {
  construct new(lexer, reporter) {
    _lexer = lexer
    _reporter = reporter
    _current = _lexer.readToken()
  }

  parseModule() {
    ignoreLine()

    var statements = []
    while (peek() != Token.eof) {
      statements.add(definition())

      if (peek() == Token.eof) break
      consumeLine("Expect newline.")
    }

    consume(Token.eof, "Expect end of input.")
    return Module.new(statements)
  }

  definition() {
    if (match(Token.classKeyword)) {
      return finishClass(null)
    }

    if (match(Token.foreignKeyword)) {
      var foreignKeyword = _previous
      consume(Token.classKeyword, "Expect 'class' after 'foreign'.")
      return finishClass(foreignKeyword)
    }

    if (match(Token.importKeyword)) {
      var path = consume(Token.string, "Expect import path.")
      var variables

      // Parse the variable list, if there is one.
      if (match(Token.forKeyword)) {
        ignoreLine()

        variables = []
        while (true) {
          variables.add(consume(Token.name, "Expect imported variable name."))
          if (!match(Token.comma)) break
          ignoreLine()
        }
      }

      return ImportStmt.new(path, variables)
    }

    if (match(Token.varKeyword)) {
      var name = consume(Token.name, "Expect variable name.")
      var initializer
      if (match(Token.equal)) {
        initializer = expression()
      }

      return VarStmt.new(name, initializer)
    }

    return statement()
  }

  // Parses the rest of a class definition after the "class" token.
  finishClass(foreignKeyword) {
    var name = consume(Token.name, "Expect class name.")

    var superclass
    if (match(Token.isKeyword)) {
      // TODO: This is different from the VM (which is wrong). Need to make
      // sure we don't parse the class body as a block argument.
      superclass = consume(Token.name, "Expect name of superclass.")
    }

    var methods = []
    consume(Token.leftBrace, "Expect '{' after class name.")
    ignoreLine()

    while (!match(Token.rightBrace) && peek() != Token.eof) {
      methods.add(method())

      // Don't require a newline after the last definition.
      if (match(Token.rightBrace)) break

      consumeLine("Expect newline after definition in class.")
    }

    return ClassStmt.new(foreignKeyword, name, superclass, methods)
  }

  method() {
    // Note: This parses more permissively than the grammar actually is. For
    // example, it will allow "static construct *()". We'll report errors on
    // invalid forms later.
    var foreignKeyword
    if (match(Token.foreignKeyword)) {
      foreignKeyword = _previous
    }

    var staticKeyword
    if (match(Token.staticKeyword)) {
      staticKeyword = _previous
    }

    var constructKeyword
    if (match(Token.constructKeyword)) {
      constructKeyword = _previous
    }

    // TODO: Error on invalid combinations of above keywords.

    var name
    var parameters

    var allowParameters = false

    if (match(Token.leftBracket)) {
      // Subscript operator.
      parameters = parameterList()
      consume(Token.rightBracket, "Expect ']' after parameters.")
      allowParameters = false
    } else if (matchAny(INFIX_OPERATORS)) {
      _previous
      allowParameters = true
    } else if (matchAny([Token.bang, Token.tilde])) {
      allowParameters = false
    } else {
      consume(Token.name, "Expect method name.")
      allowParameters = true
    }
    name = _previous

    if (match(Token.leftParen)) {
      // Parse the parameter list even if not allowed to give better errors
      // and have fewer cascaded errors.
      if (!allowParameters) {
        error("A parameter list is not allowed for this method.")
      }

      ignoreLine()
      if (!match(Token.rightParen)) {
        parameters = parameterList()
        ignoreLine()
        consume(Token.rightParen, "Expect ')' after parameters.")
      }
    }
    // TODO: Setters.

    var body
    if (foreignKeyword == null) {
      consume(Token.leftBrace, "Expect '{' before method body.")
      body = finishBody(parameters)
    }

    return Method.new(foreignKeyword, staticKeyword, constructKeyword, name, body)
  }

  statement() {
    // Break statement.
    if (match(Token.breakKeyword)) {
      return BreakStmt.new(_previous)
    }

    // If statement.
    if (match(Token.ifKeyword)) {
      consume(Token.leftParen, "Expect '(' after 'if'.")
      ignoreLine()
      var condition = expression()
      consume(Token.rightParen, "Expect ')' after if condition.")
      var thenBranch = statement()
      var elseBranch
      if (match(Token.elseKeyword)) {
        elseBranch = statement()
      }
      return IfStmt.new(condition, thenBranch, elseBranch)
    }

    // For statement.
    if (match(Token.forKeyword)) {
      consume(Token.leftParen, "Expect '(' after 'for'.")
      var variable = consume(Token.name, "Expect for loop variable name.")
      consume(Token.inKeyword, "Expect 'in' after loop variable.")
      ignoreLine()
      var iterator = expression()
      consume(Token.rightParen, "Expect ')' after loop expression.")
      var body = statement()
      return ForStmt.new(variable, iterator, body)
    }

    // While statement.
    if (match(Token.whileKeyword)) {
      consume(Token.leftParen, "Expect '(' after 'while'.")
      ignoreLine()
      var condition = expression()
      consume(Token.rightParen, "Expect ')' after while condition.")
      var body = statement()
      return WhileStmt.new(condition, body)
    }

    // Return statement.
    if (match(Token.returnKeyword)) {
      var keyword = _previous
      var value
      if (peek() != Token.line) {
        value = expression()
      }

      return ReturnStmt.new(keyword, value)
    }

    // Block statement.
    if (match(Token.leftBrace)) {
      var statements = []
      ignoreLine()

      while (peek() != Token.rightBrace && peek() != Token.eof) {
        statements.add(definition())

        // Don't require a newline after the last statement.
        if (peek() == Token.rightBrace) break

        consumeLine("Expect newline after statement.")
      }

      consume(Token.rightBrace, "Expect '}' after block.")
      return BlockStmt.new(statements)
    }

    // Expression statement.
    return expression()
  }

  // Parses the rest of a method or block argument body.
  finishBody(parameters) {
    // An empty block.
    if (match(Token.rightBrace)) return Body.new(parameters, null, [])

    // If there's no line after the "{", it's a single-expression body.
    if (!matchLine()) {
      var expr = expression()
      ignoreLine()
      consume(Token.rightBrace, "Expect '}' at end of block.")
      return Body.new(parameters, expr, null)
    }

    // Empty blocks (with just a newline inside) do nothing.
    if (match(Token.rightBrace)) return Body.new(parameters, null, [])

    var statements = []
    while (peek() != Token.eof) {
      statements.add(definition())
      consumeLine("Expect newline after statement.")

      if (match(Token.rightBrace)) break
    }

    return Body.new(parameters, null, statements)
  }

  expression() { assignment() }

  // assignment: conditional ( "=" assignment )?
  assignment() {
    // TODO: This allows invalid LHS like "1 + 2 = 3". Decide if we want to
    // handle that here or later in the pipeline.
    var expr = conditional()
    if (!match(Token.equal)) return expr

    var equal = _previous
    var value = assignment()
    return AssignmentExpr.new(expr, equal, value)
  }

  // conditional: logicalOr ( "?" conditional ":" assignment )?
  conditional() {
    var expr = logicalOr()
    if (!match(Token.question)) return expr

    var question = _previous
    var thenBranch = conditional()
    var colon = consume(Token.colon,
        "Expect ':' after then branch of conditional operator.")
    var elseBranch = assignment()
    return ConditionalExpr.new(expr, question, thenBranch, colon, elseBranch)
  }

  // logicalOr: logicalAnd ( "||" logicalAnd )*
  logicalOr() { parseInfix([Token.pipePipe]) { logicalAnd() } }

  // logicalAnd: equality ( "&&" equality )*
  logicalAnd() { parseInfix([Token.ampAmp]) { equality() } }

  // equality: typeTest ( equalityOperator typeTest )*
  // equalityOperator: "==" | "!="
  equality() { parseInfix(EQUALITY_OPERATORS) { typeTest() } }

  // typeTest: comparison ( "is" comparison )*
  typeTest() { parseInfix([Token.isKeyword]) { comparison() } }

  // comparison: bitwiseOr ( comparisonOperator bitwiseOr )*
  // comparisonOperator: "<" | ">" | "<=" | ">="
  comparison() { parseInfix(COMPARISON_OPERATORS) { bitwiseOr() } }

  // bitwiseOr: bitwiseXor ( "|" bitwiseXor )*
  bitwiseOr() { parseInfix([Token.pipe]) { bitwiseXor() } }

  // bitwiseXor: bitwiseAnd ( "^" bitwiseAnd )*
  bitwiseXor() { parseInfix([Token.caret]) { bitwiseAnd() } }

  // bitwiseAnd: bitwiseShift ( "&" bitwiseShift )*
  bitwiseAnd() { parseInfix([Token.amp]) { bitwiseShift() } }

  // bitwiseShift: range ( bitwiseShiftOperator range )*
  // bitwiseShiftOperator: "<<" | ">>"
  bitwiseShift() { parseInfix(BITWISE_SHIFT_OPERATORS) { range() } }

  // range: term ( rangeOperator term )*
  // rangeOperator: ".." | ".."
  range() { parseInfix(RANGE_OPERATORS) { term() } }

  // term: factor ( termOperator factor )*
  // termOperator: "+" | "-"
  term() { parseInfix(TERM_OPERATORS) { factor() } }

  // factor: prefix ( factorOperator prefix )*
  // factorOperator: "*" | "/" | "%"
  factor() { parseInfix(FACTOR_OPERATORS) { prefix() } }

  // prefix: ("-" | "!" | "~")* call
  prefix() {
    if (matchAny(PREFIX_OPERATORS)) {
      return PrefixExpr.new(_previous, prefix())
    }

    return call()
  }

  // call: primary ( subscript | "." methodCall )*
  // subscript: "[" argumentList "]"
  call() {
    var expr = primary()

    while (true) {
      if (match(Token.leftBracket)) {
        var leftBracket = _previous
        var arguments = argumentList()
        var rightBracket = consume(Token.rightBracket,
            "Expect ']' after subscript arguments.")
        expr = SubscriptExpr.new(expr, leftBracket, arguments, rightBracket)
      } else if (match(Token.dot)) {
        var name = consume(Token.name, "Expect method name after '.'.")
        expr = methodCall(expr, name)
      } else {
        break
      }
    }

    return expr
  }

  // Parses the argument list for a method call and creates a call expression
  // for it.
  //
  // methodCall: ( "(" argumentList? ")" )? blockArgument?
  // blockArgument: "{" ( "|" parameterList "|" )? body "}"
  // parameterList: Name ( "," Name )*
  // body:
  //   | "\n" ( definition "\n" )*
  //   | expression
  methodCall(receiver, name) {
    var arguments = finishCall()
    return CallExpr.new(receiver, name, arguments[0], arguments[1])
  }

  // Parses the argument list for a method call. Returns a list containing the
  // argument list (if any) and block argument (if any). If either is missing,
  // the list element at that position is `null`.
  finishCall() {
    var arguments
    if (match(Token.leftParen)) {
      // Allow an empty argument list. Note that we treat this differently than
      // a getter (no argument list). The former will have a `null` argument
      // list and the latter will have an empty one.
      if (match(Token.rightParen)) {
        arguments = []
      } else {
        arguments = argumentList()
        consume(Token.rightParen, "Expect ')' after arguments.")
      }
    }

    var blockArgument
    if (match(Token.leftBrace)) {
      var parameters
      if (match(Token.pipe)) {
        parameters = parameterList()
        consume(Token.pipe, "Expect '|' after block parameters.")
      }

      blockArgument = finishBody(parameters)
    }

    return [arguments, blockArgument]
  }

  // argumentList: expression ( "," expression )*
  argumentList() {
    var arguments = []

    ignoreLine()
    while (true) {
      arguments.add(expression())
      if (!match(Token.comma)) break
      ignoreLine()
    }

    return arguments
  }

  // parameterList: name ( "," name )*
  parameterList() {
    var parameters = []

    while (true) {
      parameters.add(consume(Token.name, "Expect parameter name."))
      if (!match(Token.comma)) break
      ignoreLine()
    }

    return parameters
  }

  // primary:
  //   | grouping
  //   | listLiteral
  //   | mapLiteral
  //   | "true" | "false" | "null" | "this"
  //   | Field | StaticField | Number
  primary() {
    if (match(Token.leftParen))         return grouping()
    if (match(Token.leftBracket))       return listLiteral()
    if (match(Token.leftBrace))         return mapLiteral()
    if (match(Token.name))              return methodCall(null, _previous)
    if (match(Token.superKeyword))      return superCall()

    if (match(Token.falseKeyword))      return BoolExpr.new(_previous)
    if (match(Token.trueKeyword))       return BoolExpr.new(_previous)
    if (match(Token.nullKeyword))       return NullExpr.new(_previous)
    if (match(Token.thisKeyword))       return ThisExpr.new(_previous)

    // TODO: Error if not inside class.
    if (match(Token.field))             return FieldExpr.new(_previous)
    if (match(Token.staticField))       return StaticFieldExpr.new(_previous)

    if (match(Token.number))            return NumExpr.new(_previous)
    if (match(Token.string))            return StringExpr.new(_previous)

    if (peek() == Token.interpolation)  return stringInterpolation()
    // TODO: Token.super.

    error("Expect expression.")
    // Make a fake node so that we don't have to worry about null later.
    // TODO: Should this be an error node?
    return NullExpr.new(_previous)
  }

  // Finishes parsing a parenthesized expression.
  //
  // grouping: "(" expressions ")"
  grouping() {
    var leftParen = _previous
    var expr = expression()
    var rightParen = consume(Token.rightParen, "Expect ')' after expression.")
    return GroupingExpr.new(leftParen, expr, rightParen)
  }

  // Finishes parsing a list literal.
  //
  // listLiteral: "[" ( expression ("," expression)* ","? )? "]"
  listLiteral() {
    var leftBracket = _previous
    var elements = []

    ignoreLine()

    while (peek() != Token.rightBracket) {
      elements.add(expression())

      ignoreLine()
      if (!match(Token.comma)) break
      ignoreLine()
    }

    var rightBracket = consume(Token.rightBracket,
        "Expect ']' after list elements.")
    return ListExpr.new(leftBracket, elements, rightBracket)
  }

  // Finishes parsing a map literal.
  //
  // mapLiteral: "[" ( mapEntry ("," mapEntry)* ","? )? "}"
  // mapEntry:   expression ":" expression
  mapLiteral() {
    var leftBrace = _previous
    var entries = []

    ignoreLine()

    while (peek() != Token.rightBrace) {
      var key = expression()
      consume(Token.colon, "Expect ':' after map key.")

      var value = expression()
      entries.add(MapEntryNode.new(key, value))

      ignoreLine()
      if (!match(Token.comma)) break
      ignoreLine()
    }

    var rightBrace = consume(Token.rightBrace, "Expect '}' after map entries.")
    return MapExpr.new(leftBrace, entries, rightBrace)
  }

  superCall() {
    var name
    if (match(Token.dot)) {
      // It's a named super call.
      name = consume(Token.name, "Expect method name after 'super.'.")
    }

    var arguments = finishCall()
    return SuperExpr.new(name, arguments[0], arguments[1])
  }

  // stringInterpolation: (interpolation expression )? string
  stringInterpolation() {
    var strings = []
    var expressions = []

    while (match(Token.interpolation)) {
      strings.add(_previous)
      expressions.add(expression())
    }

    // This error should never be reported. It's the lexer's job to ensure we
    // generate the right token sequence.
    strings.add(consume(Token.string, "Expect end of string interpolation."))

    return InterpolationExpr.new(strings, expressions)
  }

  // Utility methods.

  // Parses a left-associative series of infix operator expressions using any
  // of [tokenTypes] as operators and calling [parseOperand] to parse the left
  // and right operands.
  parseInfix(tokenTypes, parseOperand) {
    var expr = parseOperand.call()
    while (matchAny(tokenTypes)) {
      var operator = _previous
      ignoreLine()
      var right = parseOperand.call()
      expr = InfixExpr.new(expr, operator, right)
    }

    return expr
  }

  // If the next token has [type], consumes and returns it. Otherwise, returns
  // `null`.
  match(type) {
    if (peek() != type) return null
    return consume()
  }

  // Consumes and returns the next token if its type is contained in the list
  // [types].
  matchAny(types) {
    for (type in types) {
      var result = match(type)
      if (result) return result
    }

    return null
  }

  // Consumes zero or more newlines. Returns `true` if at least one was matched.
  matchLine() {
    if (!match(Token.line)) return false
    while (match(Token.line)) {
      // Do nothing.
    }

    return true
  }

  // Same as [matchLine()], but makes it clear that the intent is to discard
  // newlines appearing where this is called.
  ignoreLine() { matchLine() }

  // Consumes one or more newlines.
  consumeLine(error) {
    consume(Token.line, error)
    ignoreLine()
  }

  // Reads and consumes the next token.
  consume() {
    peek()
    _previous = _current
    _current = null
    return _previous
  }

  // Reads the next token if it is of [type]. Otherwise, discards it and
  // reports an error with [message]
  consume(type, message) {
    var token = consume()
    if (token.type != type) error(message)

    return token
  }

  // Returns the type of the next token.
  peek() {
    if (_current == null) _current = _lexer.readToken()
    return _current.type
  }

  /// Reports an error on the most recent token.
  error(message) {
    _reporter.error(message, [_current != null ? _current : _previous])
  }
}
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
