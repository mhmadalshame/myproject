import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:universityservices/controller/auth/auth/forgetpassword_controller.dart';
import 'package:universityservices/core/functions/validinput.dart';
import 'package:universityservices/view/widget/login&singup/coustmtextformauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtextbodyauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtitileauth%20copy.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

import '../../../../core/constant/color.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp contrller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: const Text(
            'Forget Password',
            style: TextStyle(
              color: Color.fromARGB(255, 142, 139, 139),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: contrller.formstate,
              child: ListView(
                children: [
                  const CoustomTextTitleAuth(
                    text: "Check Email",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const CustomTextBodyAuth(
                    text:
                        "Please Enter Your Email Address To Recive A verification code",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 50, "email");
                    },
                    hintText: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    mycontroller: contrller.email,
                  ),
                  customBottomAuth(
                    text: "Check",
                    onPressed: () {
                      contrller.goToVerfiyCode();
                    },
                  ),
                ],
              ),
            )));
  }
}
