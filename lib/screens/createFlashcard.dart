import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:language_hack/model/userFlashcard.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/user.dart';
import 'package:language_hack/screens/welcome.dart';

class CreateFlashcardScreens extends StatefulWidget {
  const CreateFlashcardScreens({Key? key}) : super(key: key);

  @override
  _CreateFlashcardScreensState createState() => _CreateFlashcardScreensState();
}

class _CreateFlashcardScreensState extends State<CreateFlashcardScreens> {
  final auth = FirebaseAuth.instance;

  // Create a collection
  CollectionReference words = FirebaseFirestore.instance.collection('words');

  String? value;

  // Display on the screen
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('words')
      .where("owner",
          isEqualTo: FirebaseAuth.instance.currentUser!.displayName.toString())
      // .where("category", isEqualTo: "")
      .snapshots();

  UserFlashcard userFlashcard =
      new UserFlashcard(sentence: '', translation: '', word: '', category: '');

  TextEditingController _word = TextEditingController();
  TextEditingController _sentence = TextEditingController();
  TextEditingController _translation = TextEditingController();
  TextEditingController _category = TextEditingController();

  List<String> items = ["ITEM1", "ITEM2", "ITEM3", "Test"];
  int index = 0;

  void getIndex() {
    setState(() {
      index = items.indexWhere((element) => element == value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final wordField = TextFormField(
      controller: _word,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: "คำศัพท์",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final translationField = TextFormField(
      controller: _translation,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: "คำแปล",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final sentenceField = TextFormField(
      controller: _sentence,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: "ประโยค",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final categoryField = TextFormField(
      controller: _category,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        labelText: "category",
        labelStyle: TextStyle(
          color: Colors.blue,
        ),
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
    );

    final addButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.green,
      child: MaterialButton(
        minWidth: mq.size.width / 1.2,
        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
        child: Text(
          "Add",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {
          setState(() {
            if (_word.text != '') {
              userFlashcard.word = _word.text;
              userFlashcard.sentence = _sentence.text;
              userFlashcard.translation = _translation.text;
              userFlashcard.category = _category.text;
              // _flashcards.add(userFlashcard);
            }
            words.add({
              'word': userFlashcard.word,
              'sentence': userFlashcard.sentence,
              'translation': userFlashcard.translation,
              'category': userFlashcard.category,
              'owner': auth.currentUser!.displayName.toString(),
            }).catchError((error) => print("Failed to add user: $error"));
          });
          userFlashcard = new UserFlashcard(
              word: "", sentence: "", translation: "", category: "");
          _word.text = "";
          _sentence.text = "";
          _translation.text = "";
          _category.text = "";
          Navigator.of(context).pop();
        },
      ),
    );

    final cancleButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.red,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Cancle",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          wordField,
          translationField,
          sentenceField,
          categoryField
        ],
      ),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        addButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        cancleButton,
      ],
    );

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(item,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        );

    return Scaffold(
        backgroundColor: Colors.amber.shade50,
        appBar:
            // AppBar(
            //   backgroundColor: Colors.amber.shade100,
            //   title: Center(
            //     child: Container(
            //       margin: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 0.0),
            //       padding: EdgeInsets.symmetric(horizontal: 25, vertical: 1),
            //       decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12),
            //           border: Border.all(color: Colors.black)),
            //       child: DropdownButtonHideUnderline(
            //         child: DropdownButton<String>(
            //           value: value,
            //           hint: Text("Uncategorize"),
            //           icon: Icon(Icons.arrow_drop_down),
            //           items: items.map(buildMenuItem).toList(),
            //           onChanged: (value) => setState(() => this.value = value),
            //         ),
            //       ),
            //     ),
            //   ),
            //   actions: [
            //     IconButton(onPressed: () {}, icon: Icon(Icons.folder)),
            //     IconButton(onPressed: () {}, icon: Icon(Icons.add))
            //   ],
            // ),
            PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: AppBar(
                  title: Image.asset(
                    "assets/logo.png",
                    width: 110,
                    height: 110,
                  ),
                  backgroundColor: Colors.amber.shade100,
                  iconTheme: IconThemeData(color: Colors.black),
                  actions: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.folder)),
                  ],
                )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/bg.png"))),
                  child: Stack(children: <Widget>[
                    const Positioned(
                      bottom: 40.0,
                      child: Text("Welcome!",
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      bottom: 12.0,
                      child: Text(
                        auth.currentUser!.displayName.toString(),
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
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return UserScreen();
                    }));
                  },
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return WelcomeScreens();
                    }));
                  },
                  icon: Icon(Icons.dashboard),
                  label: const Text(
                    "Dashboard",
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
        floatingActionButton: ElevatedButton(
          child: Icon(Icons.add, color: Colors.white),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(20),
            primary: Colors.blue, // <-- Button color
            onPrimary: Colors.red, // <-- Splash color
          ),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  final TextEditingController _text = TextEditingController();
                  return AlertDialog(
                      title: Text(
                        "Add Card",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      backgroundColor: Colors.green.shade100,
                      content: Form(
                          child: SingleChildScrollView(
                        child: Container(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              fields,
                              Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: bottom,
                              ),
                            ],
                          ),
                        ),
                      )));
                });
          },
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading"));
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return Card(
                  elevation: 8,
                  shadowColor: Colors.green,
                  margin: EdgeInsets.all(15),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  child: ListTile(
                    title: Text(data['word']),
                    onTap: () => {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            final TextEditingController _text =
                                TextEditingController();
                            return AlertDialog(
                                title: Text(
                                  "Flashcard Detail",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                    onPressed: () => Navigator.of(context)
                                        .pop(), // passing true
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        radius: 18.0,
                                        backgroundColor: Colors.green,
                                        child: Icon(
                                          Icons.check,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                                backgroundColor: Colors.green.shade100,
                                content: Form(
                                    child: SingleChildScrollView(
                                  child: Container(
                                    height: 150,
                                    width: 300,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "คำศัพท์: " + data['word'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "แปลว่า: " + data['translation'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "ตัวอย่างประโยค: " + data['sentence'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          "Category: " + data['category'],
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                )));
                          })
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.red,
                      onPressed: () {
                        words.doc(document.reference.id).delete();
                      },
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
