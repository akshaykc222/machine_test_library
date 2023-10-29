import 'package:flutter/material.dart';
import 'package:machine_test_library/app.dart';
import 'package:machine_test_library/injector.dart';

Future<void> main() async {
  await setup();
  runApp(const LibraryManagement());
}
