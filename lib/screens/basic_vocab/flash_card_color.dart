import 'dart:async';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:language_hack/model/words.dart';
import 'package:language_hack/screens/questions_list/questions_basic.dart';
import 'package:language_hack/screens/quizPage.dart';
import 'package:language_hack/screens/user.dart';

import 'package:language_hack/screens/welcome.dart';

////////// this is the speaking function in this flashcard ///////////
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}

List newData = [];
List<Card> cards = [];
List<Card> instant_cards = [];

class Flash_Color extends StatefulWidget {
  const Flash_Color({
    Key key,
  }) : super(key: key);

  @override
  _Flash_ColorState createState() => _Flash_ColorState();
}

class _Flash_ColorState extends State<Flash_Color> {
  final auth = FirebaseAuth.instance;

  Future<Null> insertList() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection('colors')
          .snapshots()
          .listen((event) {
        for (var snapshots in event.docs) {
          Map<String, dynamic> map = snapshots.data();
          newData.add(map);
          print('newData: $newData');
          Words model = Words.fromMap(map);
        }
        setState(() {
          cards.insert(
              0,
              Card(newData[0]['word'], newData[0]['picture'],
                  newData[0]['meaning'], newData[0]['example']));
          cards.insert(
              1,
              Card(newData[1]['word'], newData[1]['picture'],
                  newData[1]['meaning'], newData[1]['example']));
          cards.insert(
              2,
              Card(newData[2]['word'], newData[2]['picture'],
                  newData[2]['meaning'], newData[2]['example']));
          cards.insert(
              3,
              Card(newData[3]['word'], newData[3]['picture'],
                  newData[3]['meaning'], newData[3]['example']));
          cards.insert(
              4,
              Card(newData[4]['word'], newData[4]['picture'],
                  newData[4]['meaning'], newData[4]['example']));
          cards.insert(
              5,
              Card(newData[5]['word'], newData[5]['picture'],
                  newData[5]['meaning'], newData[5]['example']));
          cards.insert(
              6,
              Card(newData[6]['word'], newData[6]['picture'],
                  newData[6]['meaning'], newData[6]['example']));
          cards.insert(
              7,
              Card(newData[7]['word'], newData[7]['picture'],
                  newData[7]['meaning'], newData[7]['example']));
          cards.insert(
              8,
              Card(newData[8]['word'], newData[8]['picture'],
                  newData[8]['meaning'], newData[8]['example']));
          cards.insert(
              9,
              Card(newData[9]['word'], newData[9]['picture'],
                  newData[9]['meaning'], newData[9]['example']));
          instant_cards.addAll(cards);
          print(cards.length);
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    insertList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MainContainer(),
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({Key key}) : super(key: key);

  @override
  _MainContainerState createState() => _MainContainerState();
}

final name = 'color_score';

class _MainContainerState extends State<MainContainer> {
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
          const ShowResult(),
          Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 20)),
              Swipe(),
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
                builder: (BuildContext context) => MainContainer()));
      },
    ),
  );
}

Widget cancelButton(BuildContext context) {
  return Column(
    children: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: CircleBorder(), primary: Colors.red),
        child: Container(
            width: 58,
            height: 58,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: Image.asset("assets/rejected.png")),
        onPressed: () {
          newData.clear();
          cards.clear();
          showExitDialog(context);
          // Navigator.pushReplacement(context,
          //     MaterialPageRoute(builder: (context) {
          //   return WelcomeScreens();
          // }));
        },
      ),
      const Padding(padding: EdgeInsets.only(top: 5)),
      Text("Exit")
    ],
  );
}

Future<void> showExitDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                color: Colors.amber.shade100,
                border: Border.all(color: Colors.black, width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Do you want to end this lesson?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.red,
                      side: BorderSide(width: 2, color: Colors.black),
                    ),
                    icon: Icon(Icons.check),
                    label: Text("Yes", style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  WelcomeScreens()));
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                SizedBox(
                  width: 130,
                  height: 40,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.red,
                      side: BorderSide(width: 2, color: Colors.black),
                    ),
                    icon: Icon(Icons.cancel),
                    label: Text("No", style: TextStyle(fontSize: 15)),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MainContainer()));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      });
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
  String word = "";
  String picture;
  String example = "";
  String meaning = "";
  bool showDisplay = false;
  String text = '';

  Card(
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
              Image.network(
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
          toastPosition: POSITION.TOP,
          animationType: ANIMATION_TYPE.FROM_LEFT,
          autoDismiss: true,
        ).show(context);
        print("This is cards");
        print(cards);
      },
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
          SizedBox(height: MediaQuery.of(context).size.height * 0.09),
          showBottom(context),
        ],
      ),
    );
  }
}

class Swipe extends StatefulWidget {
  const Swipe({Key key}) : super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.7,
      // Important to keep as a stack to have overlay of cards.
      child: Stack(
        children: cards,
      ),
    );
  }
}