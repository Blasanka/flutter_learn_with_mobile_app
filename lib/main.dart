import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/app.dart';

import 'src/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(SRPApp());
}