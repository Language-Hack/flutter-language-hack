import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/welcome.dart';

class Flash_Football extends StatefulWidget {
  const Flash_Football({Key? key}) : super(key: key);

  @override
  _Flash_FootballState createState() => _Flash_FootballState();
}

final List data = [
  {
    'color': Colors.red.shade200,
    'word': "Penalty kick",
    'picture': "assets/banana.png",
    'meaing': "การเตะลูกโทษ",
    'example': "A penalty kick has been awarded to the United States."
  },
  {
    'color': Colors.orange.shade200,
    'word': "football players",
    'picture': "assets/banana.png",
    'meaing': "นักฟุตบอล",
    'example': "A football team consists of eleven players."
  },
  {
    'color': Colors.yellow.shade200,
    'word': "referee",
    'picture': "assets/banana.png",
    'meaing': "ผู้ตัดสิน",
    'example': "A referee should not favor either side."
  },
  {
    'color': Colors.green.shade200,
    'word': "Goalkeeper",
    'picture': "assets/banana.png",
    'meaing': "ผู้รักษาประตู",
    'example': "There is only one goalkeeper on the field for each team."
  },
  {
    'color': Colors.blue.shade200,
    'word': "Red card",
    'picture': "assets/banana.png",
    'meaing': "ใบแดง",
    'example': "A player gets a red card."
  },
  {
    'color': Colors.grey.shade200,
    'word': "Yellow card",
    'picture': "assets/banana.png",
    'meaing': "ใบเหลือง",
    'example': "A player gets a yellow card."
  },
  {
    'color': Colors.grey.shade400,
    'word': "Bench",
    'picture': "assets/banana.png",
    'meaing': "ที่นั่งสำหรับนักกีฬาตัวสำรอง",
    'example': "He is still sitting on the bench."
  },
  {
    'color': Colors.pink.shade200,
    'word': "Substitute",
    'picture': "assets/banana.png",
    'meaing': "สับเปลี่ยน",
    'example': "He substituted for the injured player."
  },
  {
    'color': Colors.brown.shade200,
    'word': "Manager",
    'picture': "assets/banana.png",
    'meaing': "ผู้จัดการทีม",
    'example': "He is a good manager."
  },
  {
    'color': Colors.purple.shade200,
    'word': "Linesman",
    'picture': "assets/banana.png",
    'meaing': "ผู้กำกับเส้น",
    'example': "Linesman is an official who assists a referee."
  },
];

////////// this is the speaking function in this flashcard ///////////
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}

class _Flash_FootballState extends State<Flash_Football> {
  final auth = FirebaseAuth.instance;

  List<Card> cards = [
    Card(
      data[0]['color'],
      data[0]['word'],
      data[0]['picture'],
      data[0]['meaing'],
      data[0]['example'],
    ),
    Card(
      data[1]['color'],
      data[1]['word'],
      data[1]['picture'],
      data[1]['meaing'],
      data[1]['example'],
    ),
    Card(
      data[2]['color'],
      data[2]['word'],
      data[2]['picture'],
      data[2]['meaing'],
      data[2]['example'],
    ),
    Card(
      data[3]['color'],
      data[3]['word'],
      data[3]['picture'],
      data[3]['meaing'],
      data[3]['example'],
    ),
    Card(
      data[4]['color'],
      data[4]['word'],
      data[4]['picture'],
      data[4]['meaing'],
      data[4]['example'],
    ),
    Card(
      data[5]['color'],
      data[5]['word'],
      data[5]['picture'],
      data[5]['meaing'],
      data[5]['example'],
    ),
    Card(
      data[6]['color'],
      data[6]['word'],
      data[6]['picture'],
      data[6]['meaing'],
      data[6]['example'],
    ),
    Card(
      data[7]['color'],
      data[7]['word'],
      data[7]['picture'],
      data[7]['meaing'],
      data[7]['example'],
    ),
    Card(
      data[8]['color'],
      data[8]['word'],
      data[8]['picture'],
      data[8]['meaing'],
      data[8]['example'],
    ),
    Card(
      data[9]['color'],
      data[9]['word'],
      data[9]['picture'],
      data[9]['meaing'],
      data[9]['example'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            backgroundColor: Colors.green.shade300,
          )),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              scale: 9,
              alignment: Alignment.centerRight,
            ),
            Container(
              padding: EdgeInsets.only(top: 5),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3))
              ]),
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              // Important to keep as a stack to have overlay of cards.
              child: Stack(
                children: cards,
              ),
            ),
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
  String word = "";
  String picture;
  String example = "";
  String meaing = "";
  Card(
    this.color,
    this.word,
    this.picture,
    this.meaing,
    this.example,
  );

  @override
  Widget build(BuildContext context) {
    return Swipable(
      // Set the swipable widget

      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: color,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                word,
                style: TextStyle(fontSize: 50),
                textAlign: TextAlign.center,
              ),
              IconButton(
                onPressed: () => speak(word),
                icon: Icon(Icons.volume_up),
                iconSize: 45,
              ),
              // ElevatedButton.icon(
              //     onPressed: () => speak(word),
              //     icon: Icon(Icons.volume_up),
              //     label: Text("")),
              Image.asset(
                picture,
                scale: 4,
              ),
              Text(
                meaing,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              const Text(
                "Example Sentence:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text(
                example,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
