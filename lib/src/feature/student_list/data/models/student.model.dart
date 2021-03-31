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
    required String status,
    required String species,
    required String gender,
    required String type,
    required String origin,
    required CompanyModel location,
    required Address address,
  }) : super(
          id: id,
          name: name,
          imageUrl: imageUrl,
          location: location,
          gender: gender,
          species: species,
          type: type,
          origin: origin,
          status: status,
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
      status: jsonMap['username'],
      species: jsonMap['website'],
      imageUrl: 'https://source.unsplash.com/random',
      type: jsonMap['email'],
      origin: jsonMap['phone'],
      address: AddressModel.fromJson(jsonMap['address']),
      location: CompanyModel.fromJson(jsonMap['company']),
    );
  }
}
