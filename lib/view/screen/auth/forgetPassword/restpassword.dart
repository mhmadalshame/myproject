import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:universityservices/controller/auth/auth/resetpassword_controller.dart';
import 'package:universityservices/core/functions/validinput.dart';
import 'package:universityservices/view/widget/login&singup/coustmtextformauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtextbodyauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtitileauth%20copy.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';
import '../../../../core/constant/color.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp contrller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: const Text(
            'Reset Password',
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
              child: ListView(
                key: contrller.formstate,
                children: [
                  const CoustomTextTitleAuth(text: "New Password"),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextBodyAuth(
                    text: "Please Enter new Password",
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "Password");
                    },
                    hintText: "Enter Your Password",
                    iconData: Icons.lock_outline,
                    labeltext: "Password",
                    mycontroller: contrller.password,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "Password");
                    },
                    hintText: "Re Enter Your Password",
                    iconData: Icons.lock_outline,
                    labeltext: "Password",
                    mycontroller: contrller.repassword,
                  ),
                  customBottomAuth(
                    text: "Save",
                    onPressed: () {
                      contrller.goToSuccessResetPassword();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )));
  }
}
