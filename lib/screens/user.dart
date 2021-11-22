import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/createFlashcard.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:language_hack/model/userScores.dart';
import 'package:language_hack/screens/flashcardRoute/flashcardRoute.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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
    if (allScores.adjective_score == 0) {
      basic_recommend_page.add(basic_page[0]);
      basic_recommend_image.add(basic_image[0]);
      basic_recommend_name.add(basic_name[0]);
    }
    if (allScores.color_score == 0) {
      basic_recommend_page.add(basic_page[1]);
      basic_recommend_image.add(basic_image[1]);
      basic_recommend_name.add(basic_name[1]);
    }
    if (allScores.countries_score == 0) {
      basic_recommend_page.add(basic_page[2]);
      basic_recommend_image.add(basic_image[2]);
      basic_recommend_name.add(basic_name[2]);
    }
    if (allScores.days_score == 0) {
      basic_recommend_page.add(basic_page[3]);
      basic_recommend_image.add(basic_image[3]);
      basic_recommend_name.add(basic_name[3]);
    }
    if (allScores.family_score == 0) {
      basic_recommend_page.add(basic_page[4]);
      basic_recommend_image.add(basic_image[4]);
      basic_recommend_name.add(basic_name[4]);
    }
    if (allScores.fruit_score == 0) {
      basic_recommend_page.add(basic_page[5]);
      basic_recommend_image.add(basic_image[5]);
      basic_recommend_name.add(basic_name[5]);
    }
    if (allScores.months_score == 0) {
      basic_recommend_page.add(basic_page[6]);
      basic_recommend_image.add(basic_image[6]);
      basic_recommend_name.add(basic_name[6]);
    }
    if (allScores.vegetable_score == 0) {
      basic_recommend_page.add(basic_page[7]);
      basic_recommend_image.add(basic_image[7]);
      basic_recommend_name.add(basic_name[7]);
    }
    if (allScores.verbs_score == 0) {
      basic_recommend_page.add(basic_page[8]);
      basic_recommend_image.add(basic_image[8]);
      basic_recommend_name.add(basic_name[8]);
    }
    if (allScores.clothes_score == 0) {
      intermediate_recommend_page.add(intermediate_page[0]);
      intermediate_recommend_image.add(intermediate_image[0]);
      intermediate_recommend_name.add(intermediate_name[0]);
    }
    if (allScores.dbFood_score == 0) {
      intermediate_recommend_page.add(intermediate_page[1]);
      intermediate_recommend_image.add(intermediate_image[1]);
      intermediate_recommend_name.add(intermediate_name[1]);
    }
    if (allScores.feeling_score == 0) {
      intermediate_recommend_page.add(intermediate_page[2]);
      intermediate_recommend_image.add(intermediate_image[2]);
      intermediate_recommend_name.add(intermediate_name[2]);
    }
    if (allScores.typeFood_score == 0) {
      intermediate_recommend_page.add(intermediate_page[3]);
      intermediate_recommend_image.add(intermediate_image[3]);
      intermediate_recommend_name.add(intermediate_name[3]);
    }
    if (allScores.football_score == 0) {
      intermediate_recommend_page.add(intermediate_page[4]);
      intermediate_recommend_image.add(intermediate_image[4]);
      intermediate_recommend_name.add(intermediate_name[4]);
    }
    if (allScores.halloween_score == 0) {
      intermediate_recommend_page.add(intermediate_page[5]);
      intermediate_recommend_image.add(intermediate_image[5]);
      intermediate_recommend_name.add(intermediate_name[5]);
    }
    if (allScores.music_score == 0) {
      intermediate_recommend_page.add(intermediate_page[6]);
      intermediate_recommend_image.add(intermediate_image[6]);
      intermediate_recommend_name.add(intermediate_name[6]);
    }
    if (allScores.office_score == 0) {
      intermediate_recommend_page.add(intermediate_page[7]);
      intermediate_recommend_image.add(intermediate_image[7]);
      intermediate_recommend_name.add(intermediate_name[7]);
    }
    if (allScores.sports_score == 0) {
      intermediate_recommend_page.add(intermediate_page[8]);
      intermediate_recommend_image.add(intermediate_image[8]);
      intermediate_recommend_name.add(intermediate_name[8]);
    }
    if (allScores.weather_score == 0) {
      intermediate_recommend_page.add(intermediate_page[9]);
      intermediate_recommend_image.add(intermediate_image[9]);
      intermediate_recommend_name.add(intermediate_name[9]);
    }
    if (allScores.environment_score == 0) {
      advance_recommend_page.add(advance_page[0]);
      advance_recommend_image.add(advance_image[0]);
      advance_recommend_name.add(advance_name[0]);
    }
    if (allScores.ielts_score == 0) {
      advance_recommend_page.add(advance_page[1]);
      advance_recommend_image.add(advance_image[1]);
      advance_recommend_name.add(advance_name[1]);
    }
    if (allScores.carPart_score == 0) {
      advance_recommend_page.add(advance_page[2]);
      advance_recommend_image.add(advance_image[2]);
      advance_recommend_name.add(advance_name[2]);
    }
    if (allScores.toefl_score == 0) {
      advance_recommend_page.add(advance_page[3]);
      advance_recommend_image.add(advance_image[3]);
      advance_recommend_name.add(advance_name[3]);
    }
    if (allScores.workshop_score == 0) {
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
                          return WelcomeScreens();
                        }));
                      },
                      icon: const Icon(
                        Icons.dashboard,
                        color: Colors.white,
                      ),
                      label: const Text(
                        "Dashboard",
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
                        auth.signOut().then((value) =>
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
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
                  iconTheme: IconThemeData(color: Colors.black),
                )),
            body: Container(
              child: Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30, left: 20),
                        child: Center(
                          child: Text(
                            "User information",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 30,
                                color: HexColor("#461482"),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: Text(
                          "Display name:",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22,
                              color: HexColor("#461482"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        height: 50,
                        width: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#461482"),
                                blurRadius: 3,
                                offset: Offset(3, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(13),
                            child: Text(
                              auth.currentUser.displayName.toString(),
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 20, right: 20),
                        child: Text(
                          "Email address:",
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22,
                              color: HexColor("#461482"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        height: 50,
                        width: 50,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor("#461482"),
                                blurRadius: 3,
                                offset: Offset(3, 5),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(13),
                            child: Text(
                              auth.currentUser.email.toString(),
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 25, left: 20),
                        child: Text(
                          "Overall Completion",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22,
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
                                          MediaQuery.of(context).size.width *
                                              0.25,
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
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
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
                                          MediaQuery.of(context).size.width *
                                              0.25,
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
                                                MediaQuery.textScaleFactorOf(
                                                    context),
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
                                              MediaQuery.of(context)
                                                  .textScaleFactor,
                                          color: Colors.green),
                                    ),
                                    percent: advanceScore / 5,
                                    radius: MediaQuery.of(context).size.width *
                                        0.25,
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
                                            MediaQuery.of(context)
                                                .textScaleFactor,
                                        color: HexColor("#461482")),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            )));
  }
}
