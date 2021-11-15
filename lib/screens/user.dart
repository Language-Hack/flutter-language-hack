import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/welcome.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/Logo%2Flogo.png?alt=media&token=75cfc4fa-1400-43ed-96d5-2b85ad733971",
              width: 110,
              height: 110,
            ),
            backgroundColor: Colors.amber.shade100,
            iconTheme: IconThemeData(color: Colors.black),
          )),
      body: Container(
          child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: const Text(
                "This is your information",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 35, color: Colors.black),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: const Text(
                "Name:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 50,
              width: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Text(
                    auth.currentUser!.displayName.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: const Text(
                "Email:",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 50,
              width: 50,
              child: DecoratedBox(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: EdgeInsets.all(13),
                  child: Text(
                    auth.currentUser!.email.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage("assets/bg.png"))),
                child: Stack(children: <Widget>[
                  const Positioned(
                    bottom: 40.0,
                    child: Text("Welcome!",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Positioned(
                    bottom: 12.0,
                    child: Text(
                      auth.currentUser!.displayName.toString(),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ])),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(20, 60),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    side: BorderSide(color: Colors.white),
                    alignment: Alignment.centerLeft),
                onPressed: () {
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) {
                  //   return WelcomeScreens();
                  // }));
                },
                icon: Icon(Icons.card_membership),
                label: const Text(
                  "Flash-Card",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.left,
                )),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(20, 60),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    side: BorderSide(color: Colors.white),
                    alignment: Alignment.centerLeft),
                onPressed: () {
                  auth.signOut().then((value) => Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      })));
                },
                icon: Icon(Icons.logout),
                label: const Text(
                  "Log out",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.left,
                )),
          ],
        ),
      ),
    );
  }
}
