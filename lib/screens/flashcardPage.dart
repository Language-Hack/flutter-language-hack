import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:language_hack/model/flashcard.dart';
import 'package:language_hack/model/frontflashcard_view.dart';
import 'package:language_hack/screens/home.dart';
import 'package:flip_card/flip_card.dart';
import 'package:language_hack/screens/welcome.dart';

class FlashCardScreens extends StatefulWidget {
  const FlashCardScreens({Key? key}) : super(key: key);

  @override
  _FlashCardScreensState createState() => _FlashCardScreensState();
}

class _FlashCardScreensState extends State<FlashCardScreens> {
  final auth = FirebaseAuth.instance;

  List<Flashcard> _flashcards = [
    Flashcard(
        picture: "assets/logo.png",
        word: "Hello!",
        sentence: "Test",
        translation: "(noun) สวัสดี!"),
    Flashcard(
        picture: "assets/logo.png",
        word: "Hi!",
        sentence: "Test2",
        translation: "ไฮ!"),
    Flashcard(
        picture: "assets/logo.png",
        word: "Goog Morning!",
        sentence: "Test3",
        translation: "อรุณสวัสดิ์!"),
    Flashcard(
        picture: "assets/logo.png",
        word: "Goog Night!",
        sentence: "Test4",
        translation: "ราตรีสวัสดิ์!")
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(padding: EdgeInsets.all(50.0)),
            SizedBox(
                width: 100,
                height: 230,
                child: FlipCard(
                  front: FrontFlashcardView(
                      image: _flashcards[_currentIndex].picture,
                      word: _flashcards[_currentIndex].word,
                      sentence: _flashcards[_currentIndex].sentence),
                  back: Card(
                    elevation: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.all(45.0)),
                          Text(
                            _flashcards[_currentIndex].translation,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Padding(padding: EdgeInsets.all(16.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton.icon(
                    onPressed: showPreviousCard,
                    icon: Icon(Icons.chevron_left),
                    label: Text("Prev")),
                OutlinedButton.icon(
                    onPressed: showNextCard,
                    icon: Icon(Icons.chevron_right),
                    label: Text("Next")),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black)),
                  label: const Text("Go to welcome",
                      style: TextStyle(fontSize: 20)),
                  icon: Icon(null),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return WelcomeScreens();
                    }));
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  label: const Text("Log Out", style: TextStyle(fontSize: 20)),
                  icon: Icon(null),
                  onPressed: () {
                    auth.signOut().then((value) => Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        })));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void showNextCard() {
    setState(() {
      _currentIndex =
          (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
