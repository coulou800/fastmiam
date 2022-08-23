import 'package:get/get.dart';

class PhoneVerificationController extends GetxController {
  static String? _phoneNumber;
  set phoneNumber(n) => _phoneNumber = n;
  String? get phoneNumber => _phoneNumber;
}
