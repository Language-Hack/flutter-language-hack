import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/questions_list/questions_preTest.dart';
import 'package:language_hack/screens/welcome.dart';

class DisplayScoreScreen extends StatefulWidget {
  final int score;
  final int num_questions;
  const DisplayScoreScreen(this.score, this.num_questions, {Key? key})
      : super(key: key);

  @override
  _DisplayScoreScreenState createState() => _DisplayScoreScreenState();
}

class _DisplayScoreScreenState extends State<DisplayScoreScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

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
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber.shade100,
            iconTheme: IconThemeData(color: HexColor("#461482")),
          )),
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 120)),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child:
                    // Center(child: Text("${widget.score}")),
                    Column(
                  children: [
                    Text(
                      "Congratulations!!",
                      style:
                          TextStyle(color: HexColor("#461482"), fontSize: 35),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text(
                        "Your Score is : ${widget.score} / ${widget.num_questions}",
                        style: TextStyle(
                            color: HexColor("#461482"), fontSize: 20)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
