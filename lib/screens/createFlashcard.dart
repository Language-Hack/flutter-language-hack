import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:language_hack/model/userFlashcard.dart';
import 'package:language_hack/screens/home.dart';
import 'package:language_hack/screens/user.dart';
import 'package:language_hack/screens/welcome.dart';

class CreateFlashcardScreens extends StatefulWidget {
  const CreateFlashcardScreens({Key key}) : super(key: key);

  @override
  _CreateFlashcardScreensState createState() => _CreateFlashcardScreensState();
}

class _CreateFlashcardScreensState extends State<CreateFlashcardScreens> {
  final auth = FirebaseAuth.instance;

  // Create a collection
  CollectionReference words = FirebaseFirestore.instance.collection('words');

  CollectionReference categories =
      FirebaseFirestore.instance.collection('categories');

  String value = "Uncategorize";

  // Display on the screen
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('words')
      .where("owner",
          isEqualTo: FirebaseAuth.instance.currentUser.displayName.toString())
      .snapshots();

  Future deleteFlashcards() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("words")
        .where("owner",
            isEqualTo: FirebaseAuth.instance.currentUser.displayName.toString())
        .where("category", isEqualTo: value)
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      words
          .doc(a.id)
          .delete()
          .then((value) => print("Delete Flashcard Successfully."))
          .catchError((error) => print("Failed to delete Flashcard: $error"));
    }
  }

  Future deleteCategory() async {
    items.removeWhere((item) => item == value);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories")
        .where("owner",
            isEqualTo: FirebaseAuth.instance.currentUser.displayName.toString())
        .where("category", isEqualTo: value)
        .get();
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var a = querySnapshot.docs[i];
      categories
          .doc(a.id)
          .delete()
          .then((value) => print("Delete Category Successfully."))
          .catchError((error) => print("Failed to delete category: $error"));
      ;
    }
  }

  UserFlashcard userFlashcard =
      new UserFlashcard(sentence: '', translation: '', word: '', category: '');

  TextEditingController _word = TextEditingController();
  TextEditingController _sentence = TextEditingController();
  TextEditingController _translation = TextEditingController();
  TextEditingController _category = TextEditingController();
  TextEditingController _createCategory = TextEditingController();

  List<String> items = ["Uncategorize"];

  @override
  void initState() {
    super.initState();
    readData();
  }

  Future<Null> readData() async {
    await Firebase.initializeApp().then((value) async {
      await FirebaseFirestore.instance
          .collection("categories")
          .where("owner",
              isEqualTo:
                  FirebaseAuth.instance.currentUser.displayName.toString())
          .snapshots()
          .listen((event) {
        for (var snapshorts in event.docs) {
          Map<String, dynamic> map = snapshorts.data();
          if (!items.contains(map['category'])) {
            items.add(map['category']);
          }
          setState(() {
            items.toSet().toList();
          });
          getCategory();
        }
      });
    });
  }

  void getCategory() {
    setState(() {
      items.toSet().toList();
      items.sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final wordField = Container(
      margin: EdgeInsets.only(top: 10),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _word,
        style: TextStyle(
          color: Colors.black,
        ),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          hintText: 'Word',
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
        ),
      ),
    );

    final translationField = Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        controller: _translation,
        style: TextStyle(
          color: Colors.black,
        ),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          hintText: 'Translation',
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
        ),
      ),
    );

    final sentenceField = Container(
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          hintText: 'Sentence',
          hintStyle: TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              borderSide: BorderSide(color: HexColor("#461482"))),
        ),
        controller: _sentence,
        style: TextStyle(
          color: Colors.black,
        ),
        cursorColor: Colors.blue,
      ),
    );

    final createCategoryField = TextFormField(
      textCapitalization: TextCapitalization.sentences,
      controller: _createCategory,
      style: TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.blue,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20),
        hintText: 'Category',
        hintStyle: TextStyle(color: Colors.black),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: HexColor("#461482"))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: HexColor("#461482"))),
      ),
    );

    final addButton = Container(
      child: SizedBox(
        width: mq.size.width * 0.9,
        height: 55,
        child: ElevatedButton.icon(
          icon: Icon(Icons.create),
          style: ElevatedButton.styleFrom(
            primary: HexColor("#461482"),
            onPrimary: Colors.white,
            side: BorderSide(width: 2, color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          label: Text("Create", style: TextStyle(fontSize: 20)),
          onPressed: () {
            setState(() {
              if (_word.text != '') {
                userFlashcard.word = _word.text;
                userFlashcard.sentence = _sentence.text;
                userFlashcard.translation = _translation.text;
                userFlashcard.category = _category.text;
              }
              words.add({
                'word': userFlashcard.word,
                'sentence': userFlashcard.sentence,
                'translation': userFlashcard.translation,
                'category': value,
                'owner': auth.currentUser.displayName.toString(),
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
      ),
    );

    final createCategryButton = Container(
      margin: EdgeInsets.only(top: 10),
      child: SizedBox(
        width: mq.size.width * 0.9,
        height: 55,
        child: ElevatedButton.icon(
          icon: Icon(Icons.create),
          style: ElevatedButton.styleFrom(
            primary: HexColor("#461482"),
            onPrimary: Colors.white,
            side: BorderSide(width: 2, color: Colors.black),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          label: Text("Create", style: TextStyle(fontSize: 20)),
          onPressed: () {
            if (_createCategory.text != "") {
              categories.add({
                'owner': auth.currentUser.displayName.toString(),
                'category': _createCategory.text,
              }).catchError((error) => print("Failed to add category: $error"));
            } else {
              categories.add({
                'owner': auth.currentUser.displayName.toString(),
                'category': "Uncategorize",
              }).catchError((error) => print("Failed to add category: $error"));
            }
            value = _createCategory.text;
            _createCategory.text = "";
            Navigator.of(context).pop();
            Fluttertoast.showToast(
                msg: "Create Sucessfully", gravity: ToastGravity.CENTER);
          },
        ),
      ),
    );

    final cancleButton = Container(
      child: SizedBox(
        width: mq.size.width * 0.9,
        height: 55,
        child: ElevatedButton.icon(
            icon: Icon(Icons.cancel),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              onPrimary: HexColor("#461482"),
              side: BorderSide(width: 2, color: HexColor("#461482")),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            label: Text("Cancel", style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
    );

    final continueButton = Container(
      child: SizedBox(
        width: mq.size.width * 0.9,
        height: 55,
        child: ElevatedButton.icon(
            icon: Icon(Icons.rotate_right),
            style: ElevatedButton.styleFrom(
              primary: HexColor("#461482"),
              onPrimary: Colors.white,
              side: BorderSide(width: 2, color: Colors.black),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            label: Text("Continue", style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          wordField,
          translationField,
          sentenceField,
        ],
      ),
    );

    final createCategoryFields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          createCategoryField,
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

    final createCategorybottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        createCategryButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        cancleButton,
      ],
    );

    DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
          value: item,
          child: Text(item,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: HexColor("#461482"))),
        );

    return Scaffold(
        backgroundColor: Colors.amber.shade50,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: HexColor("#461482")),
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return WelcomeScreens();
                  }));
                },
              ),
              title: Center(
                child: Container(
                  margin: const EdgeInsets.only(right: 40),
                  padding: EdgeInsets.symmetric(horizontal: 19, vertical: 1),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: HexColor("#461482"), width: 2)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: value,
                      dropdownColor: Colors.amber.shade100,
                      icon: Icon(Icons.arrow_drop_down,
                          color: HexColor("#461482")),
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value) => setState(() => this.value = value),
                    ),
                  ),
                ),
              ),
              backgroundColor: Colors.amber.shade100,
              iconTheme: IconThemeData(color: HexColor("#461482")),
            )),
        floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: Colors.black,
            overlayColor: Colors.black,
            spacing: 12,
            spaceBetweenChildren: 12,
            children: [
              SpeedDialChild(
                child: Image.asset(
                  "assets/add-file.png",
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.amber.shade100,
                labelBackgroundColor: Colors.amber.shade100,
                label: "Create Flashcard",
                labelStyle: TextStyle(color: HexColor("#461482"), fontSize: 18),
                onTap: () => {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.7,
                            decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                border:
                                    Border.all(color: Colors.black, width: 3.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: Center(
                                    child: Text(
                                      "Create Flashcard",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#461482")),
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 2)),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Form(
                                      child: SingleChildScrollView(
                                    child: Container(
                                      height: 370,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          fields,
                                          Padding(
                                            padding: EdgeInsets.only(top: 15),
                                            child: bottom,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                },
              ),
              SpeedDialChild(
                child: Image.asset(
                  "assets/create folder.png",
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.amber.shade100,
                labelBackgroundColor: Colors.amber.shade100,
                label: "Create Category",
                labelStyle: TextStyle(color: HexColor("#461482"), fontSize: 18),
                onTap: () => {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.45,
                            decoration: BoxDecoration(
                                color: Colors.amber.shade100,
                                border:
                                    Border.all(color: Colors.black, width: 3.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 5, top: 15),
                                  child: Center(
                                    child: Text(
                                      "Create Category",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          color: HexColor("#461482")),
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.only(top: 2)),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Form(
                                      child: SingleChildScrollView(
                                    child: Container(
                                      height: 220,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: <Widget>[
                                          createCategoryFields,
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: createCategorybottom,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                        );
                      })
                },
              ),
              SpeedDialChild(
                child: Image.asset(
                  "assets/delete folder.png",
                  width: 30,
                  height: 30,
                ),
                backgroundColor: Colors.amber.shade100,
                labelBackgroundColor: Colors.amber.shade100,
                label: "Delete Category",
                labelStyle: TextStyle(color: HexColor("#461482"), fontSize: 18),
                onTap: () => {
                  value != "Uncategorize"
                      ? showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    border: Border.all(
                                        color: Colors.black, width: 3.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Center(
                                        child: Text(
                                          "Delete ${value} ?",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("#461482")),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 25)),
                                    Container(
                                      child: SizedBox(
                                        width: 130,
                                        height: 40,
                                        child: ElevatedButton.icon(
                                          icon: Icon(Icons.check),
                                          style: ElevatedButton.styleFrom(
                                            primary: HexColor("#461482"),
                                            onPrimary: Colors.white,
                                            side: BorderSide(
                                                width: 2, color: Colors.black),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          label: Text("Yes",
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () {
                                            deleteFlashcards();
                                            deleteCategory();
                                            value = "Uncategorize";
                                            Navigator.of(context).pop();
                                            Fluttertoast.showToast(
                                                msg: "Delete Sucessfully",
                                                gravity: ToastGravity.CENTER);
                                          },
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 20)),
                                    Container(
                                      child: SizedBox(
                                        width: 130,
                                        height: 40,
                                        child: ElevatedButton.icon(
                                          icon: Icon(Icons.cancel),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.white,
                                            onPrimary: HexColor("#461482"),
                                            side: BorderSide(
                                                width: 2,
                                                color: HexColor("#461482")),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                          label: Text("No",
                                              style: TextStyle(fontSize: 20)),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          })
                      : showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.amber.shade100,
                                    border: Border.all(
                                        color: Colors.black, width: 3.0),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8),
                                      child: Center(
                                        child: Text(
                                          "Sorry, you cannot delete ${value}!",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor("#461482")),
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                        padding: EdgeInsets.only(top: 25)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: continueButton,
                                    )
                                    // Container(
                                    //   child: SizedBox(
                                    //     width: 130,
                                    //     height: 40,
                                    //     child: ElevatedButton(
                                    //       style: ElevatedButton.styleFrom(
                                    //         primary: HexColor("#461482"),
                                    //         onPrimary: Colors.white,
                                    //         side: BorderSide(
                                    //             width: 2, color: Colors.black),
                                    //         shape: RoundedRectangleBorder(
                                    //           borderRadius:
                                    //               BorderRadius.circular(30.0),
                                    //         ),
                                    //       ),
                                    //       child: Text("Continue",
                                    //           style: TextStyle(fontSize: 20)),
                                    //       onPressed: () {
                                    //         Navigator.of(context).pop();
                                    //       },
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          })
                },
              ),
            ]),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: StreamBuilder<QuerySnapshot>(
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
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;
                  return data['category'] == value
                      ? Card(
                          elevation: 8,
                          shadowColor: HexColor("#461482"),
                          margin: EdgeInsets.all(15),
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          child: ListTile(
                            title: Text(
                              data['word'],
                              style: TextStyle(
                                  color: HexColor("#461482"),
                                  fontSize:
                                      MediaQuery.of(context).textScaleFactor *
                                          20),
                            ),
                            onTap: () => {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15.0)),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.3,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45,
                                        decoration: BoxDecoration(
                                            color: Colors.amber.shade100,
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 3.0),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  color: Colors.red,
                                                  size: 25,
                                                ),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 5),
                                              child: Center(
                                                child: Text(
                                                  "Flashcard Details",
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          HexColor("#461482")),
                                                ),
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                              indent: 20,
                                              endIndent: 20,
                                              thickness: 3,
                                            ),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5)),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Form(
                                                  child: SingleChildScrollView(
                                                child: Container(
                                                  height: 150,
                                                  width: 300,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5)),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Word: ",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: HexColor(
                                                                    "#461482")),
                                                          ),
                                                          Text(
                                                            data['word'],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 17)),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Translation: ",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: HexColor(
                                                                    "#461482")),
                                                          ),
                                                          Text(
                                                            data['translation'],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 17)),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Example Sentence: ",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: HexColor(
                                                                    "#461482")),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 15)),
                                                      Text(
                                                        data['sentence'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  })
                            },
                            trailing: IconButton(
                              icon: Image.asset(
                                "assets/bin.png",
                              ),
                              iconSize: 30,
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0)),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.3,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          decoration: BoxDecoration(
                                              color: Colors.amber.shade100,
                                              border: Border.all(
                                                  color: Colors.black,
                                                  width: 3.0),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Center(
                                                  child: Text(
                                                    "Delete this flashcard ?",
                                                    style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: HexColor(
                                                            "#461482")),
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 25)),
                                              Container(
                                                child: SizedBox(
                                                  width: 130,
                                                  height: 40,
                                                  child: ElevatedButton.icon(
                                                    icon: Icon(Icons.check),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                          HexColor("#461482"),
                                                      onPrimary: Colors.white,
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: Colors.black),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                    ),
                                                    label: Text("Yes",
                                                        style: TextStyle(
                                                            fontSize: 20)),
                                                    onPressed: () {
                                                      words
                                                          .doc(document
                                                              .reference.id)
                                                          .delete();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 20)),
                                              Container(
                                                child: SizedBox(
                                                  width: 130,
                                                  height: 40,
                                                  child: ElevatedButton.icon(
                                                    icon: Icon(Icons.cancel),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.white,
                                                      onPrimary:
                                                          HexColor("#461482"),
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: HexColor(
                                                              "#461482")),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                    ),
                                                    label: Text("No",
                                                        style: TextStyle(
                                                            fontSize: 20)),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                          ),
                        )
                      : Padding(padding: EdgeInsets.only(top: 0.1));
                }).toList(),
              );
            },
          ),
        ));
  }
}
