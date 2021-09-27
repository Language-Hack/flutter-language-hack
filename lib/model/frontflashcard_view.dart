import 'package:flutter/material.dart';

class FrontFlashcardView extends StatelessWidget {
  final String image;
  final String word;
  final String sentence;

  FrontFlashcardView(
      {Key? key,
      required this.image,
      required this.word,
      required this.sentence})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              image,
              width: 100,
              height: 100,
            ),
            Text(
              word,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 50, color: Colors.black),
            ),
            Padding(padding: EdgeInsets.all(7.0)),
            Text(
              "Example Sentence : " + sentence,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
