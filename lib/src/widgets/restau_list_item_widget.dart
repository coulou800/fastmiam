import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:flutter/material.dart';
import 'package:rate/rate.dart';

class RestauListItemWidget extends StatelessWidget {
  const RestauListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.dynamicHeight(),
        horizontal: 25.dynamicWidth(),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          10.dynamicRadius(),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Heading(
                text: 'La Playa',
                family: 'Inspiration',
                size: 32.dynamicFontSize(),
                color: ColorResources.secondaryColor,
              ),
              SizedBox(
                width: 25.dynamicWidth(),
              ),
              NormalText(
                text: 'restaurant a 1km',
                color: ColorResources.paraColor,
                size: 14.dynamicFontSize(),
              )
            ],
          ),
          Rate(
            allowHalf: true,
            readOnly: true,
            color: ColorResources.mainColor,
            iconSize: 18,
            initialValue: 4.5,
          ),
        ],
      ),
    );
  }
}
