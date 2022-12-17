import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import '../config/router.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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




