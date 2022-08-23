import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  final controller = CarouselController();
  int _index = 0;
  int get index => _index;
  set index(v) => _index = v.value;
}
