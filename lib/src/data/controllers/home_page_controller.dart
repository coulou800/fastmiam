import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get to => Get.find();
  final controller = CarouselController();
  final index = 0.0.obs;
  get indexValue => index.value;
  set index(v) => index.value = v.toDouble();
}
