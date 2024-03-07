import 'dart:core';

import 'package:logger/logger.dart';

/// AppLogger can be thought of as a singleton wrapper for Logger, which it is composed of.
/// We never want more than one Logger instance.
class AppLogger {
  AppLogger({
    LogOutput? output,
    LogFilter? filter,
    int? methodCount,
    PrettyPrinter? pp,
  }) {
    logger = Logger(
      filter:
          filter, // If null Use the default LogFilter (-> only log in debug mode)
      printer: pp ??
          // Right now the logic is such that there is no opting out of
          // using a PrettyPrinter. If that becomes necessary, then a simple
          // switch statement could be added here.
          PrettyPrinter(
            methodCount: 10, // number of method calls to be displayed
            errorMethodCount: methodCount ??
                10, // number of method calls if stacktrace is provided
            lineLength: 90, // width of the output
            printTime: true, // Should each log print contain a timestamp
          ), // Use the PrettyPrinter to format and print log
      output:
          output, // If null Use the default LogOutput (-> send everything to console)
    );
  }
  // static final AppLogger _instance = AppLogger._internal();

  late Logger logger;

  /// Log locally and to Google Analytics.
  void logInfo(dynamic message) {
    final msg = message.toString();
    logger.i(msg);
  }

  void logDebug(String message) {
    final msg = message;
    logger.d(msg);
  }

  void logError({
    required dynamic message,
    required dynamic error,
    required StackTrace stackTrace,
  }) {
    logger.e(message, error: error, stackTrace: stackTrace);
  }

  /// Warning will not be logged to Google Analytics. It is not
  /// frequently used, but is available for use when needed.
  void logWarning(
    dynamic message,
    dynamic warning,
  ) {
    logger.w(message);
  }
}

class MyPrinter extends LogPrinter {
  @override
  List<String> log(LogEvent event) => [event.message];
}
