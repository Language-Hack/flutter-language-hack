import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/demoPage.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/questions_list/questions_preTest.dart';
import 'package:language_hack/screens/welcome.dart';

class PreTestScoreScreen extends StatefulWidget {
  final int score;
  final int num_questions;
  const PreTestScoreScreen(this.score, this.num_questions, {Key key})
      : super(key: key);

  @override
  _PreTestScoreScreenState createState() => _PreTestScoreScreenState();
}

class _PreTestScoreScreenState extends State<PreTestScoreScreen> {
  final auth = FirebaseAuth.instance;
  String level = '';

  @override
  void initState() {
    super.initState();
    evaluatelevel();
  }

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
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text(
                      "Pre-Test Result",
                      style: TextStyle(
                          color: HexColor("#461482"),
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 35),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Row(
                      children: [
                        Text(
                            "Your Score is: ${widget.score}/${widget.num_questions}",
                            style: TextStyle(
                                color: HexColor("#461482"),
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        22)),
                        Padding(padding: EdgeInsets.only(top: 35)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 35)),
                    Row(
                      children: [
                        Text(
                          "You know English ${level}",
                          style: TextStyle(
                              color: HexColor("#461482"),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor("#461482"),
                            blurRadius: 4,
                            offset: Offset(3, 5),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: HexColor("#461482"),
                              onPrimary: Colors.white,
                              side: BorderSide(width: 2, color: Colors.black)),
                          child:
                              Text("Continue", style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DemoScreens();
                            }));
                          },
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  void evaluatelevel() {
    if (widget.score <= 4) {
      level = "a little bit";
    } else if (widget.score > 4 && widget.score <= 8) {
      level = "great";
    } else {
      level = "very well";
    }
  }
}
