import 'package:fastmiam/src/pages/landing_page/landing_Page.dart';
import 'package:fastmiam/src/pages/register_page/register_page_view.dart';
import 'package:flutter/material.dart';
import 'package:fastmiam/src/utils/utils.dart' as utils;
import 'package:get/get.dart';
import 'package:fastmiam/src/pages/login_page/login_page.dart';
import 'package:fastmiam/src/pages/landing_page/landing_Page.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context){
    return  GetMaterialApp(
      title: utils.StringResources.appName,
      theme: ThemeData(
        primaryColor: utils.ColorResources.mainColor,
      ),
      themeMode: ThemeMode.light,
      darkTheme: ThemeData.dark(),
      home: const RegisterPage(),
      // routes: {
      //   LoginPage.routeName: (context) => const LoginPage(),
      //   RegisterPage.routeName: (context) => const RegisterPage(),
      // },
    );
  }
}