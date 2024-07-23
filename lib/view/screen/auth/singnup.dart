import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/auth/signupcontroller.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/functions/alertexetapp.dart';
import 'package:universityservices/core/functions/validinput.dart';
import 'package:universityservices/view/widget/login&singup/coustmtextformauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtextbodyauth.dart';
import 'package:universityservices/view/widget/login&singup/coustomtitileauth%20copy.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';
import 'package:universityservices/view/widget/login&singup/textsignup%20copy.dart';

class SingUp extends StatelessWidget {
  const SingUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: const Text(
          'Sing Up',
          style: TextStyle(
            color: AppColor.orang,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(
          init: SignUpControllerImp(),
          builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formstate,
              child: ListView(
                children: [
                  const CoustomTextTitleAuth(text: "Welcome Back"),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextBodyAuth(
                    text: "Sing Up With Your Email And password ",
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 2, 30, "Username");
                    },
                    hintText: "Enter Your Username",
                    iconData: Icons.person_outline,
                    labeltext: "Username",
                    mycontroller: controller.username,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                    hintText: "Enter Your Email",
                    iconData: Icons.email_outlined,
                    labeltext: "Email",
                    mycontroller: controller.email,
                  ),
                  CustomTextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, 5, 30, "Password");
                    },
                    hintText: "Enter Your Password",
                    iconData: Icons.lock_outline,
                    labeltext: "Password",
                    mycontroller: controller.password,
                  ),
                  CustomTextFormAuth(
                    isNumber: true,
                    valid: (val) {
                      return validInput(val!, 0, 10, "phone");
                    },
                    hintText: "Enter Your phone",
                    iconData: Icons.phone_android_outlined,
                    labeltext: "phone",
                    mycontroller: controller.phone,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  customBottomAuth(
                    text: "Sing Up",
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CoustmTextSignUpOrSingIn(
                    textone: " have an accont ? ",
                    texttwo: " Sign In ",
                    onTap: () {
                      controller.goToSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
