import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/usecases/usecase.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/authentication.repository.dart';

class LoginUsecase implements UseCase<User, Params>{
  final AuthenticationRepository repository;

  LoginUsecase(this.repository);

  @override
  Future<Either<Failure, User>> call(Params params) async {
    return await repository.login();
  }
}

class Params extends Equatable {
  final String username;
  final String password;

  Params({required this.username, required this.password});

  @override
  List<Object> get props => [username, password];
}