import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider_try_2_animation/screens/all_screens/current_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Pruthvi's Portfolio",
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
        ),
        debugShowCheckedModeBanner: false,
        home: const CurrentScreen());
  }
}
