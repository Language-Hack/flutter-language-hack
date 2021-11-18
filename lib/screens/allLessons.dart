import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/userScores.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_environment.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_ielts.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_parts_of_car.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_toefl.dart';
import 'package:language_hack/screens/advanced_vocab/flash_card_workshop.dart';
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
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_clothes.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_describing_food.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_feelings.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_foodtype.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_football.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_halloween.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_music.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_office_equip.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_sports.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_foodtype.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_weather.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/user.dart';
import 'package:language_hack/screens/welcome.dart';

class AllLessonScreen extends StatefulWidget {
  const AllLessonScreen({Key key}) : super(key: key);

  @override
  _AllLessonScreenScreenState createState() => _AllLessonScreenScreenState();
}

class _AllLessonScreenScreenState extends State<AllLessonScreen> {
  final auth = FirebaseAuth.instance;
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

  final List allLessons = [
    {"name": "Adjective", "level": "Basic", "picture": "", "score": false},
  ];

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
        }
      });
    });
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
            child: Column(
              children: <Widget>[
                Text(
                  "All lessons",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          )),
    );
  }
}
