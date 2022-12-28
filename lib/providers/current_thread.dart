import 'package:flutter/material.dart';
import 'package:thread_app/providers/limit_messages.dart';

import 'limit_threads.dart';

class CurrentThread extends ChangeNotifier{
  String _thread = 'uDUcHoM3WS0zYxPiLKOh'; // default is the general.0000 thread
  String _name = 'General.0000';

  String get thread => _thread;
  String get name => _name;

  void switchThread(String id, String threadName,
  {
    required LimitMessages limitMessages,
    required LimitThreads limitThreads
  }) {
    _thread = id;
    _name = threadName;
    limitMessages.resetLimit();
    limitThreads.resetLimit();
    notifyListeners();
  }
}