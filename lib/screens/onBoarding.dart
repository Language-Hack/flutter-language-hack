import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:language_hack/screens/welcome.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

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
            image: buildImage('assets/on-boarding1.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Interactive flashcards, quizess will be seen.',
            body: 'Learning through each flashcards',
            image: buildImage('assets/on-boarding2.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Create your personal notebook',
            body:
                'Make your vocabulary list which you can access them anytime.',
            image: buildImage('assets/on-boarding3.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Start Learning',
            body: 'Enjoy!!',
            image: buildImage('assets/on-boarding4.png'),
            footer: MaterialButton(
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 15.0),
                  child: Text(
                    "Start",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 80.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return WelcomeScreens();
                  }));
                }),
            decoration: getPageDecoration(),
          ),
        ],
        done: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
          child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 15.0),
            child: Text('Start', style: TextStyle(fontWeight: FontWeight.w600)),
          ),
        ),
        onDone: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return WelcomeScreens();
        })),
        showSkipButton: true,
        skip: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
          child: Text('Skip', style: TextStyle(fontWeight: FontWeight.w700)),
        ),
        onSkip: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return WelcomeScreens();
        })),
        next: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
          child: Icon(
            Icons.arrow_forward,
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
          child: Image.asset(
        path,
        width: 350,
      )),
    );

PageDecoration getPageDecoration() => PageDecoration(
      titleTextStyle: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      bodyTextStyle: TextStyle(fontSize: 22),
      descriptionPadding: EdgeInsets.fromLTRB(10.0, 45.0, 10.0, 15.0),
      imagePadding: EdgeInsets.all(24),
      pageColor: Colors.amber.shade50,
    );
