import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/constants/app_colors.dart';
import 'package:srp_parent_mobile/src/core/data/models/bottom_nav.model.dart';

final List<BottomNavModel> bottomNavItems = [
  BottomNavModel(
      imagePath: ["assets/images/calendar.svg"],
      label: "Calendar",
      inactiveColor: AppColors.inactiveColorLight,
      activeColor: AppColors.primaryColor),
  BottomNavModel(
      imagePath: ["assets/images/magazine.svg"],
      label: "Notices",
      inactiveColor: AppColors.inactiveColorLight,
      activeColor: AppColors.primaryColor),
  BottomNavModel(
      imagePath: ["assets/images/student.svg"],
      label: "Profile",
      inactiveColor: AppColors.inactiveColorLight,
      activeColor: AppColors.primaryColor),
];
