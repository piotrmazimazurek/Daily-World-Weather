import 'package:dotestowania/app.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('switchbox');

  configureDependencies();
  runApp(const MyApp());
}
