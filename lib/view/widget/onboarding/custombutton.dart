import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/onbording_controller.dart';

import '../../../core/constant/color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: AppColor.orang,
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 1),
          onPressed: () {
            controller.next();
          },
          child: const Text(
            "Continue",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColor.white),
          )),
    );
  }
}
