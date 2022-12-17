import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '../config/router.dart';
import 'firebase_options.dart';
import 'package:noteliness/providers/wall_screen_provider.dart';

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
    return MultiProvider(
        providers:[
          ChangeNotifierProvider(create: (_) => wallScreenProvider()),
        ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Noteliness',
      initialRoute: 'splash_screen',
      onGenerateRoute: Routers.generateRoute),
    );
  }
}




