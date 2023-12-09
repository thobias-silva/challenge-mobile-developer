import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  void addStudent() {
    Navigator.of(context).pushNamed(Routes.student);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
              itemCount: 10,
              itemBuilder: (context, index) => _StudentCard(
                onEditPressed: () {},
                onDeletePressed: () {},
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addStudent,
        label: const Text('Adicionar aluno'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class _StudentCard extends StatelessWidget {
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  final void Function()? onPressed;

  const _StudentCard({
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Thobias Silva',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text('15843'),
                      const Text('CPF: 123.456.789-00')
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: onEditPressed,
                      icon: const Icon(
                        Icons.edit_outlined,
                      ),
                    ),
                    IconButton(
                      onPressed: onDeletePressed,
                      icon: const Icon(
                        Icons.delete_outlined,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
