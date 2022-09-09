import 'package:flutter/material.dart';

class ShortVideoController extends ChangeNotifier {
  bool _isLiked = false;
  bool _isTimeBarVisible = false;

  bool get isLiked => _isLiked;
  bool get isTimeBarVisible => _isTimeBarVisible;

  void setLike() {
    _isLiked = !_isLiked;
    notifyListeners();
  }

  void setTimeBarVisible(bool visible) {
    _isTimeBarVisible = visible;
    notifyListeners();
  }
}
