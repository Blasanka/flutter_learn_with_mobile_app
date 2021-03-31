import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/entities/student_address.entity.dart';

class AddressModel extends Address {
  AddressModel({
    required String street,
    required String suite,
  }) : super(street: street, suite: suite);

  factory AddressModel.fromJson(Map<String, dynamic> jsonMap) {
    return AddressModel(street: jsonMap['street'], suite: jsonMap['suite']);
  }
}