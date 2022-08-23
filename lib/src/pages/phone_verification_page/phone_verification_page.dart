import 'package:fastmiam/src/data/controllers/phone_verification_controller.dart';
import 'package:fastmiam/src/data/services/auth_service.dart';
import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/button_widget.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:fastmiam/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});
  static const routeName = '/phoneVerifation';
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    late String code;
    return Scaffold(
      backgroundColor: ColorResources.secondaryColor,
      body: Stack(
        children: [
          Positioned(
            top: (Get.height / 2) * 0.8,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: 5.dynamicHeight(),
                      horizontal: 25.dynamicWidth()),
                  child: Heading(
                    text: 'verification'.toUpperCase(),
                    size: 36.dynamicFontSize(),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NormalText(
                        text: Get.find<PhoneVerificationController>()
                                .phoneNumber ??
                            '+221 70 748 59 63',
                        size: 22.dynamicFontSize(),
                      ),
                      SizedBox(
                        height: 10.dynamicHeight(),
                      ),
                      SizedBox(
                        width: 232.dynamicWidth(),
                        child: TextInputField(
                          controller: controller,
                          onChanged: (value) {
                            code = value;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 32.dynamicHeight(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 45.dynamicHeight(),
            left: (Get.width / 2) * 0.7,
            right: (Get.width / 2) * 0.7,
            child: SizedBox(
              width: 100,
              child: RoundedButtonWidget(
                text: 'verifier',
                onTap: () async => {await Get.find<AuthService>().verify(code)},
              ),
            ),
          )
        ],
      ),
    );
  }
}
