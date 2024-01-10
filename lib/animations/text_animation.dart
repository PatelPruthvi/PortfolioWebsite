// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AnimateText extends StatefulWidget {
  final List<Text> textToAnimate;
  final String cursor;
  final Duration pauseDuration;
  final Duration speed;
  final TextStyle? animatedTextStyle;
  const AnimateText(
      {Key? key,
      required this.textToAnimate,
      required this.cursor,
      required this.pauseDuration,
      required this.speed,
      this.animatedTextStyle})
      : super(key: key);

  @override
  State<AnimateText> createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText> {
  String animatedText = "";
  String cursor = '';
  int i = 0, j = 0;
  void cursorGetter() {
    cursor = widget.cursor;
  }

  void incrementalText() {
    setState(() {
      animatedText = animatedText + widget.textToAnimate[j].data![i];
      i++;
    });

    if (animatedText == widget.textToAnimate[j].data!) {
      i = 0;
      j = (j + 1) % widget.textToAnimate.length;
      Future.delayed(widget.pauseDuration).then((value) => decrementalText());
    } else {
      Future.delayed(widget.speed).then((val) => incrementalText());
    }
  }

  void decrementalText() {
    setState(() {
      animatedText = animatedText.substring(0, animatedText.length - 1);
    });

    if (animatedText.isEmpty) {
      Future.delayed(widget.pauseDuration).then((value) => incrementalText());
    } else {
      Future.delayed(widget.speed).then((val) => decrementalText());
    }
  }

  void cursorChange() {
    if (cursor.isEmpty) {
      Future.delayed(widget.speed).then((value) {
        setState(() {
          cursor = widget.cursor;
        });

        cursorChange();
      });
    } else {
      Future.delayed(widget.speed).then((value) {
        if (mounted) {
          setState(() {
            cursor = '';
          });
        }
        cursorChange();
      });
    }
  }

  @override
  void initState() {
    incrementalText();
    cursorChange();
    cursorGetter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('$animatedText $cursor',
        style: widget.animatedTextStyle ?? const TextStyle());
  }
}

Text getAnimatedText(BuildContext context) {
  return const Text("");
}
