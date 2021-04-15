import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/school.entity.dart';

class SchoolModel extends School {
  SchoolModel({
    required int id,
    required String name,
    required String imageUrl,
  }) : super(
    id: id,
    name: name,
    imageUrl: imageUrl,
  );


  factory SchoolModel.fromJson(Map<String, dynamic> jsonMap) {
    return SchoolModel(
      id: jsonMap['id'],
      name: jsonMap['name'],
      imageUrl: jsonMap['imageUrl'] ?? 'https://source.unsplash.com/random',
    );
  }
}