// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:math';

import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/userScores.dart';
import 'package:language_hack/screens/ListView/filter_local_list_page.dart';
import 'package:language_hack/screens/allLessons.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_color.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_fruit.dart';
import 'package:language_hack/screens/createFlashcard.dart';
import 'package:language_hack/screens/flashcardRoute/flashcardRoute.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/preTest.dart';
import 'package:language_hack/screens/testUserLevel.dart';
import 'package:language_hack/screens/user.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key key}) : super(key: key);
  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final auth = FirebaseAuth.instance;
  String level = '';
  String docId = '';
  int basicScore = 0;
  int intermediateScore = 0;
  int advanceScore = 0;
  UserScores allScores = UserScores(
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

  String recommendImage = '';
  String recommendName = '';
  String recommendLevel = '';
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

  @override
  void initState() {
    super.initState();
    readData();
    getDocs();
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
    basicScore = 9 - basic_recommend_name.length;
    intermediateScore = 10 - intermediate_recommend_name.length;
    advanceScore = 5 - advance_recommend_name.length;
    print("basic: ${basicScore}");
    print("intermediate: ${intermediateScore}");
    print("advance: ${advanceScore}");
    reccommendLesson();
  }

  String calculatePercent(int score, int num_question) {
    double percent = (score / num_question) * 100;
    String stringPercent = percent.toStringAsFixed(0) + "%";
    return stringPercent;
  }

  Future getDocs() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("level")
        .where("owner",
            isEqualTo: FirebaseAuth.instance.currentUser.displayName.toString())
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      level = querySnapshot.docs[i]['level'];
      docId = a.id;
      print(a.id);
      print("User Level: ${level}");
    }
  }

  void reccommendLesson() {
    Random random = new Random();
    if ((basicScore > intermediateScore) &&
        ((basicScore / 2) > advanceScore) &&
        (basic_recommend_name.isNotEmpty)) {
      // Basic
      int index = Random().nextInt(basic_recommend_page.length);
      route = basic_recommend_page[index];
      recommendImage = basic_recommend_image[index];
      recommendName = basic_recommend_name[index];
      recommendLevel = "Basic";
    } else if ((intermediateScore > basicScore) &&
        ((intermediateScore / 2) > advanceScore) &&
        (intermediate_recommend_page.isNotEmpty)) {
      // Intermediate
      int index = Random().nextInt(basic_page.length);
      route = intermediate_recommend_page[index];
      recommendImage = intermediate_recommend_image[index];
      recommendName = intermediate_recommend_name[index];
      recommendLevel = 'Intermediate';
    } else if ((advanceScore > (basicScore / 2)) &&
        (advanceScore > (intermediateScore / 2)) &&
        (advance_recommend_page.isNotEmpty)) {
      // Advance
      int index = Random().nextInt(basic_page.length);
      route = advance_recommend_page[index];
      recommendImage = advance_recommend_image[index];
      recommendName = advance_recommend_name[index];
      recommendLevel = 'Advance';
    } else {
      // Based on user level
      if (level == 'basic' && basic_recommend_name.isNotEmpty) {
        int index = Random().nextInt(basic_recommend_name.length);
        recommendName = basic_recommend_name[index];
        recommendImage = basic_recommend_image[index];
        route = basic_recommend_page[index];
        recommendLevel = 'Basic';
      } else if (level == 'intermediate' &&
          intermediate_recommend_name.isNotEmpty) {
        int index = Random().nextInt(intermediate_recommend_name.length);
        recommendName = intermediate_recommend_name[index];
        recommendImage = intermediate_recommend_image[index];
        route = intermediate_recommend_page[index];
        recommendLevel = 'Intermediate';
      } else if (level == 'advance' && advance_recommend_name.isNotEmpty) {
        int index = Random().nextInt(advance_recommend_name.length);
        recommendName = advance_recommend_name[index];
        recommendImage = advance_recommend_image[index];
        route = advance_recommend_page[index];
        recommendLevel = 'Advance';
      } else {
        int random = Random().nextInt(2);
        if (random == 0 && basic_recommend_name.isNotEmpty) {
          int index = Random().nextInt(basic_recommend_name.length);
          recommendName = basic_recommend_name[index];
          recommendImage = basic_recommend_image[index];
          route = basic_recommend_page[index];
          recommendLevel = 'Basic';
        } else if (random == 1 && intermediate_recommend_name.isNotEmpty) {
          int index = Random().nextInt(intermediate_recommend_name.length);
          recommendName = intermediate_recommend_name[index];
          recommendImage = intermediate_recommend_image[index];
          route = intermediate_recommend_page[index];
          recommendLevel = 'Intermediate';
        } else {
          int index = Random().nextInt(advance_recommend_name.length);
          recommendName = advance_recommend_name[index];
          recommendImage = advance_recommend_image[index];
          route = advance_recommend_page[index];
          recommendLevel = 'Advance';
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedDrawer(
      homePageXValue: 150,
      homePageYValue: 80,
      homePageAngle: -0.2,
      homePageSpeed: 250,
      shadowXValue: 122,
      shadowYValue: 110,
      shadowAngle: -0.275,
      shadowSpeed: 550,
      openIcon: Icon(Icons.menu, color: Color(0xFF1f186f)),
      closeIcon: Icon(Icons.arrow_back_ios, color: Color(0xFF1f186f)),
      shadowColor: Color(0xFF665BB2),
      backgroundGradient: LinearGradient(
        colors: [Color(0xFF4c41a3), HexColor("#461482")],
      ),
      menuPageContent: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 15),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/Logo%2Flogo.png?alt=media&token=75cfc4fa-1400-43ed-96d5-2b85ad733971",
                  width: MediaQuery.of(context).size.width * 0.4,
                  color: Colors.white,
                ),
                Row(
                  children: [
                    const Text(
                      "WEL",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "COME!",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue[200],
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      auth.currentUser.displayName.toString(),
                      style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return UserScreen();
                      }));
                    },
                    icon: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "User Profile",
                      style: TextStyle(color: Colors.white),
                    )),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return CreateFlashcardScreens();
                      }));
                    },
                    icon: const Icon(
                      Icons.book,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "User Notebook",
                      style: TextStyle(color: Colors.white),
                    )),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                const Divider(
                  color: Color(0xFF5950a0),
                  thickness: 2,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 5),
                ),
                TextButton.icon(
                    onPressed: () {
                      auth.signOut().then((value) => Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          })));
                    },
                    icon: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    label: const Text(
                      "logout",
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          )),
      homePageContent: Scaffold(
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
              automaticallyImplyLeading: false,
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
              ],
            )),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, left: 20),
                  child: Text(
                    "Find your favorite course here",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 22,
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
                        margin: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.39,
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
                                return CreateFlashcardScreens(); // Fix this
                              }));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/WelcomePage%2Fnotebook.png?alt=media&token=351bc3c1-8356-4ed0-85cd-b50e6276b244",
                                    width: 10,
                                    height: 80,
                                    errorBuilder: (context, error, stackTrace) {
                                  return Text(
                                    'Loading..',
                                    style: TextStyle(fontSize: 20),
                                  );
                                }),
                                const Padding(
                                    padding: EdgeInsets.only(top: 12)),
                                Text(
                                  "Notebook",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 19,
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
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.39,
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
                                return FilterLocalListPage();
                              }));
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Image.network(
                                      "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/WelcomePage%2FallLessons.png?alt=media&token=ca157928-c2c0-4370-9886-61b7717cc9f2",
                                      width: 10,
                                      height: 80, errorBuilder:
                                          (context, error, stackTrace) {
                                    return Text(
                                      'Loading..',
                                      style: TextStyle(fontSize: 20),
                                    );
                                  }),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 12)),
                                  Text(
                                    "All Lessons",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 19,
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
                  margin: EdgeInsets.only(top: 13, left: 20),
                  child: Text(
                    "Overall Completion",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 22,
                        color: HexColor("#461482"),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 20),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Center(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                center: Text(
                                  calculatePercent(basicScore, 9),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                      color: Colors.green),
                                ),
                                percent: basicScore / 9,
                                radius:
                                    MediaQuery.of(context).size.width * 0.25,
                                backgroundColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.butt,
                                lineWidth: 10,
                                progressColor: Colors.green,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                              ),
                              Text(
                                "Basic",
                                style: TextStyle(
                                    fontSize: 20.0 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: HexColor("#461482")),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Center(
                          child: Column(
                            children: [
                              CircularPercentIndicator(
                                center: Text(
                                  calculatePercent(intermediateScore, 10),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0 *
                                          MediaQuery.of(context)
                                              .textScaleFactor,
                                      color: Colors.green),
                                ),
                                percent: intermediateScore / 10,
                                radius:
                                    MediaQuery.of(context).size.width * 0.25,
                                backgroundColor: Colors.grey,
                                circularStrokeCap: CircularStrokeCap.butt,
                                lineWidth: 10,
                                progressColor: Colors.green,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                              ),
                              Text("Intermidiate",
                                  style: TextStyle(
                                      fontSize: 20.0 *
                                          MediaQuery.textScaleFactorOf(context),
                                      color: HexColor("#461482"))),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Column(
                          children: [
                            CircularPercentIndicator(
                              center: Text(
                                calculatePercent(advanceScore, 5),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0 *
                                        MediaQuery.of(context).textScaleFactor,
                                    color: Colors.green),
                              ),
                              percent: advanceScore / 5,
                              radius: MediaQuery.of(context).size.width * 0.25,
                              backgroundColor: Colors.grey,
                              circularStrokeCap: CircularStrokeCap.butt,
                              lineWidth: 10,
                              progressColor: Colors.green,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                            ),
                            Text(
                              "Advance",
                              style: TextStyle(
                                  fontSize: 20.0 *
                                      MediaQuery.of(context).textScaleFactor,
                                  color: HexColor("#461482")),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 17, left: 20),
                  child: Text(
                    "Recommended Lesson",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).textScaleFactor * 22,
                        color: HexColor("#461482"),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
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
                      margin: const EdgeInsets.fromLTRB(30, 16, 30, 5),
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
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return route;
                            }));
                          },
                          child: Row(
                            children: <Widget>[
                              Image.network(recommendImage,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
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
                                    padding: const EdgeInsets.only(
                                        top: 38, left: 20),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
