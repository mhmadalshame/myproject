// ignore_for_file: unnecessary_overrides

import 'package:get/get.dart';
import 'package:universityservices/core/constant/routes.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  // ignore: non_constant_identifier_names
  late String VerfiyCodeSignUp;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
