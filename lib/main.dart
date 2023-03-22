import 'package:dotestowania/app.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/domain/models/switch_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(
    ChangeNotifierProvider.value(
      value: SwitchModel(),
      child: const MyApp(),
    ),
  );
}
