/** doc-name: utils.logging.wren */

/** doc-header
## Wren Logger
Inspired on Swift Log
https://github.com/apple/swift-log
*/

/**
Its central function is to emit log messages using one of the methods
corresponding to a log level.

The most basic usage of a `Logger` is
- Example:
```js
import "domepunk/utils/logging" for Logger
var label = "domepunk.test.logger"
var logger = Logger.new(label)
logger.info("Hello World!")
```
- Since: `1.0.0`
*/
class Logger {

  toString {this.label}

  /**
  Get or set the configured log handler.
  Defaults to `SystemPrintLogHandler`
  */
  handler {
    if (!_handler) {
      _handler = SystemPrintLogHandler.new()
    }
    return _handler
  }

  handler = (value) {
    if (value is LogHandler) {
      _handler = value
    }
  }

  /**
  Get or set the configured log label.
  An identifier of the creator of this `Logger`.
  Defaults to `System.Logger`.
  */
  label {
    if (!_label) {
      _label = "System.Logger"
    }
    return _label
  }

  label = (value) {
    _label = value
  }

  /**
  Get or set the configured log level.
  */
  level {handler.level}
  level = (value) {
    handler.level = value
  }

  meta {handler.meta}
  meta = (value) {
    handler.meta = value
  }

  /**
  Creates a new Logger with specified label and handler.
  - Signature: `construct new(label:String?, handler:LogHandler?) -> Logger`
  */
  construct new(label, handler) {
    this.label = label
    this.handler = handler
  }

  construct new(label) {
    this.label = label
  }

  construct new() {}

  canLog(level) {
    return (this.level.magnitude <= level.magnitude)
  }

  /**
  Log a message passing with the `level` log level.

  If `level` is at least as severe as the `Logger`'s `log level`, it will be logged,
  otherwise nothing will happen.
  - Signature: `trace(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  log(level, message, metadata, file, function, line) {
    if (canLog(level)) {
      handler.log(level, message, metadata, file, function, line)
    }
  }

  /**
  */
  log(level, message, metadata) {
    if (canLog(level)) {
      handler.log(level, message, metadata)
    }
  }

  /**
  */
  log(level, message) {
    if (canLog(level)) {
      handler.log(level, message)
    }
  }

  /**
  */
  log(message){
    if (canLog(this.level)) {
      handler.log(message)
    }
  }

  /**
  Log a message passing with the `LogLevel.trace` log level.

  If `.trace` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `trace(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  trace(message, metadata, file, function, line) {
    log(LogLevel.trace, message, metadata, file, function, line)
  }

  /**
  */
  trace(message, metadata) {
    log(LogLevel.trace, message, metadata)
  }

  /**
  */
  trace(message) {
    log(LogLevel.trace, message)
  }

  /**
  Log a message passing with the `LogLevel.debug` log level.

  If `.debug` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `debug(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  debug(message, metadata, file, function, line) {
    log(LogLevel.debug, message, metadata, file, function, line)
  }

  /**
  */
  debug(message, metadata) {
    log(LogLevel.debug, message, metadata)
  }

  /**
  */
  debug(message) {
    log(LogLevel.debug, message)
  }

  /**
  Log a message passing with the `LogLevel.info` log level.

  If `.info` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `info(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  info(message, metadata, file, function, line) {
    log(LogLevel.info, message, metadata, file, function, line)
  }

  /**
  */
  info(message, metadata) {
    log(LogLevel.info, message, metadata)
  }

  /**
  */
  info(message) {
    log(LogLevel.info, message)
  }

  /**
  Log a message passing with the `LogLevel.notice` log level.

  If `.notice` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `notice(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  notice(message, metadata, file, function, line) {
    log(LogLevel.notice, message, metadata, file, function, line)
  }

  /**
  */
  notice(message, metadata) {
    log(LogLevel.notice, message, metadata)
  }

  /**
  */
  notice(message) {
    log(LogLevel.notice, message)
  }

  /**
  Log a message passing with the `LogLevel.warning` log level.

  If `.warning` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `warning(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  warning(message, metadata, file, function, line) {
    log(LogLevel.warning, message, metadata, file, function, line)
  }

  /**
  */
  warning(message, metadata) {
    log(LogLevel.warning, message, metadata)
  }

  /**
  */
  warning(message) {
    log(LogLevel.warning, message)
  }

  /**
  */
  warn(message, metadata, file, function, line) {
    log(LogLevel.warning, message, metadata, file, function, line)
  }

  /**
  */
  warn(message, metadata) {
    log(LogLevel.warning, message, metadata)
  }

  /**
  */
  warn(message) {
    log(LogLevel.warning, message)
  }

  /**
  Log a message passing with the `LogLevel.error` log level.

  If `.error` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `error(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  error(message, metadata, file, function, line) {
    log(LogLevel.error, message, metadata, file, function, line)
  }

  /**
  */
  error(message, metadata) {
    log(LogLevel.error, message, metadata)
  }

  /**
  */
  error(message) {
    log(LogLevel.error, message)
  }

  /**
  Log a message passing with the `LogLevel.critical` log level.

  If `.critical` is at least as severe as the `Logger`'s `logLevel`, it will be logged,
  otherwise nothing will happen.
  - Signature: `critical(message:String, metadata:Map?, file:String?, function:String?, line:Num?) -> Void`
  - Parameters:
    - message: The message to be logged. `message` can be used with any string interpolation literal.
    - metadata: *optional* One-off metadata to attach to this log message
    - file: *optional* The file this log message originates from.
    - function: *optional* The function this log message originates from.
    - line: *optional* The line this log message originates from.
  */
  critical(message, metadata, file, function, line) {
    log(LogLevel.critical, message, metadata, file, function, line)
  }

  /**
  */
  critical(message, metadata) {
    log(LogLevel.critical, message, metadata)
  }

  /**
  */
  critical(message) {
    log(LogLevel.critical, message)
  }
}

/**
The log level.
Log levels are ordered by their severity, with `.trace` being the least severe and
`.critical` being the most severe.
*/
class LogLevel {

  toString {this.name}

  /**
  Disable all logging
  */
  static disable {
    if (!__disable) {
      __disable = LogLevel.new("DISABLE", 99)
    }
    return __disable
  }

  /**
  Appropriate for messages that contain information only when debugging a program.
  */
  static trace {
    if (!__trace) {
      __trace = LogLevel.new("TRACE", 0)
    }
    return __trace
  }

  /**
  Appropriate for messages that contain information normally of use only when
  debugging a program.
  - Alias: `log`
  */
  static debug {
    if (!__debug) {
      __debug = LogLevel.new("DEBUG", 1)
    }
    return __debug
  }

  /**
  Appropriate for informational messages.
  */
  static info {
    if (!__info) {
      __info = LogLevel.new("INFO", 2)
    }
    return __info
  }

  /**
  Appropriate for conditions that are not error conditions, but that may require
  special handling.
  */
  static notice {
    if (!__notice) {
      __notice = LogLevel.new("NOTICE", 3)
    }
    return __notice
  }

  /**
  Appropriate for messages that are not error conditions, but more severe than
  `.notice`.
  */
  static warning {
    if (!__warning) {
      __warning = LogLevel.new("WARNING", 4)
    }
    return __warning
  }

  /**
  Appropriate for error conditions.
  */
  static error {
    if (!__error) {
      __error = LogLevel.new("ERROR", 5)
    }
    return __error
  }

  /**
  Appropriate for critical error conditions that usually require immediate
  attention.
  */
  static critical {
    if (!__critical) {
      __critical = LogLevel.new("CRITICAL", 6)
    }
    return __critical
  }

  static all {
    if (!__all) {
      __all = [disable, trace, debug, info, notice, warning, error, critical]
    }
    return __all
  }

  static valid(level) {all.contains(level)}

  /**
  Level Name
  */
  name {_name || ""}

  /**
  Level Importance
  */
  magnitude {_magnitude || 0}

  construct new(name, magnitude) {
    _name = name
    _magnitude = magnitude
  }
}

/**
A `LogHandler` is an implementation of a logging backend.
*/
class LogHandler {

  /**
  Get or set the entire metadata storage as a map.
  */
  meta {
    if (!_metadata) {
      _metadata = {}
    }
    return _metadata
  }

  /**
  */
  meta = (value) {
    if (value is Map) {
      _metadata = value
    }
  }

  /**
  */
  meta(key, value) {
    meta[key.toString] = value
  }

  /**
  */
  meta(key) {
    return meta[key]
  }

  /**
  */
  metaReset() {
    _metadata = {}
  }

  /**
  Get or set the configured log level.
  Defaults to `LogLevel.info`
  */
  level {
    if (!_level) {
      _level = LogLevel.info
    }
    return _level
  }

  /**
  */
  level = (value) {
    if (LogLevel.valid(value)) {
      _level = value
    }
  }

  /**
  This method is called when a `LogHandler` must emit a log message. There is no need for the `LogHandler` to
  check if the `level` is above or below the configured `logLevel` as `Logger` already performed this check and
  determined that a message should be logged.
  - Signature: `log(level: LogLevel, message: Logger.Message, metadata: Logger.Metadata?, file: String?, function: String?, line: Num?)`
  - Parameters:
    - level: The log level the message was logged at.
    - message: The message to log. To obtain a `String` representation call `message.description`.
    - metadata: The metadata associated to this log message.
    - file: The file the log message was emitted from.
    - function: The function the log line was emitted from.
    - line: The line the log message was emitted from.
  */
  log(level, message, metadata, file, function, line) {}

  /**
  */
  log(level, message, metadata) {}

  /**
  */
  log(level, message) {}

  /**
  */
  log(message) {}


  logMeta(level, message, file, function, line) {}
  logMeta(level, message) {}
  logMeta(message) {}
}

/**
A Log Handler that use System.print()
*/
class SystemPrintLogHandler is LogHandler {

  log(level, message, metadata, file, function, line) {
    metadata = metadata || this.meta || {}
    System.print("[%(level)] %(message) | %(metadata) | file: %(file) | function: %(function) | line: %(line)")
  }

  log(level, message, metadata) {
    metadata = metadata || this.meta || {}
    System.print("[%(level)] %(message) | %(metadata)")
  }

  log(level, message) {
    System.print("[%(level)] %(message)")
  }

  log(message) {
    System.print("[%(this.level)] %(message)")
  }

  logMeta(level, message, file, function, line) {
    log(level, message, null, file, function, line)
  }

  logMeta(level, message) {
    log(level, message, null)
  }

  logMeta(message) {
    log(this.level, message, null)
  }

  construct new() {}
}
