// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:universityservices/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  ResetPassword();
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController password;
  late TextEditingController repassword;

  @override
  ResetPassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSuccessResetPassword() {
    Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();

    super.dispose();
  }
}
