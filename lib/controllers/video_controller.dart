import 'package:flutter/material.dart';

class VideoController extends ChangeNotifier {
  String _currentSpeed = "1.0";

  String get currentSpeed => _currentSpeed;

  void setVideoSpeed(String selectedSpeed) {
    _currentSpeed = selectedSpeed;
    notifyListeners();
  }
}
