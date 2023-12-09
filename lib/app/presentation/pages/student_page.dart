import 'package:flutter/material.dart';

class StudentPage extends StatefulWidget {
  final String? id;

  const StudentPage({
    super.key,
    required this.id,
  });

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late final bool isNew = widget.id == null;

  void addOrEditStudent() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isNew ? 'Adicionar aluno' : 'Editar aluno'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const _StudentForm(),
                      const Spacer(),
                      const SizedBox(height: 16),
                      FilledButton(
                        onPressed: addOrEditStudent,
                        child: Text(isNew ? 'Adicionar' : 'Salvar edições'),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _StudentForm extends StatelessWidget {
  const _StudentForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dados gerais',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Nome do Aluno*',
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Data de Nascimento',
            suffixIcon: IconButton(
              onPressed: () {
                showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
              },
              icon: const Icon(Icons.calendar_today_rounded),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'CPF*',
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Registro acadêmico*',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Dados de acesso',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'E-mail*',
          ),
        ),
      ],
    );
  }
}
