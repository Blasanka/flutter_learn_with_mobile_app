import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/school.entity.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_address.entity.dart';

import 'student_location.entity.dart';

class Student extends Equatable {
  final int id;
  final String name;
  final String gender;
  final String imageUrl;
  final String grade;
  final String principal;
  final String classTeacher;
  final School school;
  final String type;
  final StudentLocation location;
  final Address address;

  Student({
    required this.id,
    required this.name,
    required this.gender,
    required this.imageUrl,
    required this.grade,
    required this.principal,
    required this.classTeacher,
    required this.school,
    required this.type,
    required this.location,
    required this.address,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        grade,
        gender,
        principal,
        classTeacher,
        school,
        type,
        location,
        address,
      ];
}
