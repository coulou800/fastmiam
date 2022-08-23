import 'package:fastmiam/src/utils/utils.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double width, height;
  const AppLogo({
    Key? key,
    this.width = 160,
    this.height = 120,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.dynamicWidth(),
      height: height.dynamicHeight(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(
            'assets/images/Fastmiam.png',
          ),
          // fit: BoxFit.cover
        ),
      ),
    );
  }
}
