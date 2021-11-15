import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/profile.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/onBoarding.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({Key key}) : super(key: key);

  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  String docId = '';
  bool isLoading = false;
  bool _isHidden = true;
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '', displayName: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  CollectionReference scores = FirebaseFirestore.instance.collection('scores');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text("error"),
              ),
              body: Center(
                child: Text("${snapshot.error}"),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
                backgroundColor: Colors.amber.shade50,
                body: Container(
                    child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      buildHeader(),
                      buildDisplayName(),
                      buildEmail(),
                      buildPassword(),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: HexColor("#461482"),
                              onPrimary: Colors.white,
                              side: BorderSide(width: 2, color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text('Please Wait...',
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  )
                                : Text("CREATE ACCOUNT",
                                    style: TextStyle(fontSize: 20)),
                            onPressed: () async {

                              setState(() {
                                isLoading = !isLoading;
                              });

                              if (formKey.currentState!.validate()) {

                                formKey.currentState?.save();
                                try {
                                  await register(context);
                                } on FirebaseAuthException catch (e) {
                                  Fluttertoast.showToast(
                                      msg: e.message.toString(),
                                      gravity: ToastGravity.CENTER);
                                }
                              }
                            },
                          ),
                        ),
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 15.0, top: 20),
                              child: Divider(
                                color: HexColor("#461482"),
                                height: 50,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text(
                            "Already have account ?",
                            style: TextStyle(
                                fontSize: 20, color: HexColor("#461482")),
                          ),
                        ),
                        Expanded(
                          child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 15.0, right: 20.0, top: 20),
                              child: Divider(
                                color: HexColor("#461482"),
                                height: 50,
                              )),
                        ),
                      ]),
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: HexColor("#461482"),
                              side: BorderSide(
                                  width: 2, color: HexColor("#461482")),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child:
                                Text("LOGIN", style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return LoginScreens();
                              }));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )));
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  Future<void> register(BuildContext context) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: profile.email, password: profile.password)
        .then((value) async {
      await value.user.updateDisplayName(profile.displayName).then((value) {
        formKey.currentState.reset();
        createScore();
        Fluttertoast.showToast(
            msg: "Registration Completed", gravity: ToastGravity.TOP);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return OnboardingScreens();
        }));
      });
    });
  }

  void createScore() {
    scores.add({
      "owner": FirebaseAuth.instance.currentUser.displayName.toString(),
      "color_score": 0,
      "adjective_score": 0,
      "countries_score": 0,
      "days_score": 0,
      "family_score": 0,
      "fruit_score": 0,
      "months_score": 0,
      "places_score": 0,
      "vegetable_score": 0,
      "verbs_score": 0,
      "clothes_score": 0,
      "dbFood_score": 0,
      "feeling_score": 0,
      "football_score": 0,
      "halloween_score": 0,
      "music_score": 0,
      "office_score": 0,
      "sports_score": 0,
      "typeFood_score": 0,
      "weather_score": 0,
      "environment_score": 0,
      "ielts_score": 0,
      "carPart_score": 0,
      "toefl_score": 0,
      "workshop_score": 0,
    }
        // .then((value) {
        //   docId = value.id;
        //   print(docId);
        // }
        );
  }

  Container buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 50, left: 20),
      child: Text(
        "Register",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 50, color: HexColor("#461482")),
      ),
    );
  }

  Container buildDisplayName() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (input) {
          profile.displayName = input.toString();
        },
        validator: MultiValidator([
          RequiredValidator(
            errorText: "Please fill in your name.",
          ),
        ]),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Display Name',
          prefixIcon: Icon(Icons.face),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: HexColor("#461482")),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

  Container buildEmail() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (input) {
          profile.email = input.toString();
        },
        validator: MultiValidator([
          RequiredValidator(errorText: "Please fill in your email."),
          EmailValidator(errorText: "This is not email.")
        ]),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity),
          border: OutlineInputBorder(),
          hintText: 'Enter Your Email',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
      child: TextFormField(
        obscureText: _isHidden,
        onSaved: (input) {
          profile.password = input.toString();
        },
        validator:
            RequiredValidator(errorText: "Please fill in the information"),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Password',
          prefixIcon: Icon(Icons.lock_outline),
          suffixIcon: IconButton(
              icon: Icon(_isHidden ? Icons.visibility_off : Icons.visibility),
              onPressed: togglePasswordVisibility),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: Colors.red)),
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() {
        _isHidden = !_isHidden;
      });
}
