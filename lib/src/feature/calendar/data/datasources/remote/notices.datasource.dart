import 'dart:convert';

import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/feature/calendar/data/models/event.model.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/entities/event.entity.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/models/notice.model.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';
import 'package:http/http.dart' as http;

abstract class IEventsRemoteDataSource {
  /// Queries GQL student by page
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<Event>> getEvents(int page);
}

class EventsRemoteDataSourceImpl implements IEventsRemoteDataSource {
  final http.Client httpClient;

  EventsRemoteDataSourceImpl(this.httpClient);

  final List<Event> events = [
    EventModel(id: 1, message: "Event One", details: "Event details", dateTime: DateTime.now().toString()),
    EventModel(id: 2, message: "Event Two", details: "Event details", dateTime: DateTime.now().subtract(Duration(days: 130)).toString()),
    EventModel(id: 3, message: "Event Three", details: "Event details", dateTime: DateTime.now().subtract(Duration(days: 200)).toString()),
    EventModel(id: 4, message: "Event Four", details: "Event details", dateTime: DateTime.now().subtract(Duration(days: 1)).toString()),
  ];

  @override
  Future<List<Event>> getEvents(int page) async {
    List<Notice> events = [];
    const String url = 'https://jsonplaceholder.typicode.com/users';

    final Map<String, String> headers = {};

    final http.Response result = await http.get(Uri.parse(url), headers: headers);

    if (result.statusCode >= 500) {
      print(result.body.toString());
      throw ServerException();
    }

    // var body = json.decode(result.body);
    // for (var jsonMap in (body as List<dynamic>)) {
    //   notices.add(NoticeModel.fromJson(jsonMap));
    // }
    return this.events;
  }
}