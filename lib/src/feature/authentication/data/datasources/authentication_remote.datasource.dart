import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:srp_parent_mobile/src/core/data/models/user.model.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';

abstract class AuthenticationRemoteDataSource {
  /// Queries GQL student by page
  ///
  /// Throws a [ServerException] for all error codes
  Future<User> login();
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final http.Client httpClient;

  AuthenticationRemoteDataSourceImpl(this.httpClient);

  @override
  Future<User> login() async {
    UserModel? user;
    const String url = '';

    // final QueryOptions options = QueryOptions(
    //   documentNode: gql(readStudent),
    //   variables: {
    //     'nPage': 0,
    //   },
    // );
    //
    final http.Response result = await httpClient.get(url);

    if (result.statusCode >= 500) {
      print(result.body);
      throw ServerException();
    }

    var body = json.decode(result.body);
    for (var jsonMap in (body['student']['results'] as List<dynamic>)) {
       user = UserModel.fromJson(jsonMap);
    }
    return user!;
  }
}
