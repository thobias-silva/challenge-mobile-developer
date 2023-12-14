import 'package:flutter/material.dart';

import '../../app/presentation/pages/home_page.dart';
import '../../app/presentation/pages/login_page.dart';
import '../../app/presentation/pages/splash_page.dart';
import '../../app/presentation/pages/student_page.dart';

abstract class Routes {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String student = '/student';

  static String get initial => splash;

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    home: (context) => const HomePage(),
    student: (context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      final String? id = args?['id'];
      final bool? onlyRead = args?['onlyRead'];
      return StudentPage(
        id: id,
        onlyRead: onlyRead ?? false,
      );
    },
  };
}
