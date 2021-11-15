import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutter-language-hack.appspot.com/o/Logo%2Flogo.png?alt=media&token=75cfc4fa-1400-43ed-96d5-2b85ad733971"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 190,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor("#461482"),
                      onPrimary: Colors.white,
                      side: BorderSide(width: 2, color: Colors.black),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Icon(Icons.login),
                    label: Text("Login", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreens();
                      }));
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                SizedBox(
                  width: 190,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: HexColor("#461482"),
                      side: BorderSide(width: 2, color: HexColor("#461482")),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    icon: Icon(Icons.app_registration),
                    label: Text("Register", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return RegisterScreens();
                      }));
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
