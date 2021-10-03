// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/screens/home.dart';

class WelcomeScreens extends StatefulWidget {
  const WelcomeScreens({Key? key}) : super(key: key);

  @override
  _WelcomeScreensState createState() => _WelcomeScreensState();
}

class _WelcomeScreensState extends State<WelcomeScreens> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade300,
        flexibleSpace: const SafeArea(
          child: Icon(
            Icons.home,
            size: 45,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                child: const Text(
                  "Choose What",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, top: 3),
                child: const Text(
                  "to learn today?",
                  style: TextStyle(fontSize: 35),
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 1000,
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.pink.shade200,
                                onPrimary: Colors.black,
                                side: const BorderSide(
                                    color: Colors.black, width: 2),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Image.asset("assets/animal.png"),
                                  const Padding(
                                      padding: EdgeInsets.only(top: 15)),
                                  const Text(
                                    "Animals",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.lightGreen.shade200,
                                  onPrimary: Colors.black,
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: const Text("animal")),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor("#fa7af4"),
                                  onPrimary: Colors.black,
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: Text("animal")),
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor("#A3F2E4"),
                                  onPrimary: Colors.black,
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: const Text("animal")),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: HexColor("#BA3434"),
                                  onPrimary: Colors.black,
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: const Text("animal")),
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: const Text("animal")),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(top: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: const Text("animal")),
                          ),
                          Padding(padding: EdgeInsets.all(20)),
                          SizedBox(
                            width: 150,
                            height: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side: const BorderSide(
                                      color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {},
                                child: const Text("animal")),
                          ),
                        ],
                      ) // <----- insert here
                    ],
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage("assets/bg.png"))),
                child: Stack(children: <Widget>[
                  const Positioned(
                    bottom: 40.0,
                    child: Text("Welcome",
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Positioned(
                    bottom: 12.0,
                    child: Text(
                      auth.currentUser!.email.toString(),
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  )
                ])),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(20, 60),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    side: BorderSide(color: Colors.white),
                    alignment: Alignment.centerLeft),
                onPressed: () {},
                icon: Icon(Icons.person),
                label: const Text(
                  "User Profile",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.left,
                )),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(20, 60),
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    side: BorderSide(color: Colors.white),
                    alignment: Alignment.centerLeft),
                onPressed: () {
                  auth.signOut().then((value) => Navigator.pushReplacement(
                          context, MaterialPageRoute(builder: (context) {
                        return const HomeScreen();
                      })));
                },
                icon: Icon(Icons.logout),
                label: const Text(
                  "Log out",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  textAlign: TextAlign.left,
                )),
          ],
        ),
      ),

      // body: Container(
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //       image: AssetImage("assets/bg.png"),
      //       fit: BoxFit.cover,
      //     ),
      //   ),
      //   child: Form(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.stretch,
      //       children: [
      //         Container(
      //           margin: EdgeInsets.only(top: 100, left: 20),
      //           child: (Text(
      //             auth.currentUser!.email.toString(),
      //             style: TextStyle(fontSize: 40, color: Colors.black),
      //             textAlign: TextAlign.left,
      //           )),
      //         ),
      //         Container(
      //           margin: EdgeInsets.only(top: 20, left: 20, right: 20),
      //           child: SizedBox(
      //             height: 60,
      //             child: ElevatedButton.icon(
      //               style: ButtonStyle(
      //                   backgroundColor:
      //                       MaterialStateProperty.all<Color>(Colors.black)),
      //               label:
      //                   const Text("Log Out", style: TextStyle(fontSize: 20)),
      //               icon: Icon(null),
      //               onPressed: () {
      //                 auth.signOut().then((value) =>
      //                     Navigator.pushReplacement(context,
      //                         MaterialPageRoute(builder: (context) {
      //                       return HomeScreen();
      //                     })));
      //               },
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ));
    );
  }
}
