import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:srp_parent_mobile/src/core/domain/usecases/usecase.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/feature/calendar/data/repositories/events.repository.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';

class GetEventsUsecase implements UseCase<List<Event>, Params>{
  final EventsRepositoryImpl repository;

  GetEventsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Event>>> call(Params params) async => await repository.getEvents(params.page);
}

class Params extends Equatable {
  final int page;

  Params({required this.page});

  @override
  List<Object> get props => [page];
}