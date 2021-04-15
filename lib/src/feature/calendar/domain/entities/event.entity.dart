import 'package:equatable/equatable.dart';

class Event extends Equatable {
  final int id;
  final String? message;
  final String? details;
  final String? dateTime;

  Event({
    required this.id,
    required this.message,
    required this.details,
    required this.dateTime,
  });

  @override
  List<Object> get props => [
    id,
    message ?? "",
    details ?? "",
    dateTime ?? "",
  ];
}