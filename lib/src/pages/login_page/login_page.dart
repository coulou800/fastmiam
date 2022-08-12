import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/button_widget.dart';
import 'package:fastmiam/src/widgets/logo.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:fastmiam/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                color: ColorResources.secondaryColor,
                height: 310.dynamicHeight(),
                child: SizedBox(
                    width: 100.dynamicWidth(),
                    height: 100.dynamicHeight(),
                    child: const AppLogo()),
              ),
            ),
            Positioned(
              top: 280.dynamicHeight() - 52.dynamicHeight(),
              left: 0,
              right: 0,
              bottom: 45.dynamicHeight() - 25,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(96),
                      topRight: Radius.circular(96)),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 25.dynamicHeight(),
                    left: 48.dynamicWidth(),
                    right: 48.dynamicWidth(),
                  ),
                  child: Column(
                    children: [
                      Heading(
                        text: 'identification'.toUpperCase(),
                      ),
                      FormField(
                          builder: (state) => Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(
                                        15, 48, 15, 0),
                                    child: const TextInputField(
                                      hint: 'Telephone',
                                      inputType: TextInputType.phone,
                                      textAlign: TextAlign.center,
                                      size: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15.dynamicHeight(),
                                  ),
                                  NormalText(
                                    text:
                                        'Un code vous sera envoye sur ce numero. Veillez a bien verifier le numero svp',
                                    size: 12.dynamicHeight(),
                                  ),
                                  SizedBox(
                                    height: 76.dynamicHeight(),
                                  ),
                                  RoundedButtonWidget(
                                    onTap: () => {},
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
