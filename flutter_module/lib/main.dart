import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final methodChannel = MethodChannel('dart_multi_platform');

var count = 0;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  print('hello from dart!');

  methodChannel.setMethodCallHandler((call) async {
    switch (call.method) {
      case 'count':
        methodChannel.invokeMethod('countResult', ++count);
        break;
      default:
    }
  });
}
