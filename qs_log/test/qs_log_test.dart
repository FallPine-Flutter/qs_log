import 'package:flutter_test/flutter_test.dart';
import 'package:qs_log/qs_log.dart';
import 'package:qs_log/qs_log_platform_interface.dart';
import 'package:qs_log/qs_log_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockQsLogPlatform
    with MockPlatformInterfaceMixin
    implements QsLogPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final QsLogPlatform initialPlatform = QsLogPlatform.instance;

  test('$MethodChannelQsLog is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelQsLog>());
  });

  test('getPlatformVersion', () async {
    QsLog qsLogPlugin = QsLog();
    MockQsLogPlatform fakePlatform = MockQsLogPlatform();
    QsLogPlatform.instance = fakePlatform;

    expect(await qsLogPlugin.getPlatformVersion(), '42');
  });
}
