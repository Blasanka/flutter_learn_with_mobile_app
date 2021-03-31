import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/student_episode.entity.dart';

class AddressModel extends Address {
  AddressModel({
    required String street,
    required String suite,
  }) : super(street: street, suite: suite);

  factory AddressModel.fromJson(Map<String, dynamic> jsonMap) {
    return AddressModel(street: jsonMap['street'], suite: jsonMap['suite']);
  }
}