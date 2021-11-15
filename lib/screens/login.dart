import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/profile.dart';
import 'package:language_hack/screens/register.dart';
import 'package:language_hack/screens/reset.dart';
import 'package:language_hack/screens/welcome.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  _LoginScreensState createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  bool _isHidden = true;
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '', displayName: '');
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

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
                      buildEmail(),
                      buildPassword(),
                      buildForgotPassword(context),
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
                            child: isLoading
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: HexColor("#461482"),
                                      ),
                                      SizedBox(
                                        width: 24,
                                      ),
                                      Text('Please Wait...',
                                          style: TextStyle(fontSize: 20))
                                    ],
                                  )
                                : Text("LOG IN",
                                    style: TextStyle(fontSize: 20)),
                            onPressed: () async {
                              setState(() {
                                isLoading = !isLoading;
                              });

                              if (formKey.currentState!.validate()) {
                                formKey.currentState?.save();
                                try {
                                  await login(context);
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
                            "OR",
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
                              primary: HexColor("#461482"),
                              onPrimary: Colors.white,
                              side: BorderSide(width: 2, color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Text("REGISTER",
                                style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterScreens();
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

  Future<void> login(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: profile.email, password: profile.password)
        .then((value) {
      formKey.currentState!.reset();
      Fluttertoast.showToast(
          msg: "Welcome to Language-Hack", gravity: ToastGravity.TOP);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return WelcomeScreens();
      }));
    });
  }

  Container buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 100, left: 20),
      child: Text(
        "Login",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 50, color: HexColor("#461482")),
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
          EmailValidator(errorText: "This is not an email.")
        ]),
        decoration: InputDecoration(
          hintText: 'Enter Your Email',
          prefixIcon: Icon(Icons.perm_identity),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
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
              borderSide: BorderSide(color: HexColor("#461482"))),
        ),
      ),
    );
  }

  void togglePasswordVisibility() => setState(() {
        _isHidden = !_isHidden;
      });

  Row buildForgotPassword(BuildContext context) {
    return Row(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 260),
        child: TextButton(
          child: Text(
            "Forgot Password ?",
            style: TextStyle(fontSize: 15),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ResetScreen();
            }));
          },
        ),
      )
    ]);
  }
}
