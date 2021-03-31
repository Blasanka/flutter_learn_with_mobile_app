import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/usecases/usecase.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/repositories/student_list.repository.dart';

class GetStudentListUsecase implements UseCase<List<Student>, Params>{
  final StudentRepository repository;

  GetStudentListUsecase(this.repository);

  @override
  Future<Either<Failure, List<Student>>> call(Params params) async {
    return await repository.getStudent(params.page);
  }
}

class Params extends Equatable {
  final int page;

  Params({required this.page});

  @override
  List<Object> get props => [page];
}