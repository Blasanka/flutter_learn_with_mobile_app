import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';

abstract class IEventsRepository {
  Future<Either<Failure, List<Event>>> getEvents(int page);
}