import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';

abstract class StudentRepository {
  Future<Either<Failure, List<Student>>> getStudent(int page);
}
