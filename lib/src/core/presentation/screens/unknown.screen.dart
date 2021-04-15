import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(getTranslated(context, 'unknown') ?? ""),
      ),
    );
  }
}
