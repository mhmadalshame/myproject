import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:universityservices/core/constant/routes.dart';
import 'package:http/http.dart' as http;
import 'package:universityservices/core/shared/share.dart';

abstract class SiginUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SiginUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;

  late TextEditingController phone;

  @override
  signUp() {
    if (formstate.currentState!.validate()) {
      Get.offAllNamed(AppRoute.VerfiyCodeSignUp);
      signup();
    } else {
      // ignore: avoid_print
      print("Not Valid");
    }
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    username = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }

  signup() {
    String url = "${Share.Url}createUser/";
    http.post(Uri.parse(url),
        body: {'username': email.text, 'password': password.text});
    goToSignIn();
  }
}
