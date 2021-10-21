import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:language_hack/screens/welcome.dart';
import 'package:language_hack/screens/home.dart';

class Flash_Vegetables extends StatefulWidget {
  const Flash_Vegetables({Key? key}) : super(key: key);

  @override
  _Flash_VegetablesState createState() => _Flash_VegetablesState();
}

final List data = [
  {
    'color': Colors.red.shade200,
    'word': "beetroot",
    'picture': "assets/banana.png",
    'meaing': "บีทรูท",
    'example': "There is a beetroot on the table."
  },
  {
    'color': Colors.orange.shade200,
    'word': "cabbage",
    'picture': "assets/banana.png",
    'meaing': "กะหล่ำปลี",
    'example': "I like most vegetables but not cabbage."
  },
  {
    'color': Colors.yellow.shade200,
    'word': "carrot",
    'picture': "assets/banana.png",
    'meaing': "แครอท",
    'example': "She chopped some carrots for the soup."
  },
  {
    'color': Colors.green.shade200,
    'word': "corn",
    'picture': "assets/banana.png",
    'meaing': "ข้าวโพด",
    'example': "This corn is fresh."
  },
  {
    'color': Colors.blue.shade200,
    'word': "cucumber",
    'picture': "assets/banana.png",
    'meaing': "แตงกวา",
    'example': "He gave me a huge cucumber."
  },
  {
    'color': Colors.grey.shade200,
    'word': "mushroom",
    'picture': "assets/banana.png",
    'meaing': "เห็ด",
    'example': "This mushroom is poisonous."
  },
  {
    'color': Colors.grey.shade400,
    'word': "pepper",
    'picture': "assets/banana.png",
    'meaing': "พริกไทย",
    'example': "He put some pepper on his steak."
  },
  {
    'color': Colors.pink.shade200,
    'word': "potato",
    'picture': "assets/banana.png",
    'meaing': "มันฝรั่ง",
    'example': "My mother cooked the potatoes very well."
  },
  {
    'color': Colors.brown.shade200,
    'word': "pumpkin",
    'picture': "assets/banana.png",
    'meaing': "ฟักทอง",
    'example': "Halloween lantern is made from pumpkin."
  },
  {
    'color': Colors.purple.shade200,
    'word': "tomato",
    'picture': "assets/banana.png",
    'meaing': "มะเขือเทศ",
    'example': "I grow tomatoes."
  },
];

////////// this is the speaking function in this flashcard ///////////
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}

class _Flash_VegetablesState extends State<Flash_Vegetables> {
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
