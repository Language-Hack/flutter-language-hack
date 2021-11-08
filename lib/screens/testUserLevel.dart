import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/quiz.dart';
import 'package:language_hack/screens/preTest_score.dart';
import 'package:language_hack/screens/questions_list/questions_preTest.dart';

class TestUserLevelScreen extends StatefulWidget {
  const TestUserLevelScreen({Key? key}) : super(key: key);

  @override
  _TestUserLevelScreenState createState() => _TestUserLevelScreenState();
}

class _TestUserLevelScreenState extends State<TestUserLevelScreen> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            title: Image.asset(
              "assets/logo.png",
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
          createHeader(),
          Padding(padding: const EdgeInsets.only(top: 30)),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.7,
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
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              "Question ${index + 1}/${questions.length}",
                              style: TextStyle(
                                  fontSize: 25, color: HexColor("#461482")),
                            ),
                          ),
                          // SizedBox(
                          //   child: Text(
                          //     "Score: ${score}",
                          //     style: TextStyle(
                          //         fontSize: 20, color: HexColor("#461482")),
                          //   ),
                          // ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 40)),
                      Text(
                        questions[index].question!,
                        style: TextStyle(fontSize: 45),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      for (int i = 0; i < questions[index].answer!.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.07,
                              color: isPressed
                                  ? questions[index]
                                          .answer!
                                          .entries
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
                                      if (questions[index]
                                          .answer!
                                          .entries
                                          .toList()[i]
                                          .value) {
                                        setState(() {
                                          score += 1;
                                          status = 'Correct!';
                                        });
                                      } else {
                                        status = 'Incorrect!';
                                      }
                                    },
                              shape: StadiumBorder(),
                              child: Text(
                                questions[index].answer!.keys.toList()[i],
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      Padding(padding: EdgeInsets.only(top: 50)),
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: status == "Correct!"
                                  ? Text(
                                      "${status}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.green),
                                    )
                                  : Text(
                                      "${status}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.red),
                                    ),
                            ),
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  backgroundColor: Colors.white),
                              onPressed: isPressed
                                  ? index + 1 == questions.length
                                      ? () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return PreTestScoreScreen(
                                                score, questions.length);
                                          }));
                                        }
                                      : () {
                                          _controller!.nextPage(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              curve: Curves.linear);
                                        }
                                  : null,
                              child: Text(
                                index + 1 == questions.length
                                    ? "See Result"
                                    : "Next Question",
                                style: TextStyle(
                                    color: HexColor("#461482"), fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }),
          ),
        ],
      )),
    );
  }

  Padding createHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: Text(
          "Pre-Test",
          style: TextStyle(color: HexColor("#461482"), fontSize: 30),
        ),
      ),
    );
  }
}
