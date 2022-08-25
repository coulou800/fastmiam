// ignore_for_file: unnecessary_this

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StringResources {
  static const appName = 'FastMiam';
}

class ColorResources {
  static Color mainColor = const Color(0xffBB171E);
  static Color secondaryColor = const Color(0xffFA9E00);
  static Color paraColor = const Color(0xff706466);
}

extension DynamicDim on num {
  static double exWidth = 360.0;
  static double exHeight = 640.0;

  static double aspectRatio = Get.width / Get.height;

  static Orientation orientation = Get.mediaQuery.orientation;

  double dynamicWidth() {
    double value = this.toDouble();
    double factor = exWidth / value;
    return (Get.width / factor) * aspectRatio;
  }

  double dynamicHeight() {
    double value = this.toDouble();
    double factor = exHeight / value;

    return (Get.height / factor) * aspectRatio;
  }

  double dynamicRadius() {
    double r = (exHeight * exWidth) / 2; //1.777777778

    double value = this.toDouble(); //value = 10
    double factor = (r / value); //
    double t = (Get.height * Get.width) / 2;
    if (kDebugMode) {
      print('radius: $value  dynamicRadius: ${t / factor}');
    }
    return t / factor;
  }

  double dynamicFontSize() {
    double r = (exHeight * exWidth) / 2;
    // print(r);
    double value = this.toDouble();
    double factor = (r * value) / aspectRatio;
    double t = (Get.height * Get.width) / 2;
    // print('valeur: $value dynamicVal: ${t / factor}');
    return t / factor;
  }
}
