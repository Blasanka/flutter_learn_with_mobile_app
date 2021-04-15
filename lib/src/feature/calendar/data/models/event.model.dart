import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';

class EventModel extends Event {
  EventModel({
    required int id,
    String? message,
    String? details,
    String? dateTime,
  }) : super(
    id: id,
    message: message,
    details: details,
    dateTime: dateTime,
  );
}
