import 'dart:async';

import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/welcome.dart';
import 'package:language_hack/screens/home.dart';

import '../user.dart';

class Flash_Countries extends StatefulWidget {
  const Flash_Countries({Key key}) : super(key: key);

  @override
  _Flash_CountriesState createState() => _Flash_CountriesState();
}

final List data = [
  {
    'color': Colors.red.shade200,
    'word': "Argentina",
    'picture': "assets/Countries/1.png",
    'meaning': "ประเทศอาร์เจนตินา",
    'example': "Lionel Messi comes from Argentina."
  },
  {
    'color': Colors.orange.shade200,
    'word': "Australia",
    'picture': "assets/Countries/2.png",
    'meaning': "ประเทศออสเตรเลีย",
    'example': "Australia exports a lot of wool."
  },
  {
    'color': Colors.yellow.shade200,
    'word': "Belgium",
    'picture': "assets/Countries/3.png",
    'meaning': "ประเทศเบลเยียม",
    'example': "Belgium is a country in Western Europe."
  },
  {
    'color': Colors.green.shade200,
    'word': "China",
    'picture': "assets/Countries/4.png",
    'meaning': "ประเทศจีน",
    'example': "China is the largest country in Asia."
  },
  {
    'color': Colors.blue.shade200,
    'word': "England",
    'picture': "assets/Countries/5.png",
    'meaning': "ประเทศอังกฤษ",
    'example': "England is a country that is part of the United Kingdom."
  },
  {
    'color': Colors.grey.shade200,
    'word': "France",
    'picture': "assets/Countries/6.png",
    'meaning': "ประเทศฝรั่งเศส",
    'example': "France is in western Europe."
  },
  {
    'color': Colors.grey.shade400,
    'word': "India",
    'picture': "assets/Countries/7.png",
    'meaning': "ประเทศอินเดีย",
    'example': "Buddhism had its beginnings in India."
  },
  {
    'color': Colors.pink.shade200,
    'word': "Japan",
    'picture': "assets/Countries/8.png",
    'meaning': "ประเทศญี่ปุ่น",
    'example': "Japan is an island country in East Asia."
  },
  {
    'color': Colors.brown.shade200,
    'word': "Malaysia",
    'picture': "assets/Countries/9.png",
    'meaning': "ประเทศมาเลเซีย",
    'example': "Malaysia is a country in Southeast Asia."
  },
  {
    'color': Colors.purple.shade200,
    'word': "Thailand",
    'picture': "assets/Countries/10.png",
    'meaning': "ประเทศไทย",
    'example': "I live in Thailand."
  },
];

////////// this is the speaking function in this flashcard ///////////
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}

List<Card> cards = [
  Card(
    data[0]['color'],
    data[0]['word'],
    data[0]['picture'],
    data[0]['meaning'],
    data[0]['example'],
  ),
  Card(
    data[1]['color'],
    data[1]['word'],
    data[1]['picture'],
    data[1]['meaning'],
    data[1]['example'],
  ),
  Card(
    data[2]['color'],
    data[2]['word'],
    data[2]['picture'],
    data[2]['meaning'],
    data[2]['example'],
  ),
  Card(
    data[3]['color'],
    data[3]['word'],
    data[3]['picture'],
    data[3]['meaning'],
    data[3]['example'],
  ),
  Card(
    data[4]['color'],
    data[4]['word'],
    data[4]['picture'],
    data[4]['meaning'],
    data[4]['example'],
  ),
  Card(
    data[5]['color'],
    data[5]['word'],
    data[5]['picture'],
    data[5]['meaning'],
    data[5]['example'],
  ),
  Card(
    data[6]['color'],
    data[6]['word'],
    data[6]['picture'],
    data[6]['meaning'],
    data[6]['example'],
  ),
  Card(
    data[7]['color'],
    data[7]['word'],
    data[7]['picture'],
    data[7]['meaning'],
    data[7]['example'],
  ),
  Card(
    data[8]['color'],
    data[8]['word'],
    data[8]['picture'],
    data[8]['meaning'],
    data[8]['example'],
  ),
  Card(
    data[9]['color'],
    data[9]['word'],
    data[9]['picture'],
    data[9]['meaning'],
    data[9]['example'],
  ),
];

List<Card> instant_cards = [
  Card(
    data[0]['color'],
    data[0]['word'],
    data[0]['picture'],
    data[0]['meaning'],
    data[0]['example'],
  ),
  Card(
    data[1]['color'],
    data[1]['word'],
    data[1]['picture'],
    data[1]['meaning'],
    data[1]['example'],
  ),
  Card(
    data[2]['color'],
    data[2]['word'],
    data[2]['picture'],
    data[2]['meaning'],
    data[2]['example'],
  ),
  Card(
    data[3]['color'],
    data[3]['word'],
    data[3]['picture'],
    data[3]['meaning'],
    data[3]['example'],
  ),
  Card(
    data[4]['color'],
    data[4]['word'],
    data[4]['picture'],
    data[4]['meaning'],
    data[4]['example'],
  ),
  Card(
    data[5]['color'],
    data[5]['word'],
    data[5]['picture'],
    data[5]['meaning'],
    data[5]['example'],
  ),
  Card(
    data[6]['color'],
    data[6]['word'],
    data[6]['picture'],
    data[6]['meaning'],
    data[6]['example'],
  ),
  Card(
    data[7]['color'],
    data[7]['word'],
    data[7]['picture'],
    data[7]['meaning'],
    data[7]['example'],
  ),
  Card(
    data[8]['color'],
    data[8]['word'],
    data[8]['picture'],
    data[8]['meaning'],
    data[8]['example'],
  ),
  Card(
    data[9]['color'],
    data[9]['word'],
    data[9]['picture'],
    data[9]['meaning'],
    data[9]['example'],
  ),
];

class _Flash_CountriesState extends State<Flash_Countries> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.asset("assets/logo.png",
                width: 110, height: 110, color: HexColor("#461482")),
            backgroundColor: Colors.amber.shade100,
            iconTheme: IconThemeData(color: HexColor("#461482")),
            automaticallyImplyLeading: false,
          )),
      body: Center(
          child: Stack(
        children: [
          ShowResult(),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              Container(
                padding: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.7,
                // Important to keep as a stack to have overlay of cards.
                child: Stack(
                  children: cards,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
            ],
          ),
        ],
      )),
    );
  }
}

Widget messageCongratualation() {
  return Text(
    "Congratulations!!",
    style: TextStyle(
        fontSize: 30, color: HexColor("#461482"), fontWeight: FontWeight.bold),
  );
}

Widget messageNot() {
  return const Text(
    "Try Again!!",
    style:
        TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
  );
}

Widget learnAll() {
  return Text(
    "You have learned all the",
    style: TextStyle(
        fontSize: 20, color: HexColor("#461482"), fontWeight: FontWeight.bold),
  );
}

Widget notlearnAll() {
  return const Text(
    "You still have to learn",
    style:
        TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
  );
}

Widget flashcards() {
  return Text(
    "flashcards",
    style: TextStyle(
        fontSize: 20, color: HexColor("#461482"), fontWeight: FontWeight.bold),
  );
}

Widget someFlashcards() {
  return Text(
    cards.length.toString() + "  flashcards",
    style:
        TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
  );
}

Widget ready() {
  return Text(
    "Ready for a quiz?",
    style: TextStyle(
        fontSize: 20, color: HexColor("#461482"), fontWeight: FontWeight.bold),
  );
}

Widget notready() {
  return const Text(
    "Try to learn those words.",
    style:
        TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.bold),
  );
}

Widget quizButton() {
  return SizedBox(
    width: 150,
    height: 50,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: HexColor("#461482"),
        side: BorderSide(width: 2, color: Colors.black),
      ),
      icon: Icon(Icons.dashboard),
      label: Text("Quiz", style: TextStyle(fontSize: 15)),
      onPressed: () {},
    ),
  );
}

Widget tryButton(context) {
  return SizedBox(
    width: 150,
    height: 50,
    child: ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.red,
        side: BorderSide(width: 2, color: Colors.black),
      ),
      icon: Icon(Icons.login),
      label: Text("Try Again", style: TextStyle(fontSize: 15)),
      onPressed: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => Flash_Countries()));
      },
    ),
  );
}

Widget cancelButton(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(shape: CircleBorder(), primary: Colors.red),
    child: Container(
        width: 70,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Image.asset("assets/rejected.png")),
    onPressed: () {
      cards.clear();
      cards.addAll(instant_cards);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreens();
      }));
    },
  );
}

Widget swipeLeft() {
  return Column(
    children: [
      Image.asset(
        "assets/swipeLeft.png",
        scale: 11,
      ),
      const Padding(padding: EdgeInsets.only(top: 5)),
      Text("I can't remember"),
    ],
  );
}

Widget swipeRight() {
  return Column(
    children: [
      Image.asset(
        "assets/swipeRight.png",
        scale: 11,
      ),
      const Padding(padding: EdgeInsets.only(top: 5)),
      Text("I can Remember"),
    ],
  );
}

Widget showBottom(BuildContext context) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      swipeLeft(),
      const SizedBox(
        width: 5,
      ),
      cancelButton(context),
      const SizedBox(
        width: 5,
      ),
      swipeRight()
    ],
  );
}

class Card extends StatelessWidget {
  // Made to distinguish cards
  // Add your own applicable data here
  final Color color;
  String word = "";
  String picture;
  String example = "";
  String meaning = "";
  bool showDisplay = false;
  String text = '';

  Card(
    this.color,
    this.word,
    this.picture,
    this.meaning,
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
              border: Border.all(color: HexColor("#461482"), width: 3.0),
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                word,
                style: TextStyle(fontSize: 50, color: HexColor("#461482")),
                textAlign: TextAlign.center,
              ),
              IconButton(
                  onPressed: () => speak(word),
                  icon: Icon(Icons.volume_up),
                  iconSize: 45,
                  color: HexColor("#461482")),
              const Padding(padding: EdgeInsets.only(top: 25)),
              Image.asset(
                picture,
                height: MediaQuery.of(context).size.height * 0.2,
                width: 100,
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              Text(
                meaning,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#461482")),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text(
                "Example Sentence:",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#461482")),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Text(
                example,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: HexColor("#461482")),
              ),
            ],
          )
        ],
      ),

      onSwipeRight: (finalPosition) {
        CherryToast(
          title: word,
          description: "I can remember",
          descriptionStyle: TextStyle(color: Colors.green),
          icon: Icons.cancel,
          themeColor: Colors.green,
          animationDuration: Duration(milliseconds: 500),
          toastDuration: Duration(milliseconds: 1000),
          toastPosition: POSITION.TOP,
          animationType: ANIMATION_TYPE.FROM_RIGHT,
          autoDismiss: true,
        ).show(context);
        cards.removeLast();
        print("This is cards");
        print(cards);
      },

      onSwipeLeft: (finalPosition) {
        CherryToast(
          title: word,
          description: "I can't remember",
          descriptionStyle: TextStyle(color: Colors.red),
          icon: Icons.cancel,
          themeColor: Colors.red,
          animationDuration: Duration(milliseconds: 500),
          toastDuration: Duration(milliseconds: 1000),
          toastPosition: POSITION.BOTTOM,
          animationType: ANIMATION_TYPE.FROM_LEFT,
          autoDismiss: true,
        ).show(context);
        cards.insert(
            0,
            Card(
              this.color,
              this.word,
              this.picture,
              this.meaning,
              this.example,
            ));
        cards.removeLast();
        print("This is cards");
        print(cards);
      },
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}

class ShowResult extends StatefulWidget {
  const ShowResult({Key key}) : super(key: key);

  @override
  _ShowResultState createState() => _ShowResultState();
}

class _ShowResultState extends State<ShowResult> {
  String _now;
  Timer _everySecond;

  @override
  void initState() {
    super.initState();

    // sets first value
    _now = DateTime.now().second.toString();

    // defines a timer
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        _now = DateTime.now().second.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 40)),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(color: Colors.black, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30)),
                if (cards.isEmpty) ...[
                  messageCongratualation()
                ] else ...[
                  messageNot()
                ],
                Padding(padding: EdgeInsets.only(top: 30)),
                if (cards.isEmpty) ...[learnAll()] else ...[notlearnAll()],
                Padding(padding: EdgeInsets.only(top: 30)),
                if (cards.isEmpty) ...[flashcards()] else ...[someFlashcards()],
                Padding(padding: EdgeInsets.only(top: 30)),
                if (cards.isEmpty) ...[ready()] else ...[notready()],
                Padding(padding: EdgeInsets.only(top: 30)),
                if (cards.isEmpty) ...[
                  quizButton()
                ] else ...[
                  tryButton(context)
                ],
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          showBottom(context),
        ],
      ),
    );
  }
}
