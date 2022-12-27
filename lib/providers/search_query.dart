import 'package:flutter/material.dart';

class SearchQuery extends ChangeNotifier{
  String _query = '';

  String get query => _query;

  void changeQuery(String query) {
    _query = query;
    notifyListeners();
  }
}