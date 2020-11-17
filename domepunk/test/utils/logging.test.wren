import "domepunk/utils/logging" for Logger, LogLevel, SystemPrintLogHandler

class LoggingTests {
  static describe {"utils/logging.wren"}
  static all {[
    test
  ]}

  static test {[
    "Logger", [
      [
        ".new()",
        Fn.new {|assert|
          var label = "domepunk.test.logger"

          var logger = Logger.new(label)

          assert.equal(logger.label, label)
          assert.isKind(logger.handler, SystemPrintLogHandler)

          var message = "Hello"
          assert.success {
            logger.meta["hello"] = true
            logger.level = LogLevel.disable
            logger.log(LogLevel.info, message, {"hello": true}, "hello.wren", "hello()", 123)
            logger.trace(message)
            logger.debug(message)
            logger.notice(message)
            logger.info(message)
            logger.warn(message)
            logger.warning(message)
            logger.error(message)
            logger.critical(message)
          }
        }
      ],
    ]
  ]}
}
