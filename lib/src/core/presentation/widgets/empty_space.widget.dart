import 'package:flutter/material.dart';

class EmptySpaceWidget extends StatelessWidget {
  EmptySpaceWidget({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 0,
      height: height ?? 0,
    );
  }
}
