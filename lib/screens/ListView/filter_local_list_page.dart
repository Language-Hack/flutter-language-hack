import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/book.dart';
import 'package:language_hack/model/userScores.dart';
import 'package:language_hack/screens/ListView/advance_data.dart';
import 'package:language_hack/screens/ListView/basic_data.dart';
import 'package:language_hack/screens/ListView/search_widget.dart';

import '../createFlashcard.dart';
import '../home.dart';
import '../welcome.dart';
import 'intermediate_data.dart';

class FilterLocalListPage extends StatefulWidget {
  @override
  FilterLocalListPageState createState() => FilterLocalListPageState();
}

class FilterLocalListPageState extends State<FilterLocalListPage> {
  final auth = FirebaseAuth.instance;
  bool pressBasic = false;
  bool pressIntermediate = false;
  bool pressAdvance = false;
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
  List<Book> books;
  String query = '';

  @override
  void initState() {
    super.initState();
    books = allBooks;
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
        updateScore();
      });
    });
  }

  void updateScore() {
    books[0].score = allScores.adjective_score;
    books[1].score = allScores.color_score;
    books[2].score = allScores.countries_score;
    books[3].score = allScores.days_score;
    books[4].score = allScores.family_score;
    books[5].score = allScores.fruit_score;
    books[6].score = allScores.months_score;
    books[7].score = allScores.vegetable_score;
    books[8].score = allScores.verbs_score;
    books[9].score = allScores.clothes_score;
    books[10].score = allScores.dbFood_score;
    books[11].score = allScores.feeling_score;
    books[12].score = allScores.typeFood_score;
    books[13].score = allScores.football_score;
    books[14].score = allScores.halloween_score;
    books[15].score = allScores.music_score;
    books[16].score = allScores.office_score;
    books[17].score = allScores.sports_score;
    books[18].score = allScores.weather_score;
    books[19].score = allScores.environment_score;
    books[20].score = allScores.ielts_score;
    books[21].score = allScores.carPart_score;
    books[22].score = allScores.toefl_score;
    books[23].score = allScores.workshop_score;
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
        padding: const EdgeInsets.only(top: 100, left: 15),
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
                  ))
            ],
          ),
        ),
      ),
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
            )),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 40,
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: pressBasic
                        ? Colors.amber.shade200
                        : Colors.amber.shade100,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: Text("Basic", style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      setState(() {
                        pressBasic = !pressBasic;
                        pressIntermediate = false;
                        pressAdvance = false;
                      });
                      if (pressBasic == true) {
                        searchBasic();
                      } else {
                        searchAll();
                      }
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.33,
                  height: 40,
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: pressIntermediate
                        ? Colors.blue.shade300
                        : Colors.blue.shade200,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child:
                        Text("Intermediate", style: TextStyle(fontSize: 14.5)),
                    onPressed: () {
                      setState(() {
                        pressBasic = false;
                        pressIntermediate = !pressIntermediate;
                        pressAdvance = false;
                      });
                      if (pressIntermediate == true) {
                        searchIntermediate();
                      } else {
                        searchAll();
                      }
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: 40,
                  child: RaisedButton(
                    textColor: Colors.black,
                    color: pressAdvance
                        ? Colors.red.shade300
                        : Colors.red.shade200,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    child: Text("Advance", style: TextStyle(fontSize: 14.5)),
                    onPressed: () {
                      setState(() {
                        pressBasic = false;
                        pressIntermediate = false;
                        pressAdvance = !pressAdvance;
                      });
                      if (pressAdvance == true) {
                        searchAdvanced();
                      } else {
                        searchAll();
                      }
                    },
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            Expanded(
              child: ListView.builder(
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return buildBook(book);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Category',
        onChanged: searchBook,
      );

  Widget buildBook(Book book) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: book.level == '(Basic)'
          ? Colors.amber.shade100
          : book.level == '(Intermediate)'
              ? Colors.blue.shade200
              : Colors.red.shade200,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
            leading: Image.network(
              book.urlImage,
              width: 100,
              height: 100,
            ),
            title: Text(
              book.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20 * MediaQuery.of(context).textScaleFactor),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Text(
                book.level,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15 * MediaQuery.of(context).textScaleFactor),
              ),
            ),
            trailing: book.score > 0
                ? Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/Flashcards%2Freward.png?alt=media&token=92def8cb-dabd-4d79-9012-c0cab6c8e0cc',
                    width: 35,
                    height: 35,
                  )
                : null,
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return book.screen;
                }))),
      ),
    );
  }

  void searchBook(String query) {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.level.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  void searchBasic() {
    final books = allBooks.where((book) {
      final authorLower = book.level.toLowerCase();

      return authorLower.contains('basic');
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  void searchIntermediate() {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.level.toLowerCase();

      return authorLower.contains('intermediate');
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  void searchAdvanced() {
    final books = allBooks.where((book) {
      final titleLower = book.title.toLowerCase();
      final authorLower = book.level.toLowerCase();

      return authorLower.contains('advance');
    }).toList();

    setState(() {
      this.query = query;
      this.books = books;
    });
  }

  void searchAll() {
    final books = allBooks.toList();

    setState(() {
      this.books = books;
    });
  }
}
