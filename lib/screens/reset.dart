import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key key}) : super(key: key);

  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  var _email = '';

  TextEditingController _userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Container(
          child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 60, left: 15, bottom: 10),
              child: Text(
                "Reset Password",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 35, color: HexColor("#461482")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextFormField(
                controller: _userEmail,
                style: TextStyle(
                  color: Colors.black,
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: "Please fill in your email."),
                  EmailValidator(errorText: "This is not an email.")
                ]),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: HexColor("#461482"))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      borderSide: BorderSide(color: HexColor("#461482"))),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: SizedBox(
                height: 60,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.check),
                  style: ElevatedButton.styleFrom(
                    primary: HexColor("#461482"),
                    onPrimary: Colors.white,
                    side: BorderSide(width: 2, color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  label: Text("Send Request", style: TextStyle(fontSize: 20)),
                  onPressed: () async {
                    if (formKey.currentState.validate()) {
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
                child: ElevatedButton.icon(
                  icon: Icon(Icons.cancel),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: HexColor("#461482"),
                    side: BorderSide(width: 2, color: HexColor("#461482")),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  label: Text("Cancle", style: TextStyle(fontSize: 20)),
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
