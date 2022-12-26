import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../services/thread_services.dart';

class CurrentThread extends ChangeNotifier{
  String _thread = 'uDUcHoM3WS0zYxPiLKOh'; // default is the general.0000 thread
  String _name = 'General.0000';

  String get thread => _thread;
  String get name => _name;

  void switchThread(String threadId) async {
    _thread = threadId;
    _name = await ThreadServices().getThreadName(_thread);
    notifyListeners();
  }
}