import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/preTest_score.dart';
import 'package:language_hack/screens/questions_list/questions_basic.dart';
import 'package:language_hack/screens/quizScore.dart';

class QuizScreen extends StatefulWidget {
  final List<Quiz> _questions;
  final String name;
  QuizScreen(this._questions, this.name, {Key? key}) : super(key: key);

  @override
  _QuizScreenScreenState createState() => _QuizScreenScreenState();
}

class _QuizScreenScreenState extends State<QuizScreen> {
  final auth = FirebaseAuth.instance;

  // Page Control
  PageController? _controller = PageController(initialPage: 0);
  bool isPressed = false;
  int score = 0;
  String status = '';
  Color isCorrect = Colors.green;
  Color isWrong = Colors.red;
  Color buttonColor = Colors.white;

  @override
  void initState() {
    super.initState();
    shaffleList(widget._questions);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/Logo%2Flogo.png?alt=media&token=75cfc4fa-1400-43ed-96d5-2b85ad733971",
              width: 110,
              height: 110,
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.amber.shade100,
            iconTheme: IconThemeData(color: HexColor("#461482")),
          )),
      body: Container(
          child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 30)),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.75,
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  border: Border.all(color: Colors.black, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: PageView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (page) {
                    setState(() {
                      isPressed = false;
                      status = '';
                    });
                  },
                  itemCount: widget._questions.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Question ${index + 1}/${widget._questions.length}",
                            style: TextStyle(
                                fontSize: 35, color: HexColor("#461482")),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 40)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget._questions[index].instruction!,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 25)),
                        Text(
                          widget._questions[index].question!,
                          style: TextStyle(
                              fontSize: 32, color: HexColor("#461482")),
                        ),
                        Padding(padding: EdgeInsets.only(top: 15)),
                        for (int i = 0;
                            i < widget._questions[index].answer!.length;
                            i++)
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 2, color: Colors.black),
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 9,
                                    offset: Offset(3, 5),
                                  ),
                                ],
                              ),
                              child: MaterialButton(
                                  minWidth:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  color: isPressed
                                      ? widget._questions[index].answer!.entries
                                              .toList()[i]
                                              .value
                                          ? isCorrect
                                          : isWrong
                                      : Colors.white,
                                  onPressed: isPressed
                                      ? () {}
                                      : () {
                                          setState(() {
                                            isPressed = true;
                                          });
                                          if (widget
                                              ._questions[index].answer!.entries
                                              .toList()[i]
                                              .value) {
                                            setState(() {
                                              score += 1;
                                              status = 'Correct! ';
                                            });
                                          } else {
                                            status = 'Incorrect! ';
                                          }
                                        },
                                  shape: StadiumBorder(),
                                  child: Text(
                                    widget._questions[index].answer!.keys
                                        .toList()[i],
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  )),
                            ),
                          ),
                        Padding(padding: EdgeInsets.only(top: 25)),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: status == ''
                                      ? null
                                      : Row(
                                          children: [
                                            checkAnswer(),
                                            status == "Correct! "
                                                ? Image.network(
                                                    "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/quiz%2Fcorrect.png?alt=media&token=d6eb9864-e039-4279-ad80-55e5d74ac2bd",
                                                    height: 40,
                                                    width: 40,
                                                  )
                                                : Image.network(
                                                    "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/quiz%2Fcross.png?alt=media&token=87529f57-c466-46b3-9f18-a4127b335c40",
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                          ],
                                        )),
                              Container(
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.black),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      color: HexColor("#461482"),
                                      blurRadius: 2,
                                      offset: Offset(3, 5),
                                    ),
                                  ],
                                ),
                                child: OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                      shape: StadiumBorder(),
                                      backgroundColor: isPressed
                                          ? Colors.white
                                          : Colors.grey),
                                  onPressed: isPressed
                                      ? index + 1 == widget._questions.length
                                          ? () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return QuizScoreScreen(
                                                    score,
                                                    widget._questions.length,
                                                    widget.name);
                                              }));
                                            }
                                          : () {
                                              _controller!.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 100),
                                                  curve: Curves.linear);
                                            }
                                      : null,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      index + 1 == widget._questions.length
                                          ? "See Result"
                                          : "Next Question",
                                      style: TextStyle(
                                          color: HexColor("#461482"),
                                          fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ),
        ],
      )),
    );
  }

  AnimatedTextKit checkAnswer() {
    return status == "Correct! "
        ? AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                '${status}',
                textStyle: TextStyle(
                  fontSize: 25,
                ),
                colors: [
                  Colors.green,
                  Colors.black,
                  Colors.grey,
                  Colors.white,
                ],
              ),
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
          )
        : AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                '${status}',
                textStyle: TextStyle(
                  fontSize: 25,
                ),
                colors: [Colors.red, Colors.black],
              ),
            ],
            isRepeatingAnimation: true,
            repeatForever: true,
          );
  }

  void shaffleList(List list) {
    list.shuffle();
  }
}
