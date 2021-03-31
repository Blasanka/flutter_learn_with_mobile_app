import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_address.entity.dart';

import 'student_location.entity.dart';

class Student extends Equatable {
  final int id;
  final String name;
  final String gender;
  final String imageUrl;
  final String status;
  final String species;
  final String origin;
  final String type;
  final StudentLocation location;
  final Address address;

  Student({
    required this.id,
    required this.name,
    required this.gender,
    required this.imageUrl,
    required this.status,
    required this.species,
    required this.origin,
    required this.type,
    required this.location,
    required this.address,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        status,
        gender,
        species,
        origin,
        type,
        location,
        address,
      ];
}
