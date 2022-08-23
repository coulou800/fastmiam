import 'package:fastmiam/src/data/controllers/phone_verification_controller.dart';
import 'package:fastmiam/src/data/services/auth_service.dart';
import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/button_widget.dart';
import 'package:fastmiam/src/widgets/logo.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:fastmiam/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? phone;
    final TextEditingController controller = TextEditingController();
    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 25.dynamicHeight(),
                    horizontal: 10.dynamicWidth()),
                color: ColorResources.secondaryColor,
                height: 200.dynamicHeight(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SizedBox(
                          width: 248.dynamicWidth(),
                          height: 56.dynamicHeight(),
                          child: const AppLogo()),
                    ),
                    Heading(
                      text: 'Bonjour,',
                      size: 36.dynamicFontSize(),
                    ),
                    NormalText(
                      text: 'Heureux de vous revoir',
                      size: 22.dynamicFontSize(),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 210.dynamicHeight() - 60.dynamicHeight(),
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32.dynamicRadius()),
                        topRight: Radius.circular(32.dynamicRadius())),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, -2),
                          spreadRadius: 1,
                          blurRadius: 1)
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 15.dynamicHeight(),
                    left: 48.dynamicWidth(),
                    right: 48.dynamicWidth(),
                  ),
                  child: Column(
                    children: [
                      Heading(
                        text: 'identification'.toUpperCase(),
                        size: 24.dynamicFontSize(),
                      ),
                      FormField(
                          builder: (state) => Column(
                                children: [
                                  Container(
                                    constraints: const BoxConstraints(
                                      maxHeight: 25,
                                      maxWidth: double.infinity,
                                    ),
                                    margin: EdgeInsets.fromLTRB(
                                        15.dynamicWidth(),
                                        25.dynamicHeight(),
                                        15.dynamicWidth(),
                                        0),
                                    child: TextInputField(
                                      controller: controller,
                                      hint: 'Telephone',
                                      hintSize: 18.dynamicFontSize(),
                                      onChanged: (value) {
                                        phone = value;
                                      },
                                      inputType: TextInputType.phone,
                                      textAlign: TextAlign.center,
                                      size: 22.dynamicFontSize(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.dynamicHeight(),
                                  ),
                                  NormalText(
                                    text:
                                        'Un code vous sera envoye sur ce numero. Veillez a bien verifier le numero svp',
                                    size: 14.dynamicFontSize(),
                                  ),
                                  SizedBox(
                                    height: 32.dynamicHeight(),
                                  ),
                                  RoundedButtonWidget(
                                    onTap: () {
                                      Get.find<AuthService>().login(phone);
                                      Get.find<PhoneVerificationController>()
                                          .phoneNumber = phone;
                                    },
                                    text: 'verifier'.toUpperCase(),
                                  )
                                ],
                              ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
