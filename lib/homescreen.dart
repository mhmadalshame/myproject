// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/homescreen_controler.dart';
import 'package:universityservices/core/constant/color.dart';

import 'package:universityservices/view/widget/home/costombuttomappbarhome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
       
        backgroundColor: AppColor.background,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBarHome(),
        body: controller.listPage.elementAt(controller.currentpage),
      ),
    );
  }
}
