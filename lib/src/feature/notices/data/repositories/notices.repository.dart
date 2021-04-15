import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/datasources/remote/notices.datasource.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/repositories/inotices.repository.dart';

class NoticesRepositoryImpl implements INoticesRepository {
  final NetworkInfo networkInfo;
  final NoticesRemoteDataSourceImpl dataSource;

  NoticesRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Notice>>> getNotices(int page) async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    }
    try {
      return Right(await dataSource.getNotices(page));
    } on ServerException {
      return Left(ServerFailure());
    }

  }
}