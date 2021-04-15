import 'package:flutter/material.dart';

class BottomNavModel {

  BottomNavModel({
    required this.imagePath,
    required this.label,
    this.activeColor,
    this.textAlign,
    this.inactiveColor,
  });

  /// Defines this item's icon which is placed in the right side of the [label].
  final List<String> imagePath;

  /// Defines this item's label which placed in the left side of the [icon].
  final String? label;

  /// The [icon] and [label] color defined when this item is selected. Defaults
  /// to [Colors.blue].
  final Color? activeColor;

  /// The [icon] and [label] color defined when this item is not selected.
  final Color? inactiveColor;

  /// The alignment for the [label].
  ///
  /// This will take effect only if [label] it a [Text] widget.
  final TextAlign? textAlign;

}