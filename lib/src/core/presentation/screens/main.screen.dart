import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/widgets/app_bar.widget.dart';
import 'package:srp_parent_mobile/src/core/presentation/widgets/bottom_nav.widget.dart';
import 'package:srp_parent_mobile/src/core/provider/page_view.provider.dart';
import 'package:srp_parent_mobile/src/feature/calendar/presentation/screens/calendar.screen.dart';
import 'package:srp_parent_mobile/src/feature/notices/presentation/screens/notices.screen.dart';
import 'package:srp_parent_mobile/src/feature/student_profile/presentation/screens/student_profile.screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  PageController? _pageController = PageController();

  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          // Positioned(
          //   top: 50,
          //   left: 0,
          //   child: AnimatedContainer(
          //     height:
          //         (MediaQuery.of(context).size.height - 150) / scaleFactor - .2,
          //     transform: Matrix4.translationValues(xOffset - 34, yOffset, 0)
          //       ..scale(scaleFactor - .2)
          //       ..rotateY(isDrawerOpen ? 0.5 : 0),
          //     duration: Duration(milliseconds: 250),
          //     decoration: BoxDecoration(
          //       // borderRadius: BorderRadius.only(
          //       //   topLeft: Radius.circular(isDrawerOpen ? 40 : 0),
          //       //   bottomLeft: Radius.circular(isDrawerOpen ? 40 : 0),
          //       // ),
          //       color: Colors.white,
          //     ),
          //     child: Column(
          //       children: [
          //         SizedBox(height: 40),
          //         // Row(
          //         //   children: [
          //         //     isDrawerOpen
          //         //         ? IconButton(
          //         //             icon: Icon(Icons.arrow_back_ios),
          //         //             onPressed: () {},
          //         //           )
          //         //         : IconButton(
          //         //             icon: Icon(Icons.menu),
          //         //             onPressed: () {},
          //         //           ),
          //         //   ],
          //         // ),
          //         SizedBox(width: 100),
          //       ],
          //     ),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Stephanie Jinkins",
                            style: Theme.of(context).textTheme.headline6),
                        Text("STU001",
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Text(getTranslated(context, "attendance")!,
                    style: Theme.of(context).textTheme.subtitle1),
                SizedBox(height: 20),
                Text(getTranslated(context, "yearPlanner")!,
                    style: Theme.of(context).textTheme.subtitle1),
                SizedBox(height: 20),
                Text(getTranslated(context, "communication")!,
                    style: Theme.of(context).textTheme.subtitle1),
              ],
            ),
          ),
          AnimatedContainer(
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scaleFactor)
              ..rotateY(isDrawerOpen ? 0.5 : 0),
            duration: Duration(milliseconds: 250),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
              color: Theme.of(context).primaryColorDark,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: const Radius.circular(18.0),
                  bottomLeft: const Radius.circular(18.0),
                ),
              ),
              child: Scaffold(
                appBar: AppBarWidget(
                  title: context.watch<PageViewProvider>().pageTitle,
                  actions: <Widget>[
                    InkWell(
                      onTap: () async {},
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Icon(Icons.refresh, size: 30.0),
                      ),
                    )
                  ],
                ),
                bottomNavigationBar:
                BottomNavWidget(pageController: _pageController!),
                body: PageView(
                  controller: _pageController,
                  onPageChanged: (int currentPage) {
                    if (!context.read<PageViewProvider>().isClicked)
                      context.read<PageViewProvider>().setSelectedPage(
                          context, currentPage, _pageController!);
                    else
                      context.read<PageViewProvider>().isClicked = false;
                  },
                  children: [
                    CalendarScreen(),
                    NoticesScreen(),
                    StudentProfileScreen(),
                  ],
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Row(
                children: [
                  isDrawerOpen
                      ? IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      })
                      : IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      setState(() {
                        xOffset = MediaQuery.of(context).size.width / 2;
                        yOffset =
                            MediaQuery.of(context).size.height / 5.5;
                        scaleFactor = 0.7;
                        isDrawerOpen = true;
                      });
                    },
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}