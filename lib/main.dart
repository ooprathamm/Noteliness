import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'constants/screensize.dart';

void main() => runApp(_Noteliness());

class _Noteliness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: home()
    );
  }
}

class home extends StatefulWidget{
  @override
  State<home> createState() => _homeState();
  
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
   return Container(
     color: const Color(0xFF313131),
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

