import 'package:flutter/material.dart';
import 'dart:math' as math;

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  double targetValue = 24.0;

  double _sliderValue = 0;
  Color _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    //1st example

    // return TweenAnimationBuilder<double>(
    //   tween: Tween<double>(begin: 0, end: targetValue),
    //   duration: const Duration(seconds: 1),
    //   builder: (BuildContext context, double size, Widget? child) {
    //     return IconButton(
    //       iconSize: size,
    //       color: Colors.blue,
    //       icon: child!,
    //       onPressed: () {
    //         setState(() {
    //           targetValue = targetValue == 24.0 ? 48.0 : 24.0;
    //         });
    //       },
    //     );
    //   },
    //   child: const Icon(Icons.aspect_ratio),
    // );

    //2nd example

    // return Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Image.asset(
    //       'assets/universe.jpeg',
    //       height: double.infinity,
    //       fit: BoxFit.cover,
    //     ),
    //     TweenAnimationBuilder<double>(
    //       tween: Tween<double>(begin: 0, end: 2 * math.pi),
    //       duration: const Duration(seconds: 2),
    //       builder: (BuildContext context, double turn, Widget? child) {
    //         return Transform.rotate(
    //           angle: turn,
    //           child: child,
    //         );
    //       },
    //       child: Image.asset(
    //         'assets/earth.png',
    //         width: 300,
    //       ),
    //     )
    //   ],
    // );

    //3rd example

    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/universe.jpeg',
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: ColorTween(begin: Colors.white, end: _newColor),
              duration: const Duration(seconds: 2),
              builder: (_, Color? color, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                  child: child,
                );
              },
              // onEnd: () {
              //   setState(() {
              //     _newColor =
              //         _newColor == Colors.red ? Colors.white : Colors.red;
              //   });
              // },
              child: Image.asset(
                'assets/sun.png',
                width: 300,
              ),
            ),
            Slider.adaptive(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value;
                    _newColor =
                        Color.lerp(Colors.white, Colors.red, _sliderValue)!;
                  });
                })
          ],
        )
      ],
    );
  }
}
