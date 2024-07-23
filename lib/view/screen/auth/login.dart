import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/auth/login_controller.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/functions/alertexetapp.dart';
import 'package:universityservices/core/functions/validinput.dart';
import 'package:universityservices/view/widget/login&singup/coustmtextformauth.dart';
// import 'package:universityservices/view/widget/login&singup/coustomtextbodyauth.dart';
// import 'package:universityservices/view/widget/login&singup/coustomtitileauth.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';
import 'package:universityservices/view/widget/login&singup/logoauth.dart';
import 'package:universityservices/view/widget/login&singup/textsignup.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // // ignore: unused_local_variable
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.white,
          elevation: 0.0,
          title: const Text(
            'Sing In',
            style: TextStyle(
              color: AppColor.orang2,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 35),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    const LogoAuth(),
                    const SizedBox(
                      height: 50,
                    ),
                    // const CustomTextTitleAuth(text: "Welcome "),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // const CustomTextBodyAuth(
                    //   text:
                    //       "Sing In With Your Email And password OR Continue with Social Media",
                    // ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    CustomTextFormAuth(
                      isNumber: false,
                      onTapIcon: () {},
                      valid: (val) {
                        return validInput(val!, 5, 100, "email");
                      },
                      mycontroller: controller.email,
                      hintText: "Enter Your Email",
                      iconData: Icons.email_outlined,
                      labeltext: "UserName",
                    ),
                    GetBuilder<LoginControllerImp>(
                      builder: (controller) => CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.howpassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 30, "password");
                        },
                        hintText: "Enter Your Password",
                        iconData: Icons.lock_outline,
                        labeltext: "Password",
                        mycontroller: controller.password,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: const Text(
                        "Forget Password",
                        textAlign: TextAlign.end,
                        style: TextStyle(color: AppColor.backgroundbuttom),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    customBottomAuth(
                      text: "Sing In",
                      onPressed: () {
                        controller.Login();
                        
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextSignUpOrSingIn(
                      textone: "Don't have an account ?",
                      texttwo: "SignUp",
                      onTap: () {
                        controller.goToSignUp();
                      },
                    )
                  ],
                ),
              )),
        ));
  }
}
