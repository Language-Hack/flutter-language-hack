import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/demoPage.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/testUserLevel.dart';
import 'package:language_hack/screens/welcome.dart';

class PreTestScreen extends StatefulWidget {
  const PreTestScreen({Key key}) : super(key: key);

  @override
  _PreTestScreenScreenState createState() => _PreTestScreenScreenState();
}

class _PreTestScreenScreenState extends State<PreTestScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.asset(
              "assets/logo.png",
              width: 110,
              height: 110,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber.shade100,
            iconTheme: IconThemeData(color: HexColor("#461482")),
          )),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 50)),
            Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(
                color: HexColor("FFE57F"),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.75,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 0.5)),
                  Center(
                      child: Text(
                    "Choose Your Path",
                    style: TextStyle(fontSize: 30, color: HexColor("#461482")),
                  )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 0.5)),
                  Center(
                      child: Text(
                    "Start with basic",
                    style: TextStyle(fontSize: 20, color: HexColor("#461482")),
                  )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(70)),
                      width: 130,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return DemoScreens();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.asset(
                              "assets/pre-test1.png",
                              width: 90,
                              height: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 0.5)),
                  Center(
                      child: Text(
                    "OR",
                    style: TextStyle(fontSize: 30, color: HexColor("#461482")),
                  )),
                  Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top * 0.5)),
                  Center(
                      child: Text(
                    "Short Pre-Test",
                    style: TextStyle(fontSize: 20, color: HexColor("#461482")),
                  )),
                  Container(
                    margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(70)),
                      width: 130,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(70)),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return TestUserLevelScreen();
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image.asset(
                              "assets/pre-test2.png",
                              width: 90,
                              height: 90,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
