import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/onbording_controller.dart';
import 'package:universityservices/data/datasurce/static.dart';
import '../../../core/constant/color.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 7),
                          duration: const Duration(milliseconds: 900),
                          width: controller.currentPage == index ? 15 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppColor.orang,
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ))
              ],
            )));
  }
}
