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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 220.dynamicWidth(),
              height: 200.dynamicHeight(),
              child: const AppLogo(),
            ),
          ),
          RoundedButtonWidget(
            onTap: () => {Get.offAndToNamed(LoginPage.routeName)},
            text: 'S\'identifier',
            color: ColorResources.mainColor,
          ),
          TextButton(
            onPressed: () => {print(Get.width), print(Get.height)},
            child: Text(
              'S\'inscrire',
              style: TextStyle(
                color: ColorResources.mainColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
