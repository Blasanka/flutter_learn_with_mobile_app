import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/usecases/get_events.usecase.dart';
import 'package:srp_parent_mobile/src/injection_container.dart';

class CalendarProvider extends BaseProvider {
  GetEventsUsecase _eventsUsecase = sl<GetEventsUsecase>();

  List<Event> _events = [];

  List<Event> get events => _events;

  // set events(List<Event> events) {
  //   _events = events;
  // }

  Future<void> fetchEvents() async {
    setState(ViewState.Busy);

    Either<Failure, List<Event>> results = await _eventsUsecase(Params(page: 1));

    results.fold((failure) {
      setState(ViewState.Error);
    },
          (List<Event> events) {
        _events = events;
        setState(ViewState.Idle);
      },
    );
  }
}