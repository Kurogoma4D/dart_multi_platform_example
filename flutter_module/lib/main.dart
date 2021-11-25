import 'package:flutter/material.dart';

void main() {
  Stream.periodic(const Duration(seconds: 1), (count) {
    debugPrint('From Dart: count $count');
  });
}
