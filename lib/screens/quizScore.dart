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
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/questions_list/questions_preTest.dart';
import 'package:language_hack/screens/welcome.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class QuizScoreScreen extends StatefulWidget {
  final int score;
  final int num_questions;
  final String name;
  const QuizScoreScreen(this.score, this.num_questions, this.name, {Key key})
      : super(key: key);

  @override
  _QuizScoreScreenState createState() => _QuizScoreScreenState();
}

class _QuizScoreScreenState extends State<QuizScoreScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  String level = '';
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
          print(bestScore);
        }
      });
    });
  }

  String calculatePercent() {
    int percent = widget.score * widget.num_questions;
    String stringPercent = percent.toString() + ' %';
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
                height: MediaQuery.of(context).size.height * 0.55,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: Colors.amber.shade100,
                    border: Border.all(color: Colors.black, width: 3.0),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 15)),
                    Text(
                      "Test Result",
                      style:
                          TextStyle(color: HexColor("#461482"), fontSize: 40),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Center(
                      child: CircularPercentIndicator(
                        center: Text(
                          calculatePercent(),
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.green),
                        ),
                        percent: (widget.score * widget.num_questions) / 100,
                        radius: 140,
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
                                color: HexColor("#461482"), fontSize: 25)),
                        Padding(padding: EdgeInsets.only(top: 35)),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 35)),
                    Row(
                      children: [
                        widget.score > (widget.num_questions * 0.9)
                            ? Text(
                                "Perfect Score!!",
                                style: TextStyle(
                                    color: HexColor("#461482"), fontSize: 25),
                              )
                            : Text(
                                "You ${level} this test",
                                style: TextStyle(
                                    color: HexColor("#461482"), fontSize: 25),
                              ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),
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
                              Text("Continue", style: TextStyle(fontSize: 25)),
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
          Padding(padding: const EdgeInsets.only(top: 15)),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Next Lesson",
                  style: TextStyle(fontSize: 30, color: HexColor("#461482")),
                ),
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
                  margin: const EdgeInsets.fromLTRB(20, 10, 30, 5),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.black),
                        borderRadius: BorderRadius.circular(20)),
                    width: 230,
                    height: 170,
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return flash_fruit;
                          }));
                        },
                        child: Column(children: <Widget>[
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffruits.png?alt=media&token=548254ec-fbf7-428d-aa57-a1b23beacf56",
                            width: 100,
                            height: 100,
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          Text(
                            "Fruit",
                            style: TextStyle(fontSize: 30),
                          )
                        ])),
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
      level = "fail";
    } else if (widget.score > (widget.num_questions * 0.5) &&
        widget.score <= (widget.num_questions * 0.9)) {
      level = "pass";
    } else {
      level = "";
    }
  }
}
