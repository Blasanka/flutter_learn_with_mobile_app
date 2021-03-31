import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:dartz/dartz.dart' show Either, Left, Right;
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/datasources/authentication_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/authentication.repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final NetworkInfo networkInfo;
  final AuthenticationRemoteDataSource dataSource;

  AuthenticationRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, User>> login() async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    }
    try {
      return Right(await dataSource.login());
    } on ServerException {
      return Left(ServerFailure());
    }
    
  }
}
