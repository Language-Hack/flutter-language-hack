import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/allLessons.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_color.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_family.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_fruit.dart';
import 'package:language_hack/screens/createFlashcard.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/user.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({Key key}) : super(key: key);

  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  final auth = FirebaseAuth.instance;

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
              Image.asset(
                "assets/logo.png",
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
                    "User Profile",
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
                  ))
            ],
          ),
        ),
      ),
      homePageContent: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              title: Image.asset(
                "assets/logo.png",
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
          color: Colors.amber.shade50,
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
                            borderRadius: BorderRadius.circular(25)),
                        margin: const EdgeInsets.fromLTRB(30, 20, 20, 10),
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
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.black),
                            borderRadius: BorderRadius.circular(25)),
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
                                return AllLessonScreen();
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
                                    Image.asset(
                                      "assets/colors.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 130,
                                    ),
                                    Padding(padding: EdgeInsets.only(top: 50)),
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
                                    Image.asset(
                                      "assets/fruits.png",
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 130,
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
                                  primary: Colors.white,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height: 130,
                                    ),
                                    Column(
                                      children: [
                                        const Padding(
                                            padding: EdgeInsets.only(top: 50)),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20),
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
      ),
    );
  }
}
