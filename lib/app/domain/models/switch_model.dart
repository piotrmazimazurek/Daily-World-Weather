import 'package:flutter/material.dart';

class SwitchModel extends ChangeNotifier {
  bool _isSwitchOn = true;
  Color _textColor = Colors.white;
  Color _appBarColor = Colors.black87;
  Color _scaffoldBgcolor = Colors.transparent;

  bool get isSwitchOn => _isSwitchOn;
  set isSwitchOn(bool value) {
    _isSwitchOn = value;
    _updateColors();
    notifyListeners();
  }

  Color get textColor => _textColor;
  Color get appBarColor => _appBarColor;
  Color get scaffoldBgcolor => _scaffoldBgcolor;

  void _updateColors() {
    if (_isSwitchOn) {
      _textColor = Colors.white;
      _appBarColor = Colors.black87;
      _scaffoldBgcolor = Colors.transparent;
    } else {
      _textColor = Colors.black87;
      _appBarColor = const Color.fromARGB(197, 255, 255, 255);
      _scaffoldBgcolor = const Color.fromARGB(169, 255, 255, 255);
    }
  }
}
