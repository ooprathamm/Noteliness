import 'package:flutter/material.dart';

import '../screens/splash_screen.dart';
import '../router/router.dart';

void main() => runApp(_Noteliness(
  router: Router(),
));

class _Noteliness extends StatelessWidget {
  final Router router;
  const _Noteliness({super.key,required this.router});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

