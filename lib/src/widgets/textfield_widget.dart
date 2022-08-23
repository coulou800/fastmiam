import 'package:fastmiam/src/utils/utils.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField(
      {Key? key,
      this.size,
      this.hintSize,
      this.hint,
      this.textColor = Colors.black45,
      this.hintColor = Colors.black45,
      this.textAlign = TextAlign.left,
      this.controller,
      this.onChanged,
      this.inputType})
      : super(key: key);
  final Function(String)? onChanged;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final double? size, hintSize;
  final TextAlign textAlign;
  final Color textColor, hintColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorResources.secondaryColor,
      textAlign: textAlign,
      textAlignVertical: TextAlignVertical.bottom,
      onChanged: onChanged,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
        fontSize: size,
      ),
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
              color: hintColor,
              fontSize: hintSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorResources.secondaryColor)),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorResources.mainColor))),
    );
  }
}
