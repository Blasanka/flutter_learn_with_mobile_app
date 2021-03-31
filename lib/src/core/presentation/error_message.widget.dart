import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({this.errorMessage});

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(errorMessage ?? getTranslated(context, "somethingWrong")!),
      ),
    );
  }
}
