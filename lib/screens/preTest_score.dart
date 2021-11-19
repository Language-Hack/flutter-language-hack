import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:percent_indicator/circular_percent_indicator.dart';

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
  String userLevel = '';
  String userFeedback = '';
  final String userDisplayname =
      FirebaseAuth.instance.currentUser.displayName.toString();

  CollectionReference level = FirebaseFirestore.instance.collection('level');

  @override
  void initState() {
    super.initState();
    evaluatelevel();
  }

  String calculatePercent() {
    double percent = (widget.score / widget.num_questions) * 100;
    String stringPercent = percent.toStringAsFixed(0) + ' %';
    return stringPercent;
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
          Padding(padding: const EdgeInsets.only(top: 30)),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.92,
                height: MediaQuery.of(context).size.height * 0.72,
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
                    Center(
                      child: CircularPercentIndicator(
                        center: Text(
                          calculatePercent(),
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize:
                                  25.0 * MediaQuery.of(context).textScaleFactor,
                              color: Colors.green),
                        ),
                        percent: (widget.score * widget.num_questions) / 100,
                        radius: MediaQuery.of(context).size.width * 0.25,
                        backgroundColor: Colors.grey,
                        circularStrokeCap: CircularStrokeCap.butt,
                        lineWidth: 10,
                        progressColor: Colors.green,
                      ),
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
                          "You know English ${userFeedback}",
                          style: TextStyle(
                              color: HexColor("#461482"),
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            elevation: 10,
                            primary: Colors.white,
                            onPrimary: HexColor("#461482"),
                            side: BorderSide(
                                width: 2, color: HexColor("#461482")),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child:
                              Text("Continue", style: TextStyle(fontSize: 20)),
                          onPressed: () {
                            level.add({
                              'level': userLevel,
                              'owner': userDisplayname,
                            }).catchError(
                                (error) => print("Failed to add user: $error"));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return DemoScreens(userLevel);
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
      userFeedback = "a little bit";
      userLevel = "basic";
    } else if (widget.score > 4 && widget.score <= 8) {
      userFeedback = "great";
      userLevel = "intermediate";
    } else {
      userFeedback = "very well";
      userLevel = "advance";
    }
  }
}
