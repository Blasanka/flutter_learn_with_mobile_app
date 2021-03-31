import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/student.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/student_list/data/datasources/student_list_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/repositories/student_list.repository.dart';

class StudentListRepositoryImpl implements StudentRepository {
  final NetworkInfo networkInfo;
  final StudentListRemoteDataSource dataSource;

  StudentListRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Student>>> getStudent(int page) async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    }
    try {
      return Right(await dataSource.getStudent(page));
    } on ServerException {
      return Left(ServerFailure());
    }
    
  }
}
