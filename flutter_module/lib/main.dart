import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final methodChannel = MethodChannel('dart_multi_platform');

var count = 0;

void main() {
  runApp(MaterialApp());
  methodChannel.setMethodCallHandler((call) async {
    print(call.method);
    switch (call.method) {
      case 'count':
        methodChannel.invokeMethod('countResult', ++count);
        break;
      default:
    }
  });
}
