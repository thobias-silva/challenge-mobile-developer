import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import 'students_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

  int get page => pageController.page?.round() ?? 0;

  void onHomePressed() {
    Navigator.of(context).pop();
    pageController.jumpToPage(0);
  }

  void onAddStudentPressed() {
    pageController.jumpToPage(0);
    Navigator.of(context)
      ..pop()
      ..pushNamed(Routes.student);
  }

  void onDestinationSelected(BuildContext context, int index) {
    index == 0
        ? Scaffold.of(context).openDrawer()
        : pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: onHomePressed,
            ),
            ListTile(
              leading: const Icon(Icons.person_add_outlined),
              title: const Text('Adicionar alunos'),
              onTap: onAddStudentPressed,
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: const [
          StudentsPage(),
          Center(child: Text('Ajuda')),
          Center(child: Text('Notificações')),
          Center(child: Text('Perfil')),
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          return NavigationBar(
            selectedIndex: page,
            onDestinationSelected: (index) =>
                onDestinationSelected(context, index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.menu_outlined),
                label: 'Menu',
              ),
              NavigationDestination(
                icon: Icon(Icons.help_outline_outlined),
                label: 'Ajuda',
              ),
              NavigationDestination(
                icon: Icon(Icons.notifications_none_outlined),
                label: 'Notificações',
              ),
              NavigationDestination(
                icon: Icon(Icons.account_circle_outlined),
                label: 'Perfil',
              ),
            ],
          );
        },
      ),
    );
  }
}
