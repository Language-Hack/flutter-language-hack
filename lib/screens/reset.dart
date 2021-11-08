import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  var _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      // appBar: PreferredSize(
      //     preferredSize: const Size.fromHeight(60),
      //     child: AppBar(
      //       title: Image.asset(
      //         "assets/logo.png",
      //         width: 110,
      //         height: 110,
      //       ),
      //       backgroundColor: Colors.amber.shade50,
      //       iconTheme: IconThemeData(color: HexColor("#461482")),
      //     )),
      body: Container(
          child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 90, left: 20),
              child: Text(
                "Reset Password",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 35, color: HexColor("#461482")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please fill in your email."),
                  EmailValidator(errorText: "This is not an email.")
                ]),
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          HexColor("#461482"))),
                  child: const Text("Send Request",
                      style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        auth.sendPasswordResetEmail(email: _email);
                        Fluttertoast.showToast(
                            msg: "Your request is send",
                            gravity: ToastGravity.TOP);
                        Navigator.of(context).pop();
                      } on Exception catch (e) {
                        Fluttertoast.showToast(
                            msg: e.toString(), gravity: ToastGravity.CENTER);
                      }
                    }
                  },
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: HexColor("#461482"),
                      side: BorderSide(width: 2, color: HexColor("#461482"))),
                  child: Text("Cancle",
                      style:
                          TextStyle(fontSize: 20, color: HexColor("#461482"))),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
