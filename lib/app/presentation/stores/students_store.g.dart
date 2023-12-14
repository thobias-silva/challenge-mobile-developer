// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$StudentsStore on _StudentsStore, Store {
  Computed<ObservableList<Student>>? _$stateComputed;

  @override
  ObservableList<Student> get state =>
      (_$stateComputed ??= Computed<ObservableList<Student>>(() => super.state,
              name: '_StudentsStore.state'))
          .value;

  late final _$filterTextAtom =
      Atom(name: '_StudentsStore.filterText', context: context);

  @override
  String get filterText {
    _$filterTextAtom.reportRead();
    return super.filterText;
  }

  @override
  set filterText(String value) {
    _$filterTextAtom.reportWrite(value, super.filterText, () {
      super.filterText = value;
    });
  }

  late final _$_stateAtom =
      Atom(name: '_StudentsStore._state', context: context);

  @override
  ObservableList<Student> get _state {
    _$_stateAtom.reportRead();
    return super._state;
  }

  @override
  set _state(ObservableList<Student> value) {
    _$_stateAtom.reportWrite(value, super._state, () {
      super._state = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_StudentsStore.isLoading', context: context);

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
      Atom(name: '_StudentsStore.failure', context: context);

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

  late final _$refreshAsyncAction =
      AsyncAction('_StudentsStore.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$getStudentsAsyncAction =
      AsyncAction('_StudentsStore.getStudents', context: context);

  @override
  Future<bool> getStudents() {
    return _$getStudentsAsyncAction.run(() => super.getStudents());
  }

  late final _$deleteStudentAsyncAction =
      AsyncAction('_StudentsStore.deleteStudent', context: context);

  @override
  Future<bool> deleteStudent(String studentId) {
    return _$deleteStudentAsyncAction.run(() => super.deleteStudent(studentId));
  }

  @override
  String toString() {
    return '''
filterText: ${filterText},
isLoading: ${isLoading},
failure: ${failure},
state: ${state}
    ''';
  }
}
