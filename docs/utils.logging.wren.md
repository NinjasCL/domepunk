<!-- file: domepunk/utils/logging.wren -->
<!-- documentation automatically generated using domepunk/tools/doc -->
## Wren Logger
Inspired on Swift Log
https://github.com/apple/swift-log

---
## [Class Logger](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L23)


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

## API

### [handler](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L31)


Get or set the configured log handler.
Defaults to `SystemPrintLogHandler`

### [label](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L49)


Get or set the configured log label.
An identifier of the creator of this `Logger`.
Defaults to `System.Logger`.

### [level](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L63)


Get or set the configured log level.

### [construct new(label, handler)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L77)


Creates a new Logger with specified label and handler.
- Signature: `construct new(label:String?, handler:LogHandler?) -> Logger`

### [construct new(label)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L84)



### [construct new()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L90)



### [log(level, message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L109)


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

### [log(level, message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L117)



### [log(level, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L125)



### [log(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L133)



### [trace(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L152)


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

### [trace(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L158)



### [trace(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L164)



### [debug(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L181)


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

### [debug(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L187)



### [debug(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L193)



### [info(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L210)


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

### [info(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L216)



### [info(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L222)



### [notice(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L239)


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

### [notice(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L245)



### [notice(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L251)



### [warning(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L268)


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

### [warning(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L274)



### [warning(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L280)



### [warn(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L286)



### [warn(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L292)



### [warn(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L298)



### [error(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L315)


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

### [error(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L321)



### [error(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L327)



### [critical(message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L344)


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

### [critical(message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L350)



### [critical(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L356)



---
## [Class LogLevel](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L366)


The log level.
Log levels are ordered by their severity, with `.trace` being the least severe and
`.critical` being the most severe.

## API

### [static disable](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L373)


Disable all logging

### [static trace](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L383)


Appropriate for messages that contain information only when debugging a program.

### [static debug](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L395)


Appropriate for messages that contain information normally of use only when
debugging a program.
- Alias: `log`

### [static info](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L405)


Appropriate for informational messages.

### [static notice](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L416)


Appropriate for conditions that are not error conditions, but that may require
special handling.

### [static warning](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L427)


Appropriate for messages that are not error conditions, but more severe than
`.notice`.

### [static error](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L437)


Appropriate for error conditions.

### [static critical](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L448)


Appropriate for critical error conditions that usually require immediate
attention.

### [name](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L468)


Level Name
- Signature: `name:String`

### [severity](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L474)


Level Severity
- Signature: `severity:Num`

---
## [Class LogHandler](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L485)


A `LogHandler` is an implementation of a logging backend.

## API

### [meta](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L490)


Get or set the entire metadata storage as a map.

### [meta = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L499)



### [meta(key, value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L507)



### [meta(key)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L513)



### [metaReset()](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L519)



### [level](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L527)


Get or set the configured log level.
Defaults to `LogLevel.info`

### [level = (value)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L536)



### [log(level, message, metadata, file, function, line)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L555)


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

### [log(level, message, metadata)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L559)



### [log(level, message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L563)



### [log(message)](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L567)



---
## [Class SystemPrintLogHandler is LogHandler](https://github.com/ninjascl/domepunk/blob/main/domepunk/utils/logging.wren#L578)


A Log Handler that use System.print()
