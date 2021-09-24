import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:language_hack/model/profile.dart';
import 'package:language_hack/screens/home.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({Key? key}) : super(key: key);

  @override
  _RegisterScreensState createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
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
                body: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/bg.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 100, left: 20),
                            child: const Text(
                              "Register",
                              textAlign: TextAlign.left,
                              style:
                                  TextStyle(fontSize: 50, color: Colors.black),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (input) {
                                profile.email = input.toString();
                              },
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: "please fill in your email."),
                                EmailValidator(errorText: "This is not email.")
                              ]),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Please! enter your email.'),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: TextFormField(
                              obscureText: true,
                              onSaved: (input) {
                                profile.password = input.toString();
                              },
                              validator: RequiredValidator(
                                  errorText: "please fill in the information"),
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Please! enter your password.'),
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: SizedBox(
                              height: 60,
                              child: ElevatedButton.icon(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.black)),
                                label: const Text("NEXT",
                                    style: TextStyle(fontSize: 20)),
                                icon: Icon(null),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: profile.email,
                                              password: profile.password)
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Fluttertoast.showToast(
                                            msg:
                                                "registration completed successfully",
                                            gravity: ToastGravity.TOP);
                                        Navigator.pushReplacement(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return HomeScreen();
                                        }));
                                      });
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
                          Container(
                            margin:
                                EdgeInsets.only(top: 20, left: 20, right: 20),
                            child: SizedBox(
                              height: 60,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black,
                                    side: BorderSide(
                                        width: 2, color: Colors.black)),
                                label: Text("BACK",
                                    style: TextStyle(fontSize: 20)),
                                icon: Icon(Icons.arrow_left_outlined),
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomeScreen();
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
}
