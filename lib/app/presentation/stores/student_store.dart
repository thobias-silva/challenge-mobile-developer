import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/stundent_entity.dart';
import '../../domain/repositories/student_repository.dart';

part 'student_store.g.dart';

class StudentStore = _StudentStoreBase with _$StudentStore;

abstract class _StudentStoreBase with Store {
  final StudentRepository _repository;

  _StudentStoreBase(this._repository);

  @observable
  Student student = Student.empty();

  @observable
  bool isLoading = false;

  @observable
  Failure? failure;

  @action
  void _setStudent({
    String? name,
    DateTime? birthDate,
    int? cpf,
    String? email,
    int? academicRecord,
  }) {
    student = student.copyWith(
      name: name,
      birthDate: birthDate,
      cpf: cpf,
      email: email,
      academicRecord: academicRecord,
    );
  }

  void setName(String value) => _setStudent(name: value);
  void setBirthDate(DateTime value) => _setStudent(birthDate: value);
  void setCpf(int value) => _setStudent(cpf: value);
  void setEmail(String value) => _setStudent(email: value);
  void setAcademicRecord(int value) => _setStudent(academicRecord: value);

  @action
  Future<bool> createStudent() async {
    isLoading = true;
    failure = null;

    final resultOrError = await _repository.createStudent(student);

    isLoading = false;

    if (resultOrError.isLeft()) {
      failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    student = resultOrError.fold(id, id) as Student;
    return true;
  }

  @action
  Future<bool> updateStudent() async {
    isLoading = true;
    failure = null;

    final resultOrError = await _repository.updateStudent(student);

    isLoading = false;

    if (resultOrError.isLeft()) {
      failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    student = resultOrError.fold(id, id) as Student;
    return true;
  }

  @action
  Future<bool> getStudent(String studentId) async {
    isLoading = true;
    failure = null;

    final resultOrError = await _repository.getStudent(studentId);

    isLoading = false;

    if (resultOrError.isLeft()) {
      failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    student = resultOrError.fold(id, id) as Student;
    return true;
  }
}
