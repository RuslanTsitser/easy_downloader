// Created by linkkader on 16/2/2023

import 'package:logger/logger.dart';

///all logs will be filtered by this class
///[shouldLog] return true if you want to print log
///force all logs to be printed
class Log {
  final log = Logger();
  final _tag = 'EasyDownloader';
  var _infoCount = 0;

  static final Log _instance = Log._internal();
  Log._internal();
  factory Log() => _instance;

  ///debug log
  void d(message, [error, StackTrace? stackTrace]) {
    log.d(message, error: error, stackTrace: stackTrace);
  }

  ///error log
  void e(message, [error, StackTrace? stackTrace]) {
    log.e(message, error: error, stackTrace: stackTrace);
  }

  ///info log
  void i(message, [error, StackTrace? stackTrace]) {
    log.i(message, error: error, stackTrace: stackTrace);
  }

  ///info log with count
  void info(message, [error, StackTrace? stackTrace]) {
    _infoCount++;
    log.i("$_tag: $_infoCount $message", error: error, stackTrace: stackTrace);
  }

  ///verbose log
  void v(message, [error, StackTrace? stackTrace]) {
    log.t(message, error: error, stackTrace: stackTrace);
  }

  ///warning log
  void w(message, [error, StackTrace? stackTrace]) {
    log.w(message, error: error, stackTrace: stackTrace);
  }

  ///wtf log
  void wtf(message, [error, StackTrace? stackTrace]) {
    log.f(message, error: error, stackTrace: stackTrace);
  }
}
