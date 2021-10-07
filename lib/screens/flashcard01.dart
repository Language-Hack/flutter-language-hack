import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/welcome.dart';

// Link to DB
final List data = [
  {
    'color': Colors.red,
  },
  {
    'color': Colors.green,
  },
  {
    'color': Colors.blue,
  }
];

class FlashCard01 extends StatefulWidget {
  @override
  _FlashCard01State createState() => _FlashCard01State();
}

class _FlashCard01State extends State<FlashCard01> {
  final auth = FirebaseAuth.instance;

  // Dynamically load cards from database
  List<Card> cards = [
    Card(
      data[0]['color'],
    ),
    Card(
      data[1]['color'],
    ),
    Card(
      data[2]['color'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Stack of cards that can be swiped. Set width, height, etc here.
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.green.shade300,
          )),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.7,
          // Important to keep as a stack to have overlay of cards.
          child: Stack(
            children: cards,
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
                    return WelcomeScreens();
                  }));
                },
                icon: Icon(Icons.card_membership),
                label: const Text(
                  "Flash-Card",
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

class Card extends StatelessWidget {
  // Made to distinguish cards
  // Add your own applicable data here
  final Color color;
  Card(this.color);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      // Set the swipable widget
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: color,
        ),
      ),

      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
