import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_hack/screens/home.dart';
import 'package:flip_card/flip_card.dart';

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
            SizedBox(
                width: 100,
                height: 230,
                child: FlipCard(
                  front: Card(
                    elevation: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 100,
                            height: 100,
                          ),
                          const Text(
                            "Hello!",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 50, color: Colors.black),
                          ),
                          Padding(padding: EdgeInsets.all(5.0)),
                          const Text(
                            "Example Sentence: Hello, Jacob",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ),
                  back: Card(
                    elevation: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.all(45.0)),
                          const Text(
                            "(noun) สวัสดี!",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.chevron_left),
                    label: Text("Prev")),
                OutlinedButton.icon(
                    onPressed: () => {},
                    icon: Icon(Icons.chevron_right),
                    label: Text("Next")),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
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
          ],
        ),
      ),
    ));
  }
}
