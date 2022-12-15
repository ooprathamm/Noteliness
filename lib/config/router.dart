import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screens/add_wall_screen_entry.dart';
import '../screens/wall_screen.dart';
import '../screens/splash_screen.dart';

class AppRouter {
  // all the route paths. So that we can access them easily  across the app
  static const root = '/';
  static const wallscreen ='/wall_screen';

  /// private static methods that are accessible only in this class and not from outside
  static Widget _splashScreenRouteBuilder(BuildContext context, GoRouterState state) => SplashScreen();
  static Widget _wallScreenRouteBuilder(BuildContext context, GoRouterState state) => WallScreen();

  /// use this in [MaterialApp.router]
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: root, builder: _splashScreenRouteBuilder),
      GoRoute(path: wallscreen, builder: _wallScreenRouteBuilder),
    ],
  );

  static GoRouter get router => _router;
}