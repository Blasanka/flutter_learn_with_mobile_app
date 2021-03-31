import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Authentication extends Equatable {
  final String task;
  final int id;

  Authentication({required this.task, required this.id});

  @override
  List<Object> get props => [task, id];
}
