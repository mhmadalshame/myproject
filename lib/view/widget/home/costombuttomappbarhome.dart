// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/homescreen_controler.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/view/widget/home/coustombuttonappbar.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
          color: Color.fromARGB(200, 255, 255, 255),
            shape: const CircularNotchedRectangle() ,
            notchMargin: 30,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length + 1, (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2
                      ? const Spacer()
                      : CustomButtonAppBar(
                          textbutton: controller.bottomappbar[i]['title'],
                          iconData: controller.bottomappbar[i]['icon'],
                          onPressed: () {
                            controller.changePage(i);
                          },
                          active: controller.currentpage == i ? true : false,
                        );
                }),
              ],
            )));
  }
}
