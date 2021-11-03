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
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/user.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key? key}) : super(key: key);

  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.amber.shade50,
            iconTheme: IconThemeData(color: Colors.black),
          )),
      body: Container(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  "Choose what to learn today?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
                      margin: const EdgeInsets.fromLTRB(25, 20, 0, 10),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.asset(
                                "assets/notebook.png",
                                width: 10,
                                height: 80,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              const Text(
                                "Notebook",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black),
                          borderRadius: BorderRadius.circular(25)),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.asset(
                                "assets/reading-book.png",
                                width: 10,
                                height: 80,
                              ),
                              const Padding(padding: EdgeInsets.only(top: 10)),
                              const Text(
                                "Lesson",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  "Recommended Lesson",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ///////////////////////////////////////////////////////////

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red.shade200,
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
                                  Image.asset(
                                    "assets/color.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  const Text(
                                    "Color (Basic)",
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        /////////////////////////////////////////////
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent.shade100,
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
                                  Image.asset(
                                    "assets/fruit.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  const Text(
                                    "Fruit (Basic)",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        /////////////////////////////////////////////////////////////////////////////

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.amber.shade50,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
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
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Family Member",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "(Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        /////////////////////////////////////////////////////////////////////////////
                        ///
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink.shade100,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Countries();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/countries.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 30)),
                                      const Text(
                                        "Countries",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "&",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "Nationalities",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "(Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade200,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Vegetables();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/vegetables.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Vegetables",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                      const Text(
                                        "(Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.green.shade100,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Places();
                                }));
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/places.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Places (Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple.shade100,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Days();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/days.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Days of the week",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Text(
                                        "(Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange.shade100,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Months();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/months.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Months of the Year",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                      const Text(
                                        "(Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink.shade50,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Verbs();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/verb.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Verbs (Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                          child: Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(20)),
                            width: 100,
                            height: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade100,
                                onPrimary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Flash_Adjectives();
                                }));
                              },
                              child: Row(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/adjectives.png",
                                    width: 130,
                                    height: 130,
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 14)),
                                  Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.only(top: 50)),
                                      const Text(
                                        "Adjectives (Basic)",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 17,
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

      // body: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/bg.png"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Form(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         Container(
      //           margin: EdgeInsets.only(top: 100, left: 20),
      //           child: (Text(
      //             auth.currentUser!.email.toString(),
      //             style: TextStyle(fontSize: 40, color: Colors.black),
      //             textAlign: TextAlign.left,
      //           )),
      //         ),
      //         Container(
      //           margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      //           child: SizedBox(
      //             height: 60,
      //             child: ElevatedButton.icon(
      //               style: ButtonStyle(
      //                   backgroundColor:
      //                       MaterialStateProperty.all<Color>(Colors.black)),
      //               label:
      //                   const Text("Log Out", style: TextStyle(fontSize: 20)),
      //               icon: Icon(null),
      //               onPressed: () {
      //                 auth.signOut().then((value) =>
      //                     Navigator.pushReplacement(context,
      //                         MaterialPageRoute(builder: (context) {
      //                       return HomeScreen();
      //                     })));
      //               },
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ));
    );
  }
}
