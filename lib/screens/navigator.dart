import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../model/nav_menu.dart';
import '../constants/colors.dart';
import '../widgets/knob.dart';

class NavigatorScreen extends StatefulWidget{
  @override
  State<NavigatorScreen> createState() => _NavigatorState();
}

class _NavigatorState extends State<NavigatorScreen>{

  List<ImageStringPair> NIcons = [
    ImageStringPair(image: Image.asset('assets/images/knob/notes.png'), text: 'wall_screen'),
    ImageStringPair(image: Image.asset('assets/images/knob/attendance.png'), text: 'attendance'),
    ImageStringPair(image: Image.asset('assets/images/knob/books.png'), text: 'books')
  ];
  @override
  Widget build(BuildContext context) {
    Image selectedIcon = NIcons[0].image;
    return Scaffold(
      backgroundColor: myColors.DarkGrey,
      body: SafeArea(
        child: Stack(
          children: [
            Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..scale(-1.0, 1.0, 1.0),
                child: RiveAnimation.asset('assets/arrow.riv')
            ),
            Center(
              child: KnobSelector(
              icons: NIcons,
              initialValue: 0,
              onChanged: (icon) {
                setState(() {
                  selectedIcon = icon;
                });
              },
          ),
            )]
        ),
      )
    );
  }
}