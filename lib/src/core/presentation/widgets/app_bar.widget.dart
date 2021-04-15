import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/constants/app_assets_paths.dart';
import 'package:srp_parent_mobile/src/core/constants/app_colors.dart';
import 'package:srp_parent_mobile/src/core/provider/theme.provider.dart';
import 'package:provider/provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSize {

  AppBarWidget({
    required this.title,
    required this.actions
  });

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
        style: Theme.of(context).textTheme.headline6),
      centerTitle: true,
      actions: [
        IconButton(
          icon: (context.watch<ThemeProvider>().themeMode == ThemeMode.dark)
            ? Image.asset(AppAssetPaths.lightModeImage, color: AppColors.foreGroundColor, width: 24, height: 24,)
            : Image.asset(AppAssetPaths.darkModeImage, color: AppColors.kDarkGrey, width: 24, height: 24,),
          onPressed: () {
            context.read<ThemeProvider>().changeThemeMode();
          },
        ),
       ...actions,
      ],
    );
  }

  @override
  Widget get child => SizedBox();

  @override
  Size get preferredSize => Size(double.infinity, kToolbarHeight);
}
