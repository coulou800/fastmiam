import 'package:fastmiam/src/data/controllers/phone_verification_controller.dart';
import 'package:fastmiam/src/data/models/client.dart';
import 'package:fastmiam/src/data/services/auth_service.dart';
import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/button_widget.dart';
import 'package:fastmiam/src/widgets/logo.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:fastmiam/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = 'register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addController = TextEditingController();

    String? name;
    String? number;
    String? address;
    String? date;

    late final Client client;
    return Scaffold(
        // resizeToAvoidBottomInset: true,
        body: Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(
              25.dynamicWidth(),
              25.dynamicHeight(),
              0,
              10.dynamicHeight(),
            ),
            color: ColorResources.secondaryColor,
            height: 180.dynamicHeight(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      width: 300.dynamicWidth(),
                      height: 56.dynamicHeight(),
                      child: const AppLogo()),
                ),
                Heading(
                  text: 'Bonjour,',
                  size: 48.dynamicFontSize(),
                ),
                NormalText(
                  text: 'Heureux de vous compter parmis nous',
                  size: 18.dynamicFontSize(),
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 200.dynamicHeight() - 52.dynamicHeight(),
          left: 0,
          right: 0,
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
                      blurRadius: 1,
                      spreadRadius: 1)
                ]),
            child: Container(
              padding: EdgeInsets.only(
                top: 25.dynamicHeight(),
                left: 48.dynamicWidth(),
                right: 48.dynamicWidth(),
              ),
              child: Column(
                children: [
                  Heading(
                    text: 'Inscription'.toUpperCase(),
                    size: 24.dynamicFontSize(),
                  ),
                  FormField(builder: (state) {
                    return Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(8, 10, 8, 0),
                          child: Column(
                            children: [
                              TextInputField(
                                controller: nameController,
                                hint: 'Nom complet',
                                onChanged: (value) {
                                  name = value;
                                },
                                hintSize: 18.dynamicFontSize(),
                                inputType: TextInputType.name,
                                size: 18.dynamicFontSize(),
                              ),
                              TextInputField(
                                controller: dateController,
                                hint: 'Date de naissance',
                                onChanged: (value) {
                                  date = value;
                                },
                                hintSize: 18.dynamicFontSize(),
                                inputType: TextInputType.datetime,
                                size: 18.dynamicFontSize(),
                              ),
                              TextInputField(
                                controller: phoneController,
                                hint: 'Telephone',
                                onChanged: (value) {
                                  number = value;
                                },
                                hintSize: 18.dynamicFontSize(),
                                inputType: TextInputType.phone,
                                size: 18.dynamicFontSize(),
                              ),
                              TextInputField(
                                controller: addController,
                                hint: 'addresse complet',
                                onChanged: (value) {
                                  address = value;
                                },
                                hintSize: 18.dynamicFontSize(),
                                inputType: TextInputType.name,
                                size: 18.dynamicFontSize(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.dynamicHeight(),
                        ),
                        RoundedButtonWidget(
                          onTap: () async => {
                            Get.find<PhoneVerificationController>()
                                .phoneNumber = number,
                            client = Client(
                                name: name,
                                age: date,
                                phone: number,
                                address: address),
                            await Get.find<AuthService>().signUp(client),
                          },
                          text: 'verifier'.toUpperCase(),
                        )
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
