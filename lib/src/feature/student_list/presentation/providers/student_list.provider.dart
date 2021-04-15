import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/usecases/get_student_list.usecase.dart';
import 'package:srp_parent_mobile/src/injection_container.dart';

class StudentProvider extends BaseProvider {
  GetStudentListUsecase _studentUsecase = sl<GetStudentListUsecase>();
  Random _random = Random();
  List<Student> _student = [];

  List<Student> get students => _student;

  Future<void> fetchStudent() async {
    setState(ViewState.Busy);
    
    int randomNumber = _random.nextInt(30) + 1;
    
    Either<Failure, List<Student>> results = await _studentUsecase(Params(page: randomNumber));

    results.fold(
      (failure) {
        setState(ViewState.Error);
      },
      (List<Student> student) {
        _student = student;
        setState(ViewState.Idle);
      },
    );
  }
}
