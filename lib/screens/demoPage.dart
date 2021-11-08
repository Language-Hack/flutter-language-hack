// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
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
import 'package:language_hack/screens/flashcard01.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/user.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DemoScreens extends StatefulWidget {
  const DemoScreens({Key? key}) : super(key: key);

  @override
  _DemoScreensScreensState createState() => _DemoScreensScreensState();
}

class _DemoScreensScreensState extends State<DemoScreens> {
  final auth = FirebaseAuth.instance;
  final keyOne = GlobalKey();
  final keyTwo = GlobalKey();
  final keyThree = GlobalKey();
  late BuildContext myContext;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(
          Duration(milliseconds: 200),
          () => ShowCaseWidget.of(myContext)!.startShowCase([
                keyOne,
                keyTwo,
                keyThree,
              ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: Builder(
        builder: (context) {
          myContext = context;
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
                  backgroundColor: Colors.amber.shade100,
                  iconTheme: IconThemeData(color: Colors.black),
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
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Choose what to learn today?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 24,
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
                                  blurRadius: 4,
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
                                    return CreateFlashcardScreens();
                                  }));
                                },
                                child: Showcase(
                                  key: keyTwo,
                                  description: "Access Your Personal Notebook",
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor("#461482"),
                                  blurRadius: 4,
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
                                    return CreateFlashcardScreens();
                                  }));
                                },
                                child: Showcase(
                                  key: keyOne,
                                  description: "Access All the Lessons",
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        "Lesson",
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
                          // ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: Text(
                        "Recommended Lesson",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 24,
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
                                margin:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  width: 100,
                                  height: 150,
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
                                          MaterialPageRoute(builder: (context) {
                                        return Flash_Color();
                                      }));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/colors.png",
                                          width: 130,
                                          height: 130,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 50)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
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
                                margin:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  width: 100,
                                  height: 150,
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
                                          MaterialPageRoute(builder: (context) {
                                        return Flash_Fruit();
                                      }));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/fruits.png",
                                          width: 130,
                                          height: 130,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 50)),
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
                              Container(
                                margin:
                                    const EdgeInsets.fromLTRB(30, 20, 30, 5),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: Colors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  width: 100,
                                  height: 150,
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
                                          MaterialPageRoute(builder: (context) {
                                        return Flash_Family();
                                      }));
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Image.asset(
                                          "assets/family.png",
                                          width: 130,
                                          height: 130,
                                        ),
                                        Column(
                                          children: [
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 50)),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Text(
                                                "Family Member",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: HexColor("#461482"),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, top: 10),
                                              child: Text(
                                                "(Basic)",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: HexColor("#461482"),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
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
                              fit: BoxFit.fill,
                              image: AssetImage("assets/bg.png"))),
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
                            auth.currentUser!.displayName.toString(),
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
                        auth.signOut().then((value) =>
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
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
        },
      ),
    );
  }
}
