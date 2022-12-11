import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../screens/wall_screen.dart';

class AppRouter {
  // all the route paths. So that we can access them easily  across the app
  static const root = '/wall_screen';


  /// private static methods that are accessible only in this class and not from outside
  static Widget _homePageRouteBuilder(BuildContext context, GoRouterState state) => WallScreen();

  /// use this in [MaterialApp.router]
  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(path: root, builder: _homePageRouteBuilder),
    ],
  );

  static GoRouter get router => _router;
}