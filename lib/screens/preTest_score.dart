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
  const PreTestScoreScreen(this.score, this.num_questions, {Key? key})
      : super(key: key);

  @override
  _PreTestScoreScreenState createState() => _PreTestScoreScreenState();
}

class _PreTestScoreScreenState extends State<PreTestScoreScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String level = '';

  @override
  void initState() {
    super.initState();
    // evaluateScore();
    evaluatelevel();
  }

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
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 120)),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.38,
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
                      style:
                          TextStyle(color: HexColor("#461482"), fontSize: 40),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Row(
                      children: [
                        Text(
                            "Your Score is: ${widget.score}/${widget.num_questions}",
                            style: TextStyle(
                                color: HexColor("#461482"), fontSize: 25)),
                        Padding(padding: EdgeInsets.only(top: 35)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 35)),
                    Row(
                      children: [
                        // Text(
                        //   "Your level is: ${level}",
                        //   style: TextStyle(
                        //       color: HexColor("#461482"), fontSize: 20),
                        // ),
                        Text(
                          "You know English ${level}",
                          style: TextStyle(
                              color: HexColor("#461482"), fontSize: 25),
                        ),
                        // Text(
                        //   "We will adjust the lesson according to your level.",
                        //   style: TextStyle(
                        //       color: HexColor("#461482"), fontSize: 20),
                        // ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "We will adjust the lesson that suit your level",
                    //       style: TextStyle(
                    //           color: HexColor("#461482"), fontSize: 18),
                    //     ),
                    //   ],
                    // ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
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

  void evaluateScore() {
    if (widget.score > 4) {
      level = "Advance";
    } else if (widget.score > 2 && widget.score < 4) {
      level = "Intermidiate";
    } else {
      level = "Basic";
    }
  }

  void evaluatelevel() {
    if (widget.score > 4) {
      level = "very well";
    } else if (widget.score > 2 && widget.score < 4) {
      level = "great";
    } else {
      level = "a little bit";
    }
  }
}
