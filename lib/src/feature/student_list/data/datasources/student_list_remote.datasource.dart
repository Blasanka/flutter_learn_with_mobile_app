import 'dart:convert';

import 'package:srp_parent_mobile/src/feature/student_list/data/models/student.model.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:http/http.dart' as http;

abstract class StudentListRemoteDataSource {
  /// Queries GQL student by page
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<Student>> getStudent(int page);
}

class StudentListRemoteDataSourceImpl implements StudentListRemoteDataSource {
  final http.Client httpClient;

  StudentListRemoteDataSourceImpl(this.httpClient);

  @override
  Future<List<Student>> getStudent(int page) async {
    List<Student> student = [];
    final String url = 'https://jsonplaceholder.typicode.com/users';

    final Map<String, String> headers = {};

    final http.Response result = await http.get(Uri.parse(url), headers: headers);

    if (result.statusCode >= 500) {
      print(result.body.toString());
      throw ServerException();
    }

   var body = json.decode(result.body);
   for (var jsonMap in (body as List<dynamic>)) {
     student.add(StudentModel.fromJson(jsonMap));
   }
    return student;
  }
}
