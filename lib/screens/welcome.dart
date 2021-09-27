import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_hack/screens/home.dart';
import 'flashcardPage.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key? key}) : super(key: key);

  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 100, left: 20),
              child: (Text(
                auth.currentUser!.email.toString(),
                style: TextStyle(fontSize: 40, color: Colors.black),
                textAlign: TextAlign.left,
              )),
            ),
            Padding(padding: EdgeInsets.all(16.0)),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  label: const Text("Log Out", style: TextStyle(fontSize: 20)),
                  icon: Icon(null),
                  onPressed: () {
                    auth.signOut().then((value) => Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        })));
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                  label: const Text("Go to Flashcard Page",
                      style: TextStyle(fontSize: 20)),
                  icon: Icon(null),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return FlashCardScreens();
                    }));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
