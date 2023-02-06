// ignore_for_file: prefer_const_constructors

import 'package:dotestowania/app.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}
