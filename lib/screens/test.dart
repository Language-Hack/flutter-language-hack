import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_swipable/flutter_swipable.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StreamController<double> _controller = StreamController<double>();

    double swipeAngle = math.pi / 4;

    return Scaffold(
        body: Center(
      child: Container(
        padding: EdgeInsets.only(top: 5),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3))
        ]),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        child: Swipable(
            verticalSwipe: false,
            swipe: _controller.stream,
            child: Stack(
              children: [
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.red),
                IconButton(
                    onPressed: () => _controller.add(swipeAngle),
                    icon: Icon(Icons.arrow_left))
              ],
            )),
      ),
    ));
  }
}
