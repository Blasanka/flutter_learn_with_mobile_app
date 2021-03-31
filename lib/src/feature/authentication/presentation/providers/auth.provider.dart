import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/usecases/login.usecase.dart';
import 'package:srp_parent_mobile/src/injection_container.dart';

class AuthProvider extends BaseProvider {
  LoginUsecase _loginUsecase = sl<LoginUsecase>();
  User? _user;

  User? get user => _user;

  Future<void> login() async {
    setState(ViewState.Busy);

    Either<Failure, User> results = await _loginUsecase(Params(username: "username", password: "password"));

    results.fold(
      (failure) {
        setState(ViewState.Error);
      },
      (User loggedUser) {
        _user = loggedUser;
        setState(ViewState.Idle);
      },
    );
  }

  isLoggedIn() {
    setState(ViewState.Idle);
  }
}
