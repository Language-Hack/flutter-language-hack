import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';
import 'package:rxdart/rxdart.dart';

final List data = [
  {
    'color': Colors.red,
  },
  {
    'color': Colors.blue,
  },
  {
    'color': Colors.green,
  }
];

BehaviorSubject<List<Card>> cards = BehaviorSubject.seeded([
  Card(
    data[0]['color'],
  ),
  Card(
    data[1]['color'],
  ),
  Card(
    data[2]['color'],
  ),
]);

class DumFlashcard extends StatefulWidget {
  const DumFlashcard({Key key}) : super(key: key);

  @override
  _DumFlashcardState createState() => _DumFlashcardState();
}

class _DumFlashcardState extends State<DumFlashcard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                cards.add([
                  Card(
                    data[0]['color'],
                  ),
                  Card(
                    data[1]['color'],
                  ),
                  Card(
                    data[2]['color'],
                  ),
                ]);
                setState(() {});
              },
              icon: Icon(Icons.restore))
        ],
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          child: StreamBuilder<List<Card>>(
            stream: cards,
            builder: (context, snapshot) {
              if (!snapshot.hasData) return SizedBox();
              final data = snapshot.data;
              return Stack(
                children: data,
              );
            },
          ),
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  // Made to distinguish cards
  // Add your own applicable data here
  final Color color;
  Card(this.color);

  @override
  Widget build(BuildContext context) {
    return Swipable(
      // Set the swipable widget
      verticalSwipe: false,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: color,
        ),
      ),
      onSwipeStart: (details) {},
      onSwipeCancel: (position, details) {},
      onSwipeEnd: (position, details) {},
      onPositionChanged: (details) {},
      onSwipeLeft: (finalPosition) {
        cards.add([
          ...cards.value,
        ]);
        print("Swipe Left");
      },
      onSwipeRight: (finalPosition) {},
      // onSwipeRight, left, up, down, cancel, etc...
    );
  }
}
