import 'package:flutter/material.dart';
import 'package:goldy/core/persention/home_screen.dart';
import 'package:goldy/core/routing/routes.dart';
import 'package:goldy/features/gold/persentation/screen/widgets/gold_screen.dart';

class AppRouter {
  get generateRoute => null;

  Route generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homescreen:
        return MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        );

      case AppRoutes.goldscreen:
        return MaterialPageRoute(
          builder: (context) {
            return GoldScreen();
          },
        );

      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(child: Text("No route defined for${settings.name}")),
            );
          },
        );
    }
  }
}
