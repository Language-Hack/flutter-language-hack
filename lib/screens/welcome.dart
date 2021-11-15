// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/userScores.dart';
import 'package:language_hack/screens/allLessons.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_adjectives.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_color.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_countries.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_day.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_family.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_fruit.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_months.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_places.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_vegetables.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_verbs.dart';
import 'package:language_hack/screens/createFlashcard.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/testUserLevel.dart';
import 'package:language_hack/screens/user.dart';
import 'package:language_hack/screens/onBoarding.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key key}) : super(key: key);
  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final auth = FirebaseAuth.instance;
  int basicScore = 0;
  int intermediateScore = 0;
  int advanceScore = 0;
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
  final String userDisplayname =
      FirebaseAuth.instance.currentUser.displayName.toString();

  @override
  void initState() {
    super.initState();
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
          UserScores scores = UserScores.fromMap(map);
          setState(() {
            allScores = scores;
          });
          calculateProgress();
        }
      });
    });
  }

  void calculateProgress() {
    if (allScores.adjective_score > 0) {
      basicScore++;
    }
    if (allScores.color_score > 0) {
      basicScore++;
    }
    if (allScores.countries_score > 0) {
      basicScore++;
    }
    if (allScores.days_score > 0) {
      basicScore++;
    }
    if (allScores.family_score > 0) {
      basicScore++;
    }
    if (allScores.fruit_score > 0) {
      basicScore++;
    }
    if (allScores.months_score > 0) {
      basicScore++;
    }
    if (allScores.vegetable_score > 0) {
      basicScore++;
    }
    if (allScores.verbs_score > 0) {
      basicScore++;
    }
    if (allScores.clothes_score > 0) {
      basicScore++;
    }
    if (allScores.dbFood_score > 0) {
      intermediateScore++;
    }
    if (allScores.feeling_score > 0) {
      intermediateScore++;
    }
    if (allScores.typeFood_score > 0) {
      intermediateScore++;
    }
    if (allScores.football_score > 0) {
      intermediateScore++;
    }
    if (allScores.halloween_score > 0) {
      intermediateScore++;
    }
    if (allScores.music_score > 0) {
      intermediateScore++;
    }
    if (allScores.office_score > 0) {
      intermediateScore++;
    }
    if (allScores.sports_score > 0) {
      intermediateScore++;
    }
    if (allScores.weather_score > 0) {
      intermediateScore++;
    }
    if (allScores.environment_score > 0) {
      advanceScore++;
    }
    if (allScores.ielts_score > 0) {
      advanceScore++;
    }
    if (allScores.carPart_score > 0) {
      advanceScore++;
    }
    if (allScores.toefl_score > 0) {
      advanceScore++;
    }
    if (allScores.workshop_score > 0) {
      advanceScore++;
    }
    print("basic: ${basicScore}");
    print("intermediate: ${intermediateScore}");
    print("advance: ${advanceScore}");
  }

  String calculatePercent(int score, int num_question) {
    double percent = (score / num_question) * 100;
    String stringPercent = percent.toStringAsFixed(0) + "%";
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
              color: HexColor("#461482"),
            ),
            backgroundColor: Colors.amber.shade100,
            iconTheme: IconThemeData(color: HexColor("#461482")),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return UserScreen();
                  }));
                },
                icon: Icon(Icons.person),
              ),
              // ),
            ],
          )),
      body: Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  "Find your favorite course here",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 27,
                      color: HexColor("#461482"),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Row(
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
                      margin: const EdgeInsets.fromLTRB(25, 20, 40, 10),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return TestUserLevelScreen(); // Fix this
                            }));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.network(
                                "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/WelcomePage%2Fnotebook.png?alt=media&token=351bc3c1-8356-4ed0-85cd-b50e6276b244",
                                width: 30,
                                height: 95,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              Text(
                                "Notebook",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor("#461482")),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                      margin: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return AllLessonScreen();
                            }));
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Image.network(
                                  "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/WelcomePage%2FallLessons.png?alt=media&token=ca157928-c2c0-4370-9886-61b7717cc9f2",
                                  width: 30,
                                  height: 95,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 10)),
                                Text(
                                  "All Lessons",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor("#461482")),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 10),
                child: Text(
                  "Overall Completion",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 27,
                      color: HexColor("#461482"),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Center(
                        child: CircularPercentIndicator(
                          center: Text(
                            calculatePercent(basicScore, 9),
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.green),
                          ),
                          percent: basicScore / 9,
                          radius: 120,
                          backgroundColor: Colors.grey,
                          circularStrokeCap: CircularStrokeCap.butt,
                          lineWidth: 10,
                          progressColor: Colors.green,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Center(
                        child: CircularPercentIndicator(
                          center: Text(
                            calculatePercent(intermediateScore, 10),
                            style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                                color: Colors.green),
                          ),
                          percent: intermediateScore / 10,
                          radius: 120,
                          backgroundColor: Colors.grey,
                          circularStrokeCap: CircularStrokeCap.butt,
                          lineWidth: 10,
                          progressColor: Colors.green,
                        ),
                      ),
                    ),
                    Center(
                      child: CircularPercentIndicator(
                        center: Text(
                          calculatePercent(advanceScore, 5),
                          style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: Colors.green),
                        ),
                        percent: advanceScore / 5,
                        radius: 120,
                        backgroundColor: Colors.grey,
                        circularStrokeCap: CircularStrokeCap.butt,
                        lineWidth: 10,
                        progressColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 15),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                  ),
                  Text(
                    "Basic",
                    style: TextStyle(fontSize: 25, color: HexColor("#461482")),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 44),
                  ),
                  Text("Intermidiate",
                      style:
                          TextStyle(fontSize: 25, color: HexColor("#461482"))),
                  Padding(
                    padding: const EdgeInsets.only(left: 19),
                  ),
                  Text("Advance",
                      style:
                          TextStyle(fontSize: 25, color: HexColor("#461482")))
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 10),
                child: Text(
                  "Recommended Lesson",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 27,
                      color: HexColor("#461482"),
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
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
                          margin: const EdgeInsets.fromLTRB(20, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
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
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Color();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Fcolors.png?alt=media&token=bede6c51-1b49-439c-8eb0-5017ce97471a",
                                    width: 80,
                                    height: 80,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 30)),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Color (Basic)",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: HexColor("#461482"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                                border:
                                    Border.all(width: 2, color: Colors.black),
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
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Fruit();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/CoverPage%2Ffruits.png?alt=media&token=548254ec-fbf7-428d-aa57-a1b23beacf56",
                                    width: 80,
                                    height: 80,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 50)),
                                  Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      "Fruit (Basic)",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: HexColor("#461482"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
                      auth.currentUser.displayName.toString(),
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return UserScreen();
                  }));
                },
                icon: Icon(Icons.person),
                label: const Text(
                  "User Profile",
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
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return CreateFlashcardScreens();
                  }));
                },
                icon: Icon(Icons.book),
                label: const Text(
                  "Notebook",
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
