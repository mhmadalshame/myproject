import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/onbording_controller.dart';
import 'package:universityservices/view/widget/onboarding/custombutton.dart';
import 'package:universityservices/view/widget/onboarding/customslider.dart';
import 'package:universityservices/view/widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          child: CustomSliderOnBoarding(),
        ),
        Expanded(
          flex: 1,
          child: Column(children: [
            CustomDotControllerOnBoarding(),
            Spacer(flex: 2),
            CustomButtonOnBoarding(),
          ]),
        )
      ],
    )));
  }
}
