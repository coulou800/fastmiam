import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget({Key? key, required this.text, this.color = const Color(0xffBB171E), this.textColor = const Color(0xffFA9E00),  this.onTap}) : super(key: key);
  final String text;
  final Color color, textColor;
  final onTap;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: color,
      shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      ),
      textColor: textColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
        child: Text(text,style: TextStyle(fontWeight: FontWeight.bold),),
      ));
  }
}
