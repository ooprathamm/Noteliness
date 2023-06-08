import 'package:flutter/material.dart';

import '../screens/navigator.dart';
import '../screens/splash_screen.dart';
import '../screens/wall_screen.dart';
import '../screens/attendance_screen.dart';
import '../screens/books_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash_screen':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case 'wall_screen':
        return MaterialPageRoute(builder: (_) => WallScreen());
      case 'attendance':
        return MaterialPageRoute(builder: (_) => AttendanceScreen());
      case 'nav':
        return MaterialPageRoute(builder: (_) => NavigatorScreen());
      case 'books':
        return MaterialPageRoute(builder: (_) => BooksScreen());

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