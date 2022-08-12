import 'package:fastmiam/src/utils/utils.dart';
import 'package:fastmiam/src/widgets/button_widget.dart';
import 'package:fastmiam/src/widgets/logo.dart';
import 'package:fastmiam/src/widgets/text_widgets.dart';
import 'package:fastmiam/src/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = 'register';
  const RegisterPage({Key? key}) : super(key: key);

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
                decoration: BoxDecoration(
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
                        text: 'Inscription'.toUpperCase(),
                      ),
                      FormField(
                          builder: (state) => Column(
                                children: [
                                  Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 20, 8, 0),
                                    child: Column(
                                      children: const [
                                        TextInputField(
                                          hint: 'Nom complet',
                                          hintSize: 18,
                                          inputType: TextInputType.name,
                                          size: 18,
                                        ),
                                        TextInputField(
                                          hint: 'Date de naissance',
                                          hintSize: 18,
                                          inputType: TextInputType.datetime,
                                          size: 18,
                                        ),
                                        TextInputField(
                                          hint: 'Telephone',
                                          hintSize: 18,
                                          inputType: TextInputType.phone,
                                          size: 18,
                                        ),
                                        TextInputField(
                                          hint: 'addresse complet',
                                          hintSize: 18,
                                          inputType: TextInputType.name,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 45.dynamicHeight(),
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
