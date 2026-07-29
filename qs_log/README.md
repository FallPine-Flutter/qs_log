# qs_log

`qs_log` 是一个用于 Flutter 项目的控制台日志打印插件，基于 `logger` 封装了常用日志级别，方便在业务代码中统一输出调试信息。

## 功能

- 支持 `debug`、`info`、`warning`、`error` 四种日志级别。
- 使用静态方法调用，不需要手动创建实例。
- 默认使用 `PrettyPrinter` 格式化输出日志。
- 支持 Android 和 iOS。

## 安装

在项目的 `pubspec.yaml` 中添加依赖：

```yaml
dependencies:
  qs_log: ^1.0.0
```

如果使用本地路径依赖：

```yaml
dependencies:
  qs_log:
    path: ../qs_log
```

然后执行：

```bash
flutter pub get
```

## 引入

```dart
import 'package:qs_log/qs_log.dart';
```

## 基础用法

```dart
QsLog.debug('这是一条 debug 日志');
QsLog.info('这是一条 info 日志');
QsLog.warning('这是一条 warning 日志');
QsLog.error('这是一条 error 日志');
```

也可以直接打印对象、Map、List 等数据：

```dart
QsLog.debug({
  'page': 'home',
  'action': 'load',
  'success': true,
});

QsLog.info(['Flutter', 'qs_log', 'logger']);
```

## 日志级别说明

| 方法 | 适用场景 |
| --- | --- |
| `QsLog.debug(message)` | 调试阶段使用，输出临时排查信息。 |
| `QsLog.info(message)` | 输出普通运行信息，例如流程状态、关键步骤。 |
| `QsLog.warning(message)` | 输出警告信息，例如非致命异常、兜底逻辑。 |
| `QsLog.error(message)` | 输出错误信息，例如接口失败、异常捕获。 |

## 示例

```dart
import 'package:flutter/material.dart';
import 'package:qs_log/qs_log.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    QsLog.info('HomePage build');

    return Scaffold(
      appBar: AppBar(title: const Text('qs_log example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            QsLog.debug('点击了按钮');
          },
          child: const Text('打印日志'),
        ),
      ),
    );
  }
}
```

## 平台版本

插件中保留了 Flutter 插件模板默认的 `getPlatformVersion()` 方法，可用于获取当前平台版本：

```dart
final qsLog = QsLog();
final version = await qsLog.getPlatformVersion();
QsLog.info('platform version: $version');
```

## 注意事项

- 当前日志打印使用 `ProductionFilter`，在不同构建模式下的实际输出行为遵循 `logger` 包的过滤规则。
- 建议在业务代码中统一使用 `QsLog` 输出日志，避免项目内混用多个日志入口。
