import 'package:flutter/material.dart';

import 'package:noteliness/constants/strings.dart';
import 'package:noteliness/screens/choose_course.dart';
import '../screens/wall_screen.dart';

class Router {
  Route? generateRoute(RouteSettings settings){
    switch(settings.name) {
      case wallScreen:
        return MaterialPageRoute(builder: (_) => WallScreen());
      case chooseCourse:
        return MaterialPageRoute(builder: (_) => chooseScreen());
    }
  }
}