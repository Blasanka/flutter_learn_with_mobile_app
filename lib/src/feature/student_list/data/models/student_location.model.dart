import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_location.entity.dart';

class CompanyModel extends StudentLocation {

  CompanyModel({
    required String id,
    required String name,
  }) : super(id: id, name: name);

  factory CompanyModel.fromJson(Map<String, dynamic> jsonMap) {
    return CompanyModel(id: jsonMap['id'], name: jsonMap['name']);
  }
}