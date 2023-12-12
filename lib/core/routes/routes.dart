import 'package:flutter/material.dart';

import '../../app/presentation/pages/home_page.dart';
import '../../app/presentation/pages/login_page.dart';
import '../../app/presentation/pages/student_page.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String student = '/student';

  static String get initial => login;

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Placeholder(),
    login: (context) => const LoginPage(),
    home: (context) => const HomePage(),
    student: (context) {
      final id = ModalRoute.of(context)?.settings.arguments as String?;
      return StudentPage(id: id);
    },
  };
}
