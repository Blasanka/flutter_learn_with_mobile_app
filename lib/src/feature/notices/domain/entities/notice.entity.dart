import 'package:equatable/equatable.dart';

class Notice extends Equatable {
  final int id;
  final String? title;
  final String? description;
  final String? imageUrl;

  Notice({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object> get props => [
    id,
    title ?? "",
    description ?? "",
    imageUrl ?? "",
  ];
}