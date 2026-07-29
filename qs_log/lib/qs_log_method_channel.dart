import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'qs_log_platform_interface.dart';

/// An implementation of [QsLogPlatform] that uses method channels.
class MethodChannelQsLog extends QsLogPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('qs_log');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>(
      'getPlatformVersion',
    );
    return version;
  }
}
