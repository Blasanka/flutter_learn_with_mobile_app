import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Address extends Equatable {
  final String street;
  final String suite;

  Address({required this.street, required this.suite});

  @override
  List<Object> get props => [street, suite];
}
