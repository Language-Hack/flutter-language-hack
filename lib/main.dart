import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_hack/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:language_hack/screens/welcome.dart';

import 'screens/test.dart';

HomeScreen homeScreen = new HomeScreen();
WelcomeScreens welcomeScreen = new WelcomeScreens();
Widget initialRoute = homeScreen;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value) async {
    await FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        initialRoute = welcomeScreen;
      }
      runApp(const MyApp());
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: initialRoute,
    );
  }
}
