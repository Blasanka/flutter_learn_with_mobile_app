import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';

class UserModel extends User {
  UserModel({
    required String id,
    required String name,
    required String imageUrl,
    required String status,
    required String gender,
  }) : super(
    id: id,
    name: name,
    imageUrl: imageUrl,
    gender: gender,
    status: status,
  );

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {

    return UserModel(
      id: jsonMap['id'],
      name: jsonMap['name'],
      gender: jsonMap['gender'],
      status: jsonMap['status'],
      imageUrl: jsonMap['image']
    );
  }
}
