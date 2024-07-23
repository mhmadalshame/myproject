// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/home_controler.dart';
import 'package:universityservices/core/constant/color.dart';

class ListServicesHome extends GetView<HomeControllerImp> {
  const ListServicesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          itemCount: 6,
          scrollDirection: Axis.horizontal,

          // gridDelegate:
          // SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: ((context, i) {
            return ServicesHome();
          })),
    );
  }
}

class ServicesHome extends StatelessWidget {
  // final ServicesHome servicesmodel;

  const ServicesHome({
    super.key,
    //required this.servicesmodel
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child: Image.asset(
            "assets/images/8.png",
            height: 120,
            width: 160,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          alignment: Alignment.bottomCenter,
          child: const Text(
            textAlign: TextAlign.end,
            "serves ",
            style: TextStyle(
              fontSize: 25,
              color: AppColor.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
