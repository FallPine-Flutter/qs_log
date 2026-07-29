import 'package:logger/logger.dart';

import 'qs_log_platform_interface.dart';

class QsLog {
  Future<String?> getPlatformVersion() {
    return QsLogPlatform.instance.getPlatformVersion();
  }

  /// Function
  static void debug(dynamic message) {
    _logger.d(message);
  }

  static void info(dynamic message) {
    _logger.i(message);
  }

  static void warning(dynamic message) {
    _logger.w(message);
  }

  static void error(dynamic message) {
    _logger.e(message);
  }

  /// Property
  static final _logger = Logger(
    filter: ProductionFilter(),
    printer: PrettyPrinter(),
  );
}
