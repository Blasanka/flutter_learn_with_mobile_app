
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:srp_parent_mobile/src/core/domain/usecases/usecase.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/repositories/notices.repository.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/repositories/inotices.repository.dart';

class GetNoticesUsecase implements UseCase<List<Notice>, Params>{
  final NoticesRepositoryImpl repository;

  GetNoticesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Notice>>> call(Params params) async => await repository.getNotices(params.page);
}

class Params extends Equatable {
  final int page;

  Params({required this.page});

  @override
  List<Object> get props => [page];
}