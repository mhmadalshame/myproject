import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/onbording_controller.dart';
import 'package:universityservices/data/datasurce/static.dart';

import '../../../core/constant/color.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onpageChanged(val);
        },
        itemCount: onBoardingList.length,
        itemBuilder: (context, i) => Column(children: [
              const SizedBox(height: 70),
              Image.asset(
                onBoardingList[i].image!,
                width: 300,
                height: 300,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 50),
              Text(
                onBoardingList[i].title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: AppColor.orang),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  onBoardingList[i].body!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      height: 2,
                      color: AppColor.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              )
            ]));
  }
}
