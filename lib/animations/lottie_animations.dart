import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget hiAnimation(BuildContext context, double width) {
  return Lottie.asset('animations/hi.json',
      height: width, frameRate: FrameRate.max);
}

Widget bgAnimation(BuildContext context) {
  return Container(
    color: Colors.black,
    child: Lottie.asset('animations/bg_laptop.json',
        width: MediaQuery.of(context).size.width * 1.2,
        height: MediaQuery.of(context).size.height * 1.3,
        fit: BoxFit.fill),
  );
}

Widget bgAnimationMobile(BuildContext context) {
  return Container(
    color: Colors.black,
    child: Lottie.asset('animations/bg_laptop.json',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        fit: BoxFit.contain),
  );
}

Widget astronautAnimations(BuildContext context) {
  return Lottie.asset('animations/astronaut.json',
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.centerRight);
}
