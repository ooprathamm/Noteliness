import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../config/router.dart';

void main() => runApp(_Noteliness());

class _Noteliness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Noteliness',
      debugShowCheckedModeBanner: false,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}


