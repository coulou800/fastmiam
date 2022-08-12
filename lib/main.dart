import 'package:flutter/material.dart';
import 'package:fastmiam/src/app/app.dart' show App;

void main() async{
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(const App());
}
