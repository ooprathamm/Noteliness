import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../config/router.dart';

void main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(_Noteliness());
}

class _Noteliness extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noteliness',
      initialRoute: 'splash_screen',
      onGenerateRoute: Routers.generateRoute,
    );
  }
}




