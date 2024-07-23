// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:universityservices/controller/auth/auth/verifycoode_controller.dart';
import 'package:universityservices/view/widget/login&singup/coustomtextbodyauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtitileauth%20copy.dart';

import '../../../../core/constant/color.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp contrller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: const Text(
            'Verification Code',
            style: TextStyle(
              color: Color.fromARGB(255, 142, 139, 139),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: ListView(
              children: [
                const CoustomTextTitleAuth(text: "Check Code"),
                const SizedBox(
                  height: 20,
                ),
                const CustomTextBodyAuth(
                  text: "Please Enter The Digit Code Sent To",
                ),
                const SizedBox(
                  height: 50,
                ),
                OtpTextField(
                  fieldWidth: 50.0,
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  borderColor: Color.fromARGB(255, 235, 250, 24),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    contrller.goToResetPassword();
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            )));
  }
}
