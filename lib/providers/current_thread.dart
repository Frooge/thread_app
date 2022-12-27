import 'package:flutter/material.dart';

class CurrentThread extends ChangeNotifier{
  String _thread = 'uDUcHoM3WS0zYxPiLKOh'; // default is the general.0000 thread
  String _name = 'General.0000';

  String get thread => _thread;
  String get name => _name;

  void switchThread(String id, String threadName) {
    _thread = id;
    _name = threadName;
    notifyListeners();
  }
}