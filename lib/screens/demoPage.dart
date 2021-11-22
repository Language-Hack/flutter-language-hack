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
import 'package:language_hack/screens/basic_vocab/flash_card_adjectives.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_color.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_countries.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_day.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_family.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_fruit.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_months.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_vegetables.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_verbs.dart';
import 'package:language_hack/screens/createFlashcard.dart';
import 'package:language_hack/screens/flashcard01.dart';
import 'package:language_hack/screens/flashcardRoute/flashcardRoute.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/user.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoScreens extends StatefulWidget {
  final String level;
  const DemoScreens(this.level, {Key key}) : super(key: key);

  @override
  _DemoScreensScreensState createState() => _DemoScreensScreensState();
}

class _DemoScreensScreensState extends State<DemoScreens> {
  String recommendImage = '';
  String recommendName = '';
  String recommendLevel = '';
  Widget route;
  String docId = '';
  final auth = FirebaseAuth.instance;
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  BuildContext myContext;
  int basicScore = 0;
  int intermediateScore = 0;
  int advanceScore = 0;
  final String userDisplayname =
      FirebaseAuth.instance.currentUser.displayName.toString();

  @override
  void initState() {
    super.initState();
    reccommendLesson();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
          Duration(milliseconds: 200),
          () => ShowCaseWidget.of(myContext).startShowCase([
                keyOne,
                keyTwo,
                keyThree,
              ]));
    });
  }

  void reccommendLesson() {
    Random random = new Random();
    if (widget.level == 'basic') {
      int index = Random().nextInt(basic_name.length);
      recommendName = basic_name[index];
      recommendImage = basic_image[index];
      route = basic_page[index];
      recommendLevel = 'Basic';
    } else if (widget.level == 'intermediate') {
      int index = Random().nextInt(intermediate_name.length);
      recommendName = intermediate_name[index];
      recommendImage = intermediate_image[index];
      route = intermediate_page[index];
      recommendLevel = 'Intermediate';
    } else {
      int index = Random().nextInt(advance_name.length);
      recommendName = advance_name[index];
      recommendImage = advance_image[index];
      route = advance_page[index];
      recommendLevel = 'Advance';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
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
                    iconTheme: IconThemeData(color: HexColor("#461482")),
                    actions: [
                      Showcase(
                        key: keyThree,
                        description: "View Your Profile",
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return UserScreen();
                              }));
                            },
                            icon: Icon(Icons.person)),
                      ),
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
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22,
                              color: HexColor("#461482"),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return CreateFlashcardScreens();
                                    }));
                                  },
                                  child: Showcase(
                                    key: keyTwo,
                                    description:
                                        "Access Your Personal Notebook",
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/WelcomePage%2Fnotebook.png?alt=media&token=351bc3c1-8356-4ed0-85cd-b50e6276b244",
                                          width: 10,
                                          height: 80,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Text(
                                          "Notebook",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("#461482")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                  ),
                                  onPressed: () {
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return CreateFlashcardScreens();
                                    }));
                                  },
                                  child: Showcase(
                                    key: keyOne,
                                    description: "Access All the Lessons",
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Image.network(
                                          "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/WelcomePage%2FallLessons.png?alt=media&token=ca157928-c2c0-4370-9886-61b7717cc9f2",
                                          width: 10,
                                          height: 80,
                                        ),
                                        const Padding(
                                            padding: EdgeInsets.only(top: 10)),
                                        Text(
                                          "All Lessons",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("#461482")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
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
                                        '0 %',
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
                                        '0 %',
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
                                      '0 %',
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
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Recommended Lesson",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).textScaleFactor * 22,
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
                                    border: Border.all(
                                        width: 2, color: Colors.black),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color: HexColor("#461482"),
                                        blurRadius: 3,
                                        offset: Offset(3, 5),
                                      ),
                                    ],
                                  ),
                                  margin:
                                      const EdgeInsets.fromLTRB(30, 20, 30, 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.black),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: 110,
                                    height: 110,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.white,
                                        onPrimary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                      ),
                                      onPressed: () {
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return route;
                                        }));
                                      },
                                      child: Row(
                                        children: <Widget>[
                                          Image.network(recommendImage,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.3,
                                              height: 80, errorBuilder:
                                                  (context, error, stackTrace) {
                                            return Text(
                                              'Loading..',
                                              style: TextStyle(fontSize: 20),
                                            );
                                          }),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 30)),
                                          Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20, left: 20),
                                                child: Text(
                                                  recommendName,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: HexColor("#461482"),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, top: 20),
                                                child: Text(
                                                  "(${recommendLevel})",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: HexColor("#461482"),
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
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
