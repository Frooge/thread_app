import 'package:flutter/material.dart';


class LimitMessages extends ChangeNotifier {
  static const int _limit = 5;
  int _currentLimit = _limit;

  int get currentLimit => _currentLimit;

  void incrementLimit() {
    _currentLimit += _limit;
    notifyListeners();
  }

  void resetLimit() {
    _currentLimit = _limit;
    notifyListeners();
  }
}