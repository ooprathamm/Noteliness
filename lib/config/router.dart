import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../screens/wall_screen.dart';
import '../screens/add_wall_screen_entry.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash_screen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'wall_screen':
        return MaterialPageRoute(builder: (_) => WallScreen());

      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}