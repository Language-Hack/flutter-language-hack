import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/login.dart';
import 'package:language_hack/screens/register.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber.shade50,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("assets/logo.png"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: HexColor("#461482"),
                      side: BorderSide(width: 2, color: HexColor("#461482")),
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
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: 60,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: HexColor("#461482"),
                        onPrimary: Colors.white,
                        side: BorderSide(width: 2, color: Colors.black)),
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
