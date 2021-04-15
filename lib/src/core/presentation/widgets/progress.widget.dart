import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/constants/app_colors.dart';
import 'package:srp_parent_mobile/src/core/constants/dimensions.dart';

class ProgressWidget extends StatelessWidget {

  ProgressWidget({this.width, this.height});

  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Dimensions.kDefaultSpace,
      height: height ?? Dimensions.kDefaultSpace,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(AppColors.kLightGrey),
        backgroundColor: AppColors.kLightGrey,
      ),
    );
  }
}
