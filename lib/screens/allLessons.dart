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
import 'package:language_hack/screens/basic_vocab/flash_card_places.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_vegetables.dart';
import 'package:language_hack/screens/basic_vocab/flash_card_verbs.dart';
import 'package:language_hack/screens/createFlashcard.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_clothes.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_describing_food.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_feelings.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_football.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_halloween.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_music.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_office_equip.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_sports.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_typefood.dart';
import 'package:language_hack/screens/intermediate_vocab/flash_card_weather.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/user.dart';
import 'package:language_hack/screens/welcome.dart';

class AllLessonScreen extends StatefulWidget {
  const AllLessonScreen({Key? key}) : super(key: key);

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
                  FirebaseAuth.instance.currentUser!.displayName.toString())
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
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.asset(
              "assets/logo.png",
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
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Center(
                            child: Text(
                          "All Lessons",
                          style: TextStyle(
                              fontSize: 30, color: HexColor("#461482")),
                        )),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                Padding(
                                  padding: EdgeInsets.only(top: 50),
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.adjective_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Adjective (Basic)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.color_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Color (Basic)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.countries_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Countries (Basic)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.days_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Day (Basic)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.family_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.fruit_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
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
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Months();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/month_31.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.months_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Months (Basic)",
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
                      // Container(
                      //   margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //         border: Border.all(width: 2, color: Colors.black),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     width: 100,
                      //     height: 150,
                      //     child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         primary: Colors.white,
                      //         onPrimary: Colors.black,
                      //         shape: RoundedRectangleBorder(
                      //             borderRadius: BorderRadius.circular(20)),
                      //       ),
                      //       onPressed: () {
                      //         Navigator.pushReplacement(context,
                      //             MaterialPageRoute(builder: (context) {
                      //           return Flash_Places();
                      //         }));
                      //       },
                      //       child: Row(
                      //         children: <Widget>[
                      //           Image.asset(
                      //             "assets/place.png",
                      //             width: 130,
                      //             height: 130,
                      //           ),
                      //           Padding(padding: EdgeInsets.only(top: 50)),
                      //           Column(
                      //             children: [
                      //               Padding(
                      //                 padding: const EdgeInsets.only(
                      //                     top: 13, left: 170),
                      //                 child: Align(
                      //                   alignment: Alignment(1, -1),
                      //                   child: (allScores.place_score! > 0)
                      //                       ? Image.asset(
                      //                           "assets/checked.png",
                      //                           width: 30,
                      //                           height: 30,
                      //                         )
                      //                       : Padding(
                      //                           padding: const EdgeInsets.only(
                      //                               top: 25),
                      //                         ),
                      //                 ),
                      //               ),
                      //               const Padding(
                      //                   padding: EdgeInsets.only(top: 20)),
                      //               Padding(
                      //                 padding: const EdgeInsets.only(left: 20),
                      //                 child: Text(
                      //                   "Places (Basic)",
                      //                   textAlign: TextAlign.center,
                      //                   style: TextStyle(
                      //                     fontSize: 18,
                      //                     color: HexColor("#461482"),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Vegetables();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/vegetables_bucket.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.vegetable_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Vegetable (Basic)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Verbs();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/verbs_new.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.verbs_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Verbs (Basic)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Clothes();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/clothes.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.clothes_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Clothes",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_DeFood();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/foods.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.dbFood_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Describe Foods",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Feelings();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/emotions.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.feeling_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Feelings",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Football();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/football.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.football_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Football",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Halloween();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/halloween.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.halloween_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Halloween",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Music();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/musicInstrument.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.music_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Music Instruments",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_OfficeEquip();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/officeEquipment.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.office_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Office Equipments",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Sports();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/typeOfSports.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.sports_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Type of Sports",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_TypesFoods();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/typeOfFood.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.typeFood_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Type of Foods",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Weather();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/weather.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.weather_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Weather",
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
                                        "(Intermediate)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Environment();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/environment.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.environment_score! >
                                                0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Environment",
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
                                        "(Advance)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_IELTS();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/ielts.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.ielts_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "IELTS Vocabularies",
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
                                        "(Advance)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_PartOfCar();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/partOfCars.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.carPart_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Parts of a Car",
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
                                        "(Advance)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Toelf();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/toefl.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.toefl_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "TOEFL",
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
                                        "(Advance)",
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
                      Container(
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 2, color: Colors.black),
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
                                return Flash_Workshop();
                              }));
                            },
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  "assets/workshop.png",
                                  width: 130,
                                  height: 130,
                                ),
                                Padding(padding: EdgeInsets.only(top: 50)),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 170),
                                      child: Align(
                                        alignment: Alignment(1, -1),
                                        child: (allScores.workshop_score! > 0)
                                            ? Image.asset(
                                                "assets/checked.png",
                                                width: 30,
                                                height: 30,
                                              )
                                            : Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25),
                                              ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Text(
                                        "Workshop Tools",
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
                                        "(Advance)",
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
    );
  }
}
