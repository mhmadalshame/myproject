// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/auth/successresetpasworde_controller.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';
import '../../../../core/constant/color.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp contrller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.white,
        elevation: 0.0,
        title: const Text(
          'Success',
          style: TextStyle(
            color: AppColor.orang,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: AppColor.orang,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Title(
                  color: Colors.black,
                  child: const Text(
                    "Congralualions",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: AppColor.grey2),
                  )),
              const Text(
                "Successfully approved",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: AppColor.black),
              ),
              const Spacer(),
              Container(
                width: double.infinity,
                child: customBottomAuth(
                  text: "Go To Login",
                  onPressed: () {
                    contrller.goToPageLogin();
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              )
            ]),
      ),
    );
  }
}
