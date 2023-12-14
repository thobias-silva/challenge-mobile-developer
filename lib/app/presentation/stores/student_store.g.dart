// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentStore on _StudentStoreBase, Store {
  late final _$studentAtom =
      Atom(name: '_StudentStoreBase.student', context: context);

  @override
  Student get student {
    _$studentAtom.reportRead();
    return super.student;
  }

  @override
  set student(Student value) {
    _$studentAtom.reportWrite(value, super.student, () {
      super.student = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_StudentStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$failureAtom =
      Atom(name: '_StudentStoreBase.failure', context: context);

  @override
  Failure? get failure {
    _$failureAtom.reportRead();
    return super.failure;
  }

  @override
  set failure(Failure? value) {
    _$failureAtom.reportWrite(value, super.failure, () {
      super.failure = value;
    });
  }

  late final _$createStudentAsyncAction =
      AsyncAction('_StudentStoreBase.createStudent', context: context);

  @override
  Future<bool> createStudent() {
    return _$createStudentAsyncAction.run(() => super.createStudent());
  }

  late final _$updateStudentAsyncAction =
      AsyncAction('_StudentStoreBase.updateStudent', context: context);

  @override
  Future<bool> updateStudent() {
    return _$updateStudentAsyncAction.run(() => super.updateStudent());
  }

  late final _$getStudentAsyncAction =
      AsyncAction('_StudentStoreBase.getStudent', context: context);

  @override
  Future<bool> getStudent(String studentId) {
    return _$getStudentAsyncAction.run(() => super.getStudent(studentId));
  }

  late final _$_StudentStoreBaseActionController =
      ActionController(name: '_StudentStoreBase', context: context);

  @override
  void _setStudent(
      {String? name,
      DateTime? birthDate,
      int? cpf,
      String? email,
      int? academicRecord}) {
    final _$actionInfo = _$_StudentStoreBaseActionController.startAction(
        name: '_StudentStoreBase._setStudent');
    try {
      return super._setStudent(
          name: name,
          birthDate: birthDate,
          cpf: cpf,
          email: email,
          academicRecord: academicRecord);
    } finally {
      _$_StudentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
student: ${student},
isLoading: ${isLoading},
failure: ${failure}
    ''';
  }
}
