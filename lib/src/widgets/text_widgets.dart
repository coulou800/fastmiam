import 'package:fastmiam/src/utils/utils.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
    this.fontWeight = FontWeight.bold,
    this.size = 22,
    this.family,
    this.color = const Color(
      0xffBB171E,
    ),
  }) : super(key: key);
  final String? family;
  final String text;
  final double size;
  final Color color;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: family,
          color: color,
          fontSize: size.dynamicFontSize(),
          fontWeight: fontWeight),
    );
  }
}

class NormalText extends StatelessWidget {
  const NormalText({
    Key? key,
    required this.text,
    this.size = 12,
    this.color = const Color(0xff706466),
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size.dynamicFontSize(),
      ),
    );
  }
}
