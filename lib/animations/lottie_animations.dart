import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget hiAnimation(BuildContext context) {
  return Lottie.asset('animations/hi.json',
      height: MediaQuery.of(context).size.width * 0.04,
      frameRate: FrameRate.max);
}

Widget bgAnimation(BuildContext context) {
  return Lottie.asset('animations/bg_laptop.json',
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 1.2,
      fit: BoxFit.fill);
}

Widget astronautAnimations(BuildContext context) {
  return Lottie.asset('animations/astronaut.json',
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.centerRight);
}
