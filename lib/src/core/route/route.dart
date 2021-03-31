import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/presentation/unknown.screen.dart';
import 'package:srp_parent_mobile/src/core/route/route.constants.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/screens/authentication.screen.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/screens/splash.screen.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/screens/student_list.screen.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.splashScreen:
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen();
          },
        );
      case RouteConstants.loginScreen:
        return MaterialPageRoute(
          builder: (context) {
            return LoginScreen();
          },
        );
      case RouteConstants.studentsListScreen:
        // final todoModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) {
            return StudentListScreen(
              // key: ValueKey(todoModel.id),
              // todoModel: todoModel,
            );
          },
        );
      case RouteConstants.studentProfileScreen:
      // final todoModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen(
              // key: ValueKey(todoModel.id),
              // todoModel: todoModel,
            );
          },
        );
      case RouteConstants.bulletinsScreen:
      // final todoModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen(
              // key: ValueKey(todoModel.id),
              // todoModel: todoModel,
            );
          },
        );
      case RouteConstants.eventsScreen:
      // final todoModel = settings.arguments;
        return MaterialPageRoute(
          builder: (context) {
            return SplashScreen(
              // key: ValueKey(todoModel.id),
              // todoModel: todoModel,
            );
          },
        );
    }

    assert(false, 'Need to implement ${settings.name}');
    return MaterialPageRoute(builder: (_) => UnknownScreen());
  }
}
