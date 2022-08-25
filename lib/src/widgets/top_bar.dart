import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class TopBAr extends StatelessWidget {
  const TopBAr({super.key});

  @override
  Widget build(BuildContext context) {
    // TextBaseline baseline = TextBaseline.alphabetic;
    return Container(
      padding: EdgeInsets.only(
        top: 15.dynamicHeight(),
        left: 20.dynamicWidth(),
        right: 15.dynamicWidth(),
      ),
      width: double.infinity,
      height: Get.height * .11,
      decoration: BoxDecoration(
          color: ColorResources.secondaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              20.dynamicRadius(),
            ),
            bottomRight: Radius.circular(
              20.dynamicRadius(),
            ),
          ),
          boxShadow: const [BoxShadow(offset: Offset(0, 1), blurRadius: 3)]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: Get.width * .65,
              height: 48.dynamicHeight(),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          20.dynamicRadius(),
                        ),
                        borderSide: BorderSide.none),
                    filled: true,
                    fillColor: Colors.yellow.withAlpha(48)),
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
