import 'package:flutter/material.dart';

class FeedbakcController extends ChangeNotifier {
  bool _isLiked = false;
  bool _isDisLiked = false;
  bool _isSaved = false;

  bool get isLiked => _isLiked;
  bool get isDisLiked => _isDisLiked;
  bool get isSaved => _isSaved;

  void setLike() {
    if (_isDisLiked) {
      _isLiked = !_isLiked;
      _isDisLiked = false;
    } else {
      _isLiked = !_isLiked;
    }
    notifyListeners();
  }

  void setDisLike() {
    if (_isLiked) {
      _isDisLiked = !_isDisLiked;
      _isLiked = false;
    } else {
      _isDisLiked = !_isDisLiked;
    }
    notifyListeners();
  }

  void setSaved() {
    _isSaved = !_isSaved;
    notifyListeners();
  }
}
