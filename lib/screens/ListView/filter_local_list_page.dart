import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/book.dart';
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
  List<Book> books;
  List<Book> books2;
  List<Book> books3;
  String query = '';

  @override
  void initState() {
    super.initState();

    books = allBooks;
    books2 = allBooks2;
    books3 = allBooks3;
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
        hintText: 'Vocabulary',
        onChanged: searchBook,
      );

  Widget buildBook(Book book) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.amber.shade100,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
            leading: Image.network(
              book.urlImage,
              // fit: BoxFit.fill,
              width: 100,
              height: 100,
            ),
            title: Text(book.title),
            subtitle: Text(book.level),
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
}
