import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/routes/routes.dart';
import '../../../injection_container.dart';
import '../../domain/entities/stundent_entity.dart';
import '../stores/students_store.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  final StudentsStore store = StudentsStore(sl());

  @override
  void initState() {
    super.initState();
    store.getStudents();
  }

  void addStudent() async {
    final res = await Navigator.of(context).pushNamed(Routes.student);
    store.refresh();
    if (!mounted) return;
    if (res == true) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Aluno adicionado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void updateStudent(String id) async {
    final res =
        await Navigator.of(context).pushNamed(Routes.student, arguments: {
      'id': id,
    });
    store.refresh();
    if (!mounted) return;
    if (res == true) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Aluno editado com sucesso!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void openStudent(String id) async {
    Navigator.of(context).pushNamed(Routes.student, arguments: {
      'id': id,
      'onlyRead': true,
    });
  }

  void deleteStudent(String id) async {
    // await store.deleteStudent(id);
    // store.refresh();
    // if (!mounted) return;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Deseja excluir este aluno?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              await store.deleteStudent(id);
              store.refresh();
              if (!mounted) return;
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Aluno excluído com sucesso!'),
                ),
              );
            },
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alunos'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => store.filterText = value,
              decoration: const InputDecoration(
                hintText: 'Buscar...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: Observer(builder: (context) {
              if (store.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (store.failure != null) {
                return Center(
                  child:
                      Text(store.failure?.message ?? 'Ops! Algo deu errado.'),
                );
              }

              if (store.state.isEmpty) {
                return const Center(
                  child: Text('Nenhum aluno encontrado.'),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 80),
                itemCount: store.state.length,
                itemBuilder: (context, index) {
                  final student = store.state[index];
                  return _StudentCard(
                    student: student,
                    onEditPressed: () => updateStudent(student.id),
                    onDeletePressed: () => deleteStudent(student.id),
                    onPressed: () => openStudent(student.id),
                  );
                },
              );
            }),
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
  final Student student;
  final void Function()? onEditPressed;
  final void Function()? onDeletePressed;
  final void Function()? onPressed;

  const _StudentCard({
    required this.student,
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
                        student.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(student.academicRecord.toString()),
                      Text('CPF: ${student.cpf}')
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
