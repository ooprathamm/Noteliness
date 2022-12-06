import 'package:flutter/material.dart';

import 'package:noteliness/screens/splash_screen.dart';

void main() => runApp(_Noteliness());

class _Noteliness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}

class ScreenController extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}
