import 'dart:convert';

import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/models/notice.model.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/entities/notice.entity.dart';
import 'package:http/http.dart' as http;

abstract class INoticesRemoteDataSource {
  /// Queries GQL student by page
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<Notice>> getNotices(int page);
}

class NoticesRemoteDataSourceImpl implements INoticesRemoteDataSource {
  final http.Client httpClient;

  NoticesRemoteDataSourceImpl(this.httpClient);

  final List<Notice> notices = [
    NoticeModel(id: 1, title: "Notice One", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", imageUrl: "https://source.unsplash.com/random"),
    NoticeModel(id: 2, title: "Notice Two", description: "Notice description", imageUrl: "https://source.unsplash.com/random"),
    NoticeModel(id: 3, title: "Notice Three", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", imageUrl: "https://source.unsplash.com/random"),
    NoticeModel(id: 4, title: "Notice Four", description: "Notice description", imageUrl: "https://source.unsplash.com/random"),
  ];

  @override
  Future<List<Notice>> getNotices(int page) async {
    List<Notice> notices = [];
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
    return this.notices;
  }
}