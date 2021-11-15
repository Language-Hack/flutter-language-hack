import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/welcome.dart';

class TestUserLevelScreen extends StatefulWidget {
  const TestUserLevelScreen({Key key}) : super(key: key);

  @override
  _TestUserLevelScreenState createState() => _TestUserLevelScreenState();
}

class _TestUserLevelScreenState extends State<TestUserLevelScreen> {
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
        body: Container(
          child: Center(child: Text("Test Screen")),
        ));
  }
}
