import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/model/userScores.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_fruit.dart';
import 'package:language_hack/screens/demoPage.dart';
import 'package:language_hack/screens/flashcardRoute/flashcardRoute.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/questions_list/questions_preTest.dart';
import 'package:language_hack/screens/welcome.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizScoreScreen extends StatefulWidget {
  final int score;
  final int num_questions;
  final String name;
  final String question_level;
  const QuizScoreScreen(
      this.score, this.num_questions, this.name, this.question_level,
      {Key key})
      : super(key: key);

  @override
  _QuizScoreScreenState createState() => _QuizScoreScreenState();
}

class _QuizScoreScreenState extends State<QuizScoreScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String quizStatus = '';
  String docId = '';
  int bestScore = 0;

  Flash_Fruit flash_fruit = new Flash_Fruit();

  UserScores allScores = new UserScores(
      adjective_score: 0,
      carPart_score: 0,
      clothes_score: 0,
      color_score: 0,
      countries_score: 0,
      days_score: 0,
      dbFood_score: 0,
      environment_score: 0,
      family_score: 0,
      feeling_score: 0,
      football_score: 0,
      fruit_score: 0,
      halloween_score: 0,
      ielts_score: 0,
      months_score: 0,
      music_score: 0,
      office_score: 0,
      place_score: 0,
      sports_score: 0,
      toefl_score: 0,
      typeFood_score: 0,
      vegetable_score: 0,
      verbs_score: 0,
      weather_score: 0,
      workshop_score: 0);

  String recommendImage = '';
  String recommendName = '';
  // String recommendLevel = '';
  Widget route;
  List<Widget> basic_recommend_page = [];
  List<String> basic_recommend_image = [];
  List<String> basic_recommend_name = [];
  List<Widget> intermediate_recommend_page = [];
  List<String> intermediate_recommend_image = [];
  List<String> intermediate_recommend_name = [];
  List<Widget> advance_recommend_page = [];
  List<String> advance_recommend_image = [];
  List<String> advance_recommend_name = [];

  CollectionReference scores = FirebaseFirestore.instance.collection('scores');

  Future getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("scores")
        .where("owner",
            isEqualTo: FirebaseAuth.instance.currentUser.displayName.toString())
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      docId = a.id;
      print(a.id);
    }
  }

  Future<void> updateScore() {
    return scores
        .doc(docId)
        .set(
          {
            widget.name: widget.score,
          },
          SetOptions(merge: true),
        )
        .then((value) => print("Score Changed"))
        .catchError((error) => print("Failed to change the score: $error"));
  }

  @override
  void initState() {
    super.initState();
    evaluatelevel();
    getDocs();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("scores")
          .where("owner",
              isEqualTo:
                  FirebaseAuth.instance.currentUser.displayName.toString())
          .snapshots()
          .listen((event) {
        for (var snapshorts in event.docs) {
          Map<String, dynamic> map = snapshorts.data();
          for (var entry in map.entries) {
            if (entry.key == widget.name) {
              bestScore = entry.value;
            }
          }
          UserScores scores = UserScores.fromMap(map);
          setState(() {
            allScores = scores;
          });
          calculateProgress();
          print(bestScore);
        }
      });
    });
  }

  void calculateProgress() {
    if (allScores.adjective_score < 5) {
      basic_recommend_page.add(basic_page[0]);
      basic_recommend_image.add(basic_image[0]);
      basic_recommend_name.add(basic_name[0]);
    }
    if (allScores.color_score < 5) {
      basic_recommend_page.add(basic_page[1]);
      basic_recommend_image.add(basic_image[1]);
      basic_recommend_name.add(basic_name[1]);
    }
    if (allScores.countries_score < 5) {
      basic_recommend_page.add(basic_page[2]);
      basic_recommend_image.add(basic_image[2]);
      basic_recommend_name.add(basic_name[2]);
    }
    if (allScores.days_score < 4) {
      basic_recommend_page.add(basic_page[3]);
      basic_recommend_image.add(basic_image[3]);
      basic_recommend_name.add(basic_name[3]);
    }
    if (allScores.family_score < 5) {
      basic_recommend_page.add(basic_page[4]);
      basic_recommend_image.add(basic_image[4]);
      basic_recommend_name.add(basic_name[4]);
    }
    if (allScores.fruit_score < 5) {
      basic_recommend_page.add(basic_page[5]);
      basic_recommend_image.add(basic_image[5]);
      basic_recommend_name.add(basic_name[5]);
    }
    if (allScores.months_score < 6) {
      basic_recommend_page.add(basic_page[6]);
      basic_recommend_image.add(basic_image[6]);
      basic_recommend_name.add(basic_name[6]);
    }
    if (allScores.vegetable_score < 5) {
      basic_recommend_page.add(basic_page[7]);
      basic_recommend_image.add(basic_image[7]);
      basic_recommend_name.add(basic_name[7]);
    }
    if (allScores.verbs_score < 5) {
      basic_recommend_page.add(basic_page[8]);
      basic_recommend_image.add(basic_image[8]);
      basic_recommend_name.add(basic_name[8]);
    }
    if (allScores.clothes_score < 5) {
      intermediate_recommend_page.add(intermediate_page[0]);
      intermediate_recommend_image.add(intermediate_image[0]);
      intermediate_recommend_name.add(intermediate_name[0]);
    }
    if (allScores.dbFood_score < 5) {
      intermediate_recommend_page.add(intermediate_page[1]);
      intermediate_recommend_image.add(intermediate_image[1]);
      intermediate_recommend_name.add(intermediate_name[1]);
    }
    if (allScores.feeling_score < 5) {
      intermediate_recommend_page.add(intermediate_page[2]);
      intermediate_recommend_image.add(intermediate_image[2]);
      intermediate_recommend_name.add(intermediate_name[2]);
    }
    if (allScores.typeFood_score < 5) {
      intermediate_recommend_page.add(intermediate_page[3]);
      intermediate_recommend_image.add(intermediate_image[3]);
      intermediate_recommend_name.add(intermediate_name[3]);
    }
    if (allScores.football_score < 5) {
      intermediate_recommend_page.add(intermediate_page[4]);
      intermediate_recommend_image.add(intermediate_image[4]);
      intermediate_recommend_name.add(intermediate_name[4]);
    }
    if (allScores.halloween_score < 5) {
      intermediate_recommend_page.add(intermediate_page[5]);
      intermediate_recommend_image.add(intermediate_image[5]);
      intermediate_recommend_name.add(intermediate_name[5]);
    }
    if (allScores.music_score < 5) {
      intermediate_recommend_page.add(intermediate_page[6]);
      intermediate_recommend_image.add(intermediate_image[6]);
      intermediate_recommend_name.add(intermediate_name[6]);
    }
    if (allScores.office_score < 5) {
      intermediate_recommend_page.add(intermediate_page[7]);
      intermediate_recommend_image.add(intermediate_image[7]);
      intermediate_recommend_name.add(intermediate_name[7]);
    }
    if (allScores.sports_score < 5) {
      intermediate_recommend_page.add(intermediate_page[8]);
      intermediate_recommend_image.add(intermediate_image[8]);
      intermediate_recommend_name.add(intermediate_name[8]);
    }
    if (allScores.weather_score < 3) {
      intermediate_recommend_page.add(intermediate_page[9]);
      intermediate_recommend_image.add(intermediate_image[9]);
      intermediate_recommend_name.add(intermediate_name[9]);
    }
    if (allScores.environment_score < 3) {
      advance_recommend_page.add(advance_page[0]);
      advance_recommend_image.add(advance_image[0]);
      advance_recommend_name.add(advance_name[0]);
    }
    if (allScores.ielts_score < 3) {
      advance_recommend_page.add(advance_page[1]);
      advance_recommend_image.add(advance_image[1]);
      advance_recommend_name.add(advance_name[1]);
    }
    if (allScores.carPart_score < 3) {
      advance_recommend_page.add(advance_page[2]);
      advance_recommend_image.add(advance_image[2]);
      advance_recommend_name.add(advance_name[2]);
    }
    if (allScores.toefl_score < 3) {
      advance_recommend_page.add(advance_page[3]);
      advance_recommend_image.add(advance_image[3]);
      advance_recommend_name.add(advance_name[3]);
    }
    if (allScores.workshop_score < 3) {
      advance_recommend_page.add(advance_page[4]);
      advance_recommend_image.add(advance_image[4]);
      advance_recommend_name.add(advance_name[4]);
    }
    reccommendLesson();
  }

  void reccommendLesson() {
    // User fail the test
    if (widget.score <= (widget.num_questions * 0.5)) {
      int index = Random().nextInt(basic_page.length);
      if ((widget.question_level == 'basic' ||
              widget.question_level == 'intermediate') &&
          basic_recommend_name.isNotEmpty) {
        route = basic_recommend_page[index];
        recommendImage = basic_recommend_image[index];
        recommendName = basic_recommend_name[index];
        // recommendLevel = 'basic';
      } else if (widget.question_level == 'advance' &&
          intermediate_recommend_name.isNotEmpty) {
        route = intermediate_recommend_page[index];
        recommendImage = intermediate_recommend_image[index];
        recommendName = intermediate_recommend_name[index];
        // recommendLevel = 'intermediate';
      } else {
        int random = Random().nextInt(2);
        if (random == 0 && basic_recommend_name.isNotEmpty) {
          int index = Random().nextInt(basic_recommend_name.length);
          recommendName = basic_recommend_name[index];
          recommendImage = basic_recommend_image[index];
          route = basic_recommend_page[index];
          // recommendLevel = 'basic';
        } else if (random == 1 && intermediate_recommend_name.isNotEmpty) {
          int index = Random().nextInt(intermediate_recommend_name.length);
          recommendName = intermediate_recommend_name[index];
          recommendImage = intermediate_recommend_image[index];
          route = intermediate_recommend_page[index];
          // recommendLevel = 'intermediate';
        } else {
          int index = Random().nextInt(advance_recommend_name.length);
          recommendName = advance_recommend_name[index];
          recommendImage = advance_recommend_image[index];
          route = advance_recommend_page[index];
          // recommendLevel = 'advance';
        }
      }
    }
    // User score is above 50%
    else if (widget.score > (widget.num_questions * 0.5) &&
        widget.score <= (widget.num_questions * 0.9)) {
      int index = Random().nextInt(basic_page.length);
      if (widget.question_level == 'basic' &&
          intermediate_recommend_name.isNotEmpty) {
        recommendName = intermediate_recommend_name[index];
        recommendImage = intermediate_recommend_image[index];
        route = intermediate_recommend_page[index];
        // recommendLevel = 'intermediate';
      } else if (widget.question_level == 'intermediate' &&
          intermediate_recommend_name.isNotEmpty) {
        recommendName = intermediate_recommend_name[index];
        recommendImage = intermediate_recommend_image[index];
        route = intermediate_recommend_page[index];
        // recommendLevel = 'intermediate';
      } else {
        recommendName = advance_recommend_name[index];
        recommendImage = advance_recommend_image[index];
        route = advance_recommend_page[index];
        // recommendLevel = 'advance';
      }
    }
    // User get perfect score
    else {
      int index = Random().nextInt(basic_page.length);
      if (widget.question_level == 'basic' &&
          intermediate_recommend_name.isNotEmpty) {
        recommendName = intermediate_recommend_name[index];
        recommendImage = intermediate_recommend_image[index];
        route = intermediate_recommend_page[index];
        // recommendLevel = 'intermediate';
      } else if (widget.question_level == 'intermediate' &&
          advance_recommend_name.isNotEmpty) {
        recommendName = advance_recommend_name[index];
        recommendImage = advance_recommend_image[index];
        route = advance_recommend_page[index];
        // recommendLevel = 'advance';
      } else {
        int random = Random().nextInt(2);
        if (random == 0 && basic_recommend_name.isNotEmpty) {
          int index = Random().nextInt(basic_recommend_name.length);
          recommendName = basic_recommend_name[index];
          recommendImage = basic_recommend_image[index];
          route = basic_recommend_page[index];
          // recommendLevel = 'basic';
        } else if (random == 1 && intermediate_recommend_name.isNotEmpty) {
          int index = Random().nextInt(intermediate_recommend_name.length);
          recommendName = intermediate_recommend_name[index];
          recommendImage = intermediate_recommend_image[index];
          route = intermediate_recommend_page[index];
          // recommendLevel = 'intermediate';
        } else {
          int index = Random().nextInt(advance_recommend_name.length);
          recommendName = advance_recommend_name[index];
          recommendImage = advance_recommend_image[index];
          route = advance_recommend_page[index];
          // recommendLevel = 'advance';
        }
      }
    }
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
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.015)),
          Padding(
            padding: const EdgeInsets.only(left: 5, top: 10),
            child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.56,
                padding: EdgeInsets.only(top: 5, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.015)),
                    Text(
                      "Test Result",
                      style: TextStyle(
                          color: HexColor("#461482"),
                          fontSize:
                              MediaQuery.of(context).textScaleFactor * 30),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
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
                        percent: widget.score / widget.num_questions,
                        radius: MediaQuery.of(context).size.width * 0.25,
                        backgroundColor: Colors.grey,
                        circularStrokeCap: CircularStrokeCap.butt,
                        lineWidth: 10,
                        progressColor: Colors.green,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.04)),
                    Row(
                      children: [
                        Text(
                            "Your Score is: ${widget.score}/${widget.num_questions}",
                            style: TextStyle(
                                color: HexColor("#461482"),
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor *
                                        20)),
                        Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    0.015)),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.04)),
                    Row(
                      children: [
                        widget.score > (widget.num_questions * 0.9)
                            ? Text(
                                "Perfect Score!!",
                                style: TextStyle(
                                    color: HexColor("#461482"),
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            20),
                              )
                            : Text(
                                "You ${quizStatus} this test",
                                style: TextStyle(
                                    color: HexColor("#461482"),
                                    fontSize:
                                        MediaQuery.of(context).textScaleFactor *
                                            20),
                              ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 30, left: 20, right: 20, bottom: 10),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.rotate_right),
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
                          label: Text("Continue",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          20)),
                          onPressed: () {
                            if (widget.score > bestScore) {
                              updateScore();
                            }
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return WelcomeScreens();
                            }));
                          },
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: Text(
              "Next Lesson",
              style: TextStyle(
                  fontSize: MediaQuery.of(context).textScaleFactor * 30,
                  color: HexColor("#461482")),
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: HexColor("#461482"),
                        blurRadius: 3,
                        offset: Offset(3, 5),
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.fromLTRB(30, 10, 30, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    width: 110,
                    height: 110,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      onPressed: () {
                        if (widget.score > bestScore) {
                          updateScore();
                        }
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return route;
                        }));
                      },
                      child: Row(
                        children: <Widget>[
                          Image.network(recommendImage,
                              width: MediaQuery.of(context).size.width * 0.3,
                              height: 80,
                              errorBuilder: (context, error, stackTrace) {
                            return const Text(
                              'Loading..',
                              style: TextStyle(fontSize: 20),
                            );
                          }),
                          Padding(padding: EdgeInsets.only(top: 30)),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 38, left: 20),
                                child: Column(children: [
                                  Text(
                                    recommendName,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: HexColor("#461482"),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
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
    );
  }

  void evaluatelevel() {
    if (widget.score <= (widget.num_questions * 0.5)) {
      quizStatus = "fail";
    } else if (widget.score > (widget.num_questions * 0.5) &&
        widget.score <= (widget.num_questions * 0.9)) {
      quizStatus = "pass";
    } else {
      quizStatus = "";
    }
  }
}
