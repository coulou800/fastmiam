import 'package:fastmiam/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HotListItemWidget extends StatelessWidget {
  final int index;
  const HotListItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 32),
      width: 300,
      child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.dynamicRadius()),
                image: DecorationImage(
                    image: AssetImage('assets/images/doner.jpg'))),
          )),
    );
  }
}
