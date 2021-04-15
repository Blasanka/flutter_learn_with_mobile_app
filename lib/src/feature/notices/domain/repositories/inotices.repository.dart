import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';

abstract class INoticesRepository {
  Future<Either<Failure, List<Notice>>>getNotices(int page);
}