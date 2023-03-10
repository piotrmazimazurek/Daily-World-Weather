import 'package:device_preview/device_preview.dart';
import 'package:dotestowania/app.dart';
import 'package:dotestowania/app/core/injection_container.dart';
import 'package:dotestowania/app/domain/models/switch_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ChangeNotifierProvider(
        create: (context) => SwitchModel(),
        child: const MyApp(),
      ),
    ),
  );
}
