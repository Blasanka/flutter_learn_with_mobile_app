import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/calendar/data/datasources/remote/notices.datasource.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/repositories/ievents.repository.dart';

class EventsRepositoryImpl extends IEventsRepository {
  final NetworkInfo networkInfo;
  final EventsRemoteDataSourceImpl dataSource;

  EventsRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Event>>> getEvents(int page) async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    }
    try {
      return Right(await dataSource.getEvents(page));
    } on ServerException {
      return Left(ServerFailure());
    }

  }
}