import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StudentLocation extends Equatable {
  final String id;
  final String name;

  StudentLocation({
    required this.id,
    required this.name,
  });

  @override
  List<Object> get props => [id, name];
}
