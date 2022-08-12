import 'dart:ui';

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
  double dynamicWidth() {
    double exWidth = 360.0;
    double value = this.toDouble();
    double factor = exWidth / value;
    return Get.width / factor;
  }

  double dynamicHeight() {
    double exHeight = 640.0;
    double value = this.toDouble();
    double factor = exHeight / value;
    return Get.height / factor;
  }
}
