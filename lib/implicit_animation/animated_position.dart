import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 350,
      child: Stack(
        children: <Widget>[
          AnimatedPositioned(
            // width: selected ? 200.0 : 50.0,
            // height: selected ? 50.0 : 200.0,
            // top: selected ? 50.0 : 150.0,
            top: selected ? 100.0 : 150.0,
            duration: const Duration(seconds: 10),
            // curve: Curves.fastOutSlowIn,
            curve: SineCurve(count: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const ColoredBox(
                color: Colors.blue,
                child: Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SineCurve extends Curve {
  final double count;
  const SineCurve({this.count = 1});
  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}
