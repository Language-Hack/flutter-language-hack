import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:language_hack/screens/preTest.dart';
import 'package:language_hack/screens/welcome.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key key}) : super(key: key);

  @override
  _OnboardingScreensState createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Learning new vocabularies',
            body: 'There are many vocabularies which you can learn.',
            image: buildImage(
                'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/On-boarding%2Fon-boarding1.png?alt=media&token=31d1e429-7955-4053-9cd0-db97c6e73c66'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Interactive flashcards, quizess will be seen.',
            body: 'Learning through each flashcards',
            image: buildImage(
                'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/On-boarding%2Fon-boarding2.png?alt=media&token=df82e8fb-8a47-441a-9266-7b5aa06529ac'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Create your personal notebook',
            body:
                'Make your vocabulary list which you can access them anytime.',
            image: buildImage(
                'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/On-boarding%2Fon-boarding3.png?alt=media&token=e880ee8a-fab0-421d-a133-d9ce92791281'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Start Learning',
            body: 'Enjoy!!',
            image: buildImage(
                'https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/On-boarding%2Fon-boarding4.png?alt=media&token=be9ce079-f571-43e0-aa97-50b60c8c8f88'),
            footer: MaterialButton(
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 15.0),
                  child: Text(
                    "Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      color: HexColor("#461482"),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return PreTestScreen();
                  }));
                }),
            decoration: getPageDecoration(),
          ),
        ],
        done: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
            child: Text('Start',
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: HexColor("#461482"))),
          ),
        ),
        onDone: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return PreTestScreen();
        })),
        showSkipButton: true,
        skip: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Text('Skip',
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: HexColor("#461482"))),
        ),
        onSkip: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return PreTestScreen();
        })),
        next: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
          child: Icon(
            Icons.arrow_forward,
            color: HexColor("#461482"),
          ),
        ),
        globalBackgroundColor: Colors.amber.shade50,
        skipFlex: 0,
        nextFlex: 0,
      ),
    );
  }
}

Widget buildImage(String path) => Padding(
      padding: const EdgeInsets.fromLTRB(1.0, 100.0, 3.0, 0.0),
      child: Center(
          child: Image.network(
        path,
        width: 350,
      )),
    );

PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: HexColor("#461482")),
      bodyTextStyle: TextStyle(fontSize: 22, color: HexColor("#461482")),
      descriptionPadding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 15.0),
      imagePadding: EdgeInsets.all(24),
      pageColor: Colors.amber.shade50,
    );
