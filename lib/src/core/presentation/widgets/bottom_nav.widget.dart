import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:srp_parent_mobile/src/core/data/datasources/constant/bottom_nav_items.dart';
import 'package:srp_parent_mobile/src/core/data/models/bottom_nav.model.dart';
import 'package:srp_parent_mobile/src/core/provider/page_view.provider.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatelessWidget {

  PageController pageController;

  BottomNavWidget({required this.pageController});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).bottomAppBarColor;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (true)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      height: kBottomNavigationBarHeight + 24,
      padding: const EdgeInsets.only(top: 10, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomNavItems.map((item) {
          var index = bottomNavItems.indexOf(item);
          return GestureDetector(
            onTap: () {
              context.read<PageViewProvider>().isClicked = true;
              context.read<PageViewProvider>().setSelectedPage(context, index, pageController);
            },
            child: _NavItemWidget(
              item: item,
              iconSize: 22,
              isSelected: index == context.watch<PageViewProvider>().selectedPage,
              backgroundColor: bgColor,
              itemCornerRadius: 22,
              animationDuration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
            ),
          );
        }).toList(),
      ),
    );
    // BottomNavigationBar(
    //   currentIndex: controller!.page!.toInt(),
    //   onTap: (int index) {
    //     controller!.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
    //   },
    //   items: [
    //     // There is no point of iterating for 3 items
    //     BottomNavigationBarItem(
    //       icon: Icon(bottomNavItems[0].icon),
    //       label: bottomNavItems[0].label,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(bottomNavItems[1].icon),
    //       label: bottomNavItems[1].label,
    //     ),
    //     BottomNavigationBarItem(
    //       icon: Icon(bottomNavItems[2].icon),
    //       label: bottomNavItems[2].label,
    //     ),
    //   ],
    // );
  }
}

class _NavItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavModel item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _NavItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  })  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 120 : 110,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
          isSelected ? item.activeColor?.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 120 : 110,
            padding: EdgeInsets.only(left: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor?.withOpacity(1)
                        : item.inactiveColor == null
                        ? item.activeColor
                        : item.inactiveColor,
                  ),
                  child: SvgPicture.asset(item.imagePath.first, width: 22, height: 22, color: isSelected
                      ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                      : Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
                  ),
                ),
                SizedBox(width: 5.0),
                // if (isSelected)
                Expanded(
                  child: Container(
                    child: DefaultTextStyle.merge(
                      style: isSelected
                        ? Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle
                        : Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
                      maxLines: 1,
                      textAlign: item.textAlign,
                      child: Text(item.label!),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}