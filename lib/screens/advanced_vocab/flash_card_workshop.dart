import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/welcome.dart';

class Flash_Workshop extends StatefulWidget {
  const Flash_Workshop({Key? key}) : super(key: key);

  @override
  _Flash_WorkshopState createState() => _Flash_WorkshopState();
}

final List data = [
  {
    'color': Colors.red.shade200,
    'word': "Hacksaw",
    'picture': "assets/banana.png",
    'meaing': "เลื่อยตัดโลหะ",
    'example': "I have hacksaw in the trunk of my car."
  },
  {
    'color': Colors.orange.shade200,
    'word': "Hand drill",
    'picture': "assets/banana.png",
    'meaing': "สว่านมือ",
    'example': "Hand drill is a very good tool."
  },
  {
    'color': Colors.yellow.shade200,
    'word': "Wood",
    'picture': "assets/banana.png",
    'meaing': "ไม้",
    'example': "Birds were singing in the woods."
  },
  {
    'color': Colors.green.shade200,
    'word': "Ladder",
    'picture': "assets/banana.png",
    'meaing': "บันได",
    'example': "He placed the ladder against the fence."
  },
  {
    'color': Colors.blue.shade200,
    'word': "Shovel",
    'picture': "assets/banana.png",
    'meaing': "พลั่ว",
    'example': "They were buying shovels."
  },
  {
    'color': Colors.grey.shade200,
    'word': "Toolbox",
    'picture': "assets/banana.png",
    'meaing': "กล่องเครื่องมือ",
    'example': "He's getting the toolbox in his office."
  },
];

////////// this is the speaking function in this flashcard ///////////
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}

class _Flash_WorkshopState extends State<Flash_Workshop> {
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
