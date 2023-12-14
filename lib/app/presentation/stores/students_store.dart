import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/errors/failures.dart';
import '../../domain/entities/stundent_entity.dart';
import '../../domain/repositories/student_repository.dart';

part 'students_store.g.dart';

class StudentsStore = _StudentsStore with _$StudentsStore;

abstract class _StudentsStore with Store {
  final StudentRepository _repository;

  _StudentsStore(this._repository);

  @observable
  String filterText = '';

  @observable
  ObservableList<Student> _state = ObservableList.of([]);

  @computed
  ObservableList<Student> get state {
    if (filterText.isEmpty) return _state;

    return ObservableList.of(_state.where(_filter));
  }

  bool _filter(Student student) {
    return student.name.toLowerCase().contains(filterText);
  }

  @observable
  bool isLoading = false;

  @observable
  Failure? failure;

  @action
  Future<void> refresh() async {
    failure = null;
    final resultOrError = await _repository.getStudents();

    if (resultOrError.isLeft()) return;

    _state = ObservableList.of(resultOrError.fold(id, id) as List<Student>);
  }

  @action
  Future<bool> getStudents() async {
    failure = null;
    isLoading = true;

    final resultOrError = await _repository.getStudents();

    isLoading = false;

    if (resultOrError.isLeft()) {
      failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    _state = ObservableList.of(resultOrError.fold(id, id) as List<Student>);
    return true;
  }

  @action
  Future<bool> deleteStudent(String studentId) async {
    failure = null;
    final resultOrError = await _repository.deleteStudent(studentId);

    isLoading = false;

    if (resultOrError.isLeft()) {
      failure = resultOrError.fold(id, id) as Failure;
      return false;
    }

    return true;
  }
}
