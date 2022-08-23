import 'package:fastmiam/src/pages/register_page/register_page_view.dart';
import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/button_widget.dart';
import 'package:fastmiam/src/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fastmiam/src/pages/login_page/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.secondaryColor,
      body: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 48.dynamicHeight()),
              child: const AppLogo(
                width: 320,
                height: 72,
              ),
            ),
          ),
          SizedBox(
            height: 25.dynamicHeight(),
          ),
          Positioned(
              bottom: (Get.height / 2) * 0.3,
              right: (Get.width / 2) * 0.2,
              left: (Get.width / 2) * 0.2,
              child: Column(
                children: [
                  RoundedButtonWidget(
                    onTap: () => {Get.toNamed(LoginPage.routeName)},
                    text: 'S\'identifier',
                    color: ColorResources.mainColor,
                  ),
                  TextButton(
                    onPressed: () => {Get.toNamed(RegisterPage.routeName)},
                    child: Text(
                      'S\'inscrire'.toUpperCase(),
                      style: TextStyle(
                          color: ColorResources.mainColor,
                          fontSize: 18.dynamicFontSize(),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
