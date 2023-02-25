// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const themeBox = 'hiveThemeBox';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox(themeBox);
  configureDependencies();
  runApp(const MyApp());
}
