import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/welcome.dart';

import '../user.dart';

class Flash_Music extends StatefulWidget {
  const Flash_Music({Key? key}) : super(key: key);

  @override
  _Flash_MusicState createState() => _Flash_MusicState();
}

final List data = [
  {
    'color': Colors.red.shade200,
    'word': "piano",
    'picture': "assets/Musical/1.png",
    'meaing': "เปียโน",
    'example': "A piano is expensive."
  },
  {
    'color': Colors.orange.shade200,
    'word': "trumpet",
    'picture': "assets/Musical/2.png",
    'meaing': "แตร",
    'example': "Ted likes playing the trumpet."
  },
  {
    'color': Colors.yellow.shade200,
    'word': "violin",
    'picture': "assets/Musical/3.png",
    'meaing': "ไวโอลิน",
    'example': "He plays the violin very well."
  },
  {
    'color': Colors.green.shade200,
    'word': "guitar",
    'picture': "assets/Musical/4.png",
    'meaing': "กีตาร์",
    'example': "He explained how to play the guitar to me."
  },
  {
    'color': Colors.blue.shade200,
    'word': "drums",
    'picture': "assets/Musical/5.png",
    'meaing': "กลอง",
    'example': "A boy was beating the drum."
  },
  {
    'color': Colors.grey.shade200,
    'word': "flute",
    'picture': "assets/Musical/6.png",
    'meaing': "ขลุ่ย",
    'example': "A girl is playing the flute."
  },
  {
    'color': Colors.grey.shade400,
    'word': "saxophone",
    'picture': "assets/Musical/7.png",
    'meaing': "แซ็กโซโฟน",
    'example': "I can hear a saxophone playing somewhere."
  },
  {
    'color': Colors.pink.shade200,
    'word': "accordion",
    'picture': "assets/Musical/8.png",
    'meaing': "หีบเพลง",
    'example': "I played the accordion."
  },
  {
    'color': Colors.brown.shade200,
    'word': "harmonica",
    'picture': "assets/Musical/9.png",
    'meaing': "หีบเพลงเป่า",
    'example': "I belonged to the harmonica club in my high school days."
  },
  {
    'color': Colors.purple.shade200,
    'word': "banjo",
    'picture': "assets/Musical/10.png",
    'meaing': "แบนโจ",
    'example': "I hear you're good at playing the banjo."
  },
];

List notRemember = [];
List Remember = [];

////////// this is the speaking function in this flashcard ///////////
final FlutterTts flutterTts = FlutterTts();

Future speak(String text) async {
  await flutterTts.setLanguage("en-US");
  await flutterTts.setPitch(1);
  await flutterTts.speak(text);
}

class _Flash_MusicState extends State<Flash_Music> {
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
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.asset("assets/logo.png",
                width: 110, height: 110, color: HexColor("#461482")),
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
                  icon: Icon(Icons.person))
            ],
          )),
      body: Center(
          child: Stack(
        children: [
          Column(
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
                    Text(
                      "Congratulations!!",
                      style: TextStyle(
                          fontSize: 30,
                          color: HexColor("#461482"),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text(
                      "You have learned all the",
                      style: TextStyle(
                          fontSize: 20,
                          color: HexColor("#461482"),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text(
                      "flash-cards",
                      style: TextStyle(
                          fontSize: 20,
                          color: HexColor("#461482"),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    Text(
                      "Ready for a quiz?",
                      style: TextStyle(
                          fontSize: 20,
                          color: HexColor("#461482"),
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.only(top: 50)),
                    SizedBox(
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
                    ),
                    Padding(padding: EdgeInsets.only(top: 30)),
                    SizedBox(
                      width: 150,
                      height: 50,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: HexColor("#461482"),
                          side: BorderSide(width: 2, color: Colors.black),
                        ),
                        icon: Icon(Icons.login),
                        label:
                            Text("Start Over", style: TextStyle(fontSize: 15)),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      super.widget));
                          notRemember.clear();
                          Remember.clear();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80),
              showBottom(context),
            ],
          ),
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
      notRemember.clear();
      Remember.clear();
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
      Text("Can't remember"),
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

// void _ShowToast(BuildContext context) {
//   final scaffold = Scaffold.of(context);
//   scaffold.
// }

class Card extends StatelessWidget {
  // Made to distinguish cards
  // Add your own applicable data here
  final Color color;
  String word = "";
  String picture;
  String example = "";
  String meaing = "";
  bool showDisplay = false;
  String text = '';

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
              // ElevatedButton.icon(
              //     onPressed: () => speak(word),
              //     icon: Icon(Icons.volume_up),
              //     label: Text("")),
              const Padding(padding: EdgeInsets.only(top: 25)),
              Image.asset(
                picture,
                height: 170,
                width: 100,
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              Text(
                meaing,
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
          title: "YESS!",
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
        Remember.add(Card(
          this.color,
          this.word,
          this.picture,
          this.meaing,
          this.example,
        ));
        print("This is remember");
        print(Remember);
      },

      onSwipeLeft: (finalPosition) {
        CherryToast(
          title: "NOPE!",
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
        notRemember.add(Card(
          this.color,
          this.word,
          this.picture,
          this.meaing,
          this.example,
        ));
        print("this is notRemember:");
        print(notRemember);
      },

      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
