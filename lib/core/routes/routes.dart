import 'package:flutter/material.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';

  static String get initial => splash;

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Placeholder(),
    login: (context) => const Placeholder(),
    home: (context) => const Placeholder(),
  };
}
