import 'package:flutter/material.dart';

import 'core/routes/routes.dart';
import 'core/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Platform',
      theme: lightTheme(),
      initialRoute: Routes.initial,
      routes: Routes.routes,
    );
  }
}
