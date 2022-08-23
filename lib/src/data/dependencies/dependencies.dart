import 'package:fastmiam/src/data/controllers/home_page_controller.dart';
import 'package:fastmiam/src/data/controllers/phone_verification_controller.dart';
import 'package:fastmiam/src/data/services/auth_service.dart';
import 'package:get/get.dart';

void init() {
  //Controllers
  Get.lazyPut(() => AuthService());
  Get.lazyPut(() => HomePageController());
  Get.lazyPut(() => PhoneVerificationController());
}
