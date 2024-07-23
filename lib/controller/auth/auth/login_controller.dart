// ignore_for_file: avoid_print, non_constant_identifier_names, unused_element, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

import 'package:universityservices/core/shared/share.dart';

abstract class LoginContrller extends GetxController {
  Login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginContrller {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  bool isshowpassword = true;
  howpassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  Login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("valid");
      checkLogin();
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.SingUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }

  void checkLogin() async {
    String posturl = "${Share.Url}getUser1";
    Response response =
        await get(Uri.parse("$posturl/${email.text}/${password.text}"));
    if (email.text.contains('adminlecture') &&
        password.text == "adminlecture") {
      Get.offNamed(AppRoute.Lectures);
    } else if (email.text.contains('adminad') && password.text == "adminad") {
      // Get.offNamed(AppRoute.Advertisements);
    } else if (email.text.contains('superadmin') &&
        password.text == "superadmin") {
      Get.offNamed(AppRoute.SuperAdmin);
    } else if (email.text.contains('adminaddnews') &&
        password.text == "adminaddnews") {
      Get.offNamed(AppRoute.AddNews);
    } else if (email.text.contains('adminaddpdf') &&
        password.text == "adminaddpdf") {
      Get.offNamed(AppRoute.AddPdf);
    } else if (email.text.contains('adminmangerequest') &&
        password.text == "adminmangerequest") {
      Get.offNamed(AppRoute.MangeRequest);
    } else if (email.text.contains('adminmangesport') &&
        password.text == "adminmangesport") {
      Get.offNamed(AppRoute.MangeSport);
    } 
     else if (email.text.contains('adminmangedonation') &&
        password.text == "adminmangedonation") {
      Get.offNamed(AppRoute.MangeDonation);
    }
     else if (email.text.contains('adminmangecomplaints') &&
        password.text == "12345") {
      Get.offNamed(AppRoute.MangeComplaints);
    }
    else {
      if (response.statusCode == 200) {
        print(response.statusCode);

        if (response.body.length > 5) {
          // ScaffoldMessenger.of(context).showSnackBar(snackBar);
          print(response.body);
          print("hi");
          Get.showSnackbar(const GetSnackBar(
            title: 'Email or Password incorrect',
            message: 'here error in email or password',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.red,
          ));
        } else {
          print(response.body.length);
          String postur2 = "${Share.Url}loginIsStudent";
          Response response1 =
              await get(Uri.parse("$postur2/${response.body}/"));
          print(response1.body.length);
          if (response1.body.length > 2) {
            Get.offNamed(AppRoute.HomeScreen, arguments: response1.body);
          }
          else if(response1.body.length == 2){
            Get.offNamed(AppRoute.UserForm, arguments: response.body);
          }
           else {
            Get.offNamed(AppRoute.UserForm, arguments: response1.body);
          }
          Get.showSnackbar(const GetSnackBar(
            title: 'Sucssesfully',
            message: 'Login sucsessfully',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.gren,
          ));
        }
      } else {
        print(response.statusCode);
      }
    }
  }
}
