// ignore: import_of_legacy_library_into_null_safe
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String name;
  final String gender;
  final String imageUrl;
  final String status;

  User({
    required this.id,
    required this.name,
    required this.gender,
    required this.imageUrl,
    required this.status,
  });

  @override
  List<Object> get props => [
    id,
    name,
    imageUrl,
    status,
    gender,
  ];
}
