import 'package:fastmiam/src/utils/utils.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  const RoundedButtonWidget(
      {Key? key,
      required this.text,
      this.color = const Color(0xffBB171E),
      this.textColor = const Color(0xffFA9E00),
      this.onTap})
      : super(key: key);
  final String text;
  final Color color, textColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        elevation: 2,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.dynamicRadius()),
        ),
        textColor: textColor,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 10.0.dynamicHeight(), horizontal: 5.dynamicWidth()),
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(
              text.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14.dynamicFontSize()),
            ),
          ),
        ));
  }
}
