import 'package:flutter/material.dart';

class SwitchModel extends ChangeNotifier {
  bool _isSwitchOn = true;

  bool get isSwitchOn => _isSwitchOn;
  set isSwitchOn(bool value) {
    _isSwitchOn = value;
    notifyListeners();
  }
}
