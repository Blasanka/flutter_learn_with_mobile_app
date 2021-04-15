import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class School extends Equatable {
  final int id;
  final String name;
  final String imageUrl;

  School({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
    id,
    name,
    imageUrl,
  ];
}
