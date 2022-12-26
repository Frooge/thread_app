import 'package:flutter/material.dart';

class CurrentThread extends ChangeNotifier{
  String _thread = 'uDUcHoM3WS0zYxPiLKOh'; // default is the general.0000 thread

  String get thread => _thread;

  void switchThread(String threadId) {
    _thread = threadId;
    notifyListeners();
  }
}