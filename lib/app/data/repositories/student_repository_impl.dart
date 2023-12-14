import 'package:dartz/dartz.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/errors/failures.dart';
import '../../domain/entities/stundent_entity.dart';
import '../../domain/repositories/student_repository.dart';
import '../adapters/http_client_adapter.dart';

class StudentRepositoryImpl implements StudentRepository {
  final HTTPClientAdapter _httpClient;

  const StudentRepositoryImpl(this._httpClient);

  @override
  Future<Either<Failure, Student>> createStudent(Student student) async {
    try {
      final response = await _httpClient.post<Map<String, dynamic>>(
        '/student',
        student.toMap(),
      );

      if (response == null) {
        return const Left(ServerFailure());
      }

      final newStudent = Student.fromMap(response);

      return Right(newStudent);
    } on ServerException {
      return const Left(ServerFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on BadRequestException {
      return const Left(BadRequestFailure());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Student>>> getStudents() async {
    try {
      final response = await _httpClient.get<List>('/student');

      if (response == null) {
        return const Left(ServerFailure());
      }

      final students = response.map((e) => Student.fromMap(e)).toList();

      return Right(students);
    } on ServerException {
      return const Left(ServerFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on BadRequestException {
      return const Left(BadRequestFailure());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Student>> getStudent(String id) async {
    try {
      final response =
          await _httpClient.get<Map<String, dynamic>>('/student/$id');

      if (response == null) {
        return const Left(ServerFailure());
      }

      final student = Student.fromMap(response);

      return Right(student);
    } on ServerException {
      return const Left(ServerFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on BadRequestException {
      return const Left(BadRequestFailure());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Student>> updateStudent(Student student) async {
    try {
      final response = await _httpClient.put<Map<String, dynamic>>(
        '/student/${student.id}',
        student.toMap(),
      );

      if (response == null) {
        return const Left(ServerFailure());
      }

      final newStudent = Student.fromMap(response);

      return Right(newStudent);
    } on ServerException {
      return const Left(ServerFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on BadRequestException {
      return const Left(BadRequestFailure());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> deleteStudent(String id) async {
    try {
      final response = await _httpClient.delete<Map<String, dynamic>>(
        '/student/$id',
      );

      if (response == null) {
        return const Left(ServerFailure());
      }

      return const Right(true);
    } on ServerException {
      return const Left(ServerFailure());
    } on NotFoundException {
      return const Left(NotFoundFailure());
    } on BadRequestException {
      return const Left(BadRequestFailure());
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
