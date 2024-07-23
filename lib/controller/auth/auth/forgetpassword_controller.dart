// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:universityservices/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  checkemail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
    } else {
      print("Not Valid");
    }
  }

  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoute.VerFiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
