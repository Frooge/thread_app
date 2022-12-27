import 'package:flutter/material.dart';

class FilterThread extends ChangeNotifier{
  bool _filterFav = false;

  bool get filterFav => _filterFav;

  void changeFilterFav(bool value) {
    _filterFav = value;
    notifyListeners();
  }
}