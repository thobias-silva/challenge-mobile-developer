import 'package:dartz/dartz.dart';

import '../../../core/errors/failures.dart';
import '../entities/stundent_entity.dart';

abstract interface class StudentRepository {
  Future<Either<Failure, List<Student>>> getStudents();
  Future<Either<Failure, Student>> getStudent(String id);
  Future<Either<Failure, Student>> createStudent(Student student);
  Future<Either<Failure, Student>> updateStudent(Student student);
  Future<Either<Failure, bool>> deleteStudent(String id);
}
