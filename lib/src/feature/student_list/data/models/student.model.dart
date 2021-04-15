import 'package:srp_parent_mobile/src/feature/student_list/data/models/school.model.dart';
import 'package:srp_parent_mobile/src/feature/student_list/data/models/student_address.model.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_address.entity.dart';
import 'package:srp_parent_mobile/src/feature/student_list/data/models/student_location.model.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student.entity.dart';
import 'package:meta/meta.dart';

class StudentModel extends Student {
  StudentModel({
    required int id,
    required String name,
    required String imageUrl,
    required String grade,
    required String principal,
    required String gender,
    required SchoolModel school,
    required String type,
    required String classTeacher,
    required CompanyModel location,
    required Address address,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          location: location,
          gender: gender,
          principal: principal,
          type: type,
          classTeacher: classTeacher,
          school: school,
          grade: grade,
          address: address,
        );

  factory StudentModel.fromJson(Map<String, dynamic> jsonMap) {
    // List<AddressModel> episodes = [];
    //
    // for (Map<String, dynamic> episodeJson in (jsonMap['episode'] as List)) {
    //   episodes.add(AddressModel.fromJson(episodeJson));
    // }

    return StudentModel(
      id: jsonMap['id'],
      name: jsonMap['name'],
      gender: jsonMap['username'],
      grade: jsonMap['grade'] ?? "Grade 9 (A)",
      principal: jsonMap['principal'] ?? "Kevin Brown",
      imageUrl: jsonMap['imageUrl'] ?? 'https://source.unsplash.com/random',
      type: "+(101) 894 423 333",//jsonMap['email'],
      classTeacher: jsonMap['classTeacher'] ?? "-",
      school: jsonMap['school'] ?? SchoolModel(id: 1, name: "Demonstration School", imageUrl: "https://source.unsplash.com/random"),
      address: AddressModel.fromJson(jsonMap['address']),
      location: CompanyModel.fromJson(jsonMap['company']),
    );
  }
}
