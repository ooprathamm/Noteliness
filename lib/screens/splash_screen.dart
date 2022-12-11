import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../config/router.dart';
import '../constants/colors.dart';
import '../constants/screensize.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5),
            ()=>GoRouter.of(context).go(AppRouter.wallscreen)
    );
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: myColors.Background,
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SizedBox(
            child: kIsWeb?RiveAnimation.asset('assets/intro_web.riv'):RiveAnimation.asset('assets/intro_mobile.riv'),
          ),
        ),
      ),
    );
  }
}