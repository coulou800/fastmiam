import 'package:fastmiam/src/utils/utils.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double width, height;
  const AppLogo({Key? key,  this.width = 220,  this.height = 200,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.dynamicWidth(),
      height: height.dynamicHeight(),
      padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 5.0),
      decoration: const BoxDecoration(
        image:  DecorationImage(image:AssetImage('assets/images/Fastmiam.png',
        ),
        // fit: BoxFit.cover
        ),

      ),
    );
   {

  }}
}
