import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login();
}
