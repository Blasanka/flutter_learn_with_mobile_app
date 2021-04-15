import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/models/notice.model.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/usecases/get_notices.usecase.dart';
import 'package:srp_parent_mobile/src/injection_container.dart';

class NoticesProvider extends BaseProvider {
  GetNoticesUsecase _noticesUsecase = sl<GetNoticesUsecase>();

  List<Notice> _notices = [];

  List<Notice> get notices => _notices;

  // set notices(List<Notice> notices) {
  //   _notices = notices;
  // }

  Future<void> fetchNotices() async {
    setState(ViewState.Busy);

    Either<Failure, List<Notice>> results = await _noticesUsecase(Params(page: 1));

    results.fold((failure) {
        setState(ViewState.Error);
      },
      (List<Notice> notices) {
        _notices = notices;
        setState(ViewState.Idle);
      },
    );
  }
}