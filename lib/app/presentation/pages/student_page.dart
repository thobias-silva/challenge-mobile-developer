import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/utils/extensions.dart';
import '../../../injection_container.dart';
import '../stores/student_store.dart';
import '../widgets/primary_button_widget.dart';

class StudentPage extends StatefulWidget {
  final String? id;
  final bool onlyRead;

  const StudentPage({
    super.key,
    required this.id,
    required this.onlyRead,
  });

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  late final StudentStore store = StudentStore(sl());
  late final bool isNew = widget.id == null;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isNew) store.getStudent(widget.id!);
    });
  }

  String get appBarTitle {
    return widget.onlyRead
        ? store.student.name
        : isNew
            ? 'Adicionar aluno'
            : 'Editar aluno';
  }

  void action(BuildContext context) async {
    final form = Form.of(context);

    if (!form.validate()) return;

    final navigator = Navigator.of(context);

    final result =
        isNew ? await store.createStudent() : await store.updateStudent();

    if (result) {
      navigator.pop(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          return Text(appBarTitle);
        }),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Observer(builder: (context) {
                      if (store.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (!isNew && store.failure != null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              store.failure!.message ?? 'Erro ao buscar aluno',
                            ),
                            const SizedBox(height: 16),
                            PrimaryButton(
                              onPressed: () {
                                store.getStudent(widget.id!);
                              },
                              title: 'Tentar novamente',
                            ),
                          ],
                        );
                      }

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _StudentForm(store, widget.onlyRead),
                          const Spacer(),
                          const SizedBox(height: 16),
                          if (!widget.onlyRead)
                            Observer(
                              builder: (context) {
                                return PrimaryButton(
                                  onPressed: () => action(context),
                                  title: isNew ? 'Adicionar' : 'Salvar edições',
                                  isLoading: store.isLoading,
                                );
                              },
                            ),
                          const Spacer()
                        ],
                      );
                    }),
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
  final StudentStore store;
  final bool readOnly;
  _StudentForm(this.store, this.readOnly);

  String? validator(String? value) {
    if (value == null) return null;
    if (value.isEmpty) return 'Obrigatório';
    return null;
  }

  late final _nameController = TextEditingController(text: store.student.name);
  late final _emailController =
      TextEditingController(text: store.student.email);
  late final _cpfController = TextEditingController(
      text: store.student.cpf.isNegative ? null : store.student.cpf.toString());
  late final _academicRecordController = TextEditingController(
      text: store.student.academicRecord.isNegative
          ? null
          : store.student.academicRecord.toString());
  late final _birthDateController =
      TextEditingController(text: store.student.birthDate?.format());

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dados gerais',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          TextFormField(
            readOnly: readOnly,
            controller: _nameController,
            onChanged: store.setName,
            decoration: const InputDecoration(
              labelText: 'Nome do Aluno*',
            ),
            validator: validator,
          ),
          const SizedBox(height: 16),
          TextFormField(
            readOnly: true,
            controller: _birthDateController,
            onTap: readOnly
                ? null
                : () async {
                    final newDate = await showDatePicker(
                      context: context,
                      initialDate: store.student.birthDate ?? DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (newDate == null) return;
                    store.setBirthDate(newDate);
                    _birthDateController.text = newDate.format();
                  },
            decoration: const InputDecoration(
              labelText: 'Data de Nascimento',
              suffixIcon: Icon(Icons.calendar_today_rounded),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            readOnly: readOnly,
            controller: _cpfController,
            onChanged: (value) => store.setCpf(int.tryParse(value) ?? 0),
            decoration: const InputDecoration(
              labelText: 'CPF*',
            ),
            validator: validator,
          ),
          const SizedBox(height: 16),
          TextFormField(
            readOnly: readOnly,
            controller: _academicRecordController,
            onChanged: (value) =>
                store.setAcademicRecord(int.tryParse(value) ?? 0),
            decoration: const InputDecoration(
              labelText: 'Registro acadêmico*',
            ),
            validator: validator,
          ),
          const SizedBox(height: 16),
          Text(
            'Dados de acesso',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 16),
          TextFormField(
            readOnly: readOnly,
            controller: _emailController,
            onChanged: store.setEmail,
            decoration: const InputDecoration(
              labelText: 'E-mail*',
            ),
            validator: validator,
          ),
        ],
      );
    });
  }
}
