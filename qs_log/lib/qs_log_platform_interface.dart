import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'qs_log_method_channel.dart';

abstract class QsLogPlatform extends PlatformInterface {
  /// Constructs a QsLogPlatform.
  QsLogPlatform() : super(token: _token);

  static final Object _token = Object();

  static QsLogPlatform _instance = MethodChannelQsLog();

  /// The default instance of [QsLogPlatform] to use.
  ///
  /// Defaults to [MethodChannelQsLog].
  static QsLogPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [QsLogPlatform] when
  /// they register themselves.
  static set instance(QsLogPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
