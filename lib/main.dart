import 'package:animation_in_flutter/implicit_animation/animated_position.dart';
import 'package:flutter/material.dart';
import 'implicit_animation/animated_container.dart';
import 'implicit_animation/tween_animation_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          // child: AnimatedContainerExample(),
          child: AnimatedPositionedExample(),
          // child: TweenAnimationBuilderExample(),
        ),
      ),
    );
  }
}
