import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/thread_screen.dart';

class Routes {
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String settings = '/settings';
  static const String thread = '/threads';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.login: (context) => const LoginScreen(),
      Routes.register: (context) => const RegisterScreen(),
      Routes.home: (context) => const HomeScreen(),
      Routes.settings: (context) => const SettingsScreen(),
      Routes.thread: (context) => const ThreadScreen(),
    };
  }
}