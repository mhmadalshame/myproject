// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

class Pagedetails2 extends StatelessWidget {
  const Pagedetails2({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final args = ModalRoute.of(context)!.settings.arguments;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(213, 133, 223, 60),
              Color.fromARGB(246, 43, 100, 74),
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 40),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColor.white,
                          size: 35,
                        ),
                        onPressed: () {
                          // Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    "FootBall",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 30,
                        fontFamily: AutofillHints.familyName,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: height * 0.3,
                    // color: Colors.black,
                    child: LayoutBuilder(builder: (context, Constraints) {
                      double innerHeight = Constraints.maxHeight;
                      double innerWidth = Constraints.maxWidth;
                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.80,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // color: AppColor.orang2
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    'assets/images/12.png',
                                    width: 500,
                                    height: innerHeight * 0.7,
                                    fit: BoxFit.fill,
                                  ),
                                ]),
                              )),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                      height: height * 0.6,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(223, 238, 233, 233)),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "FootBall",
                              style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 30,
                              ),
                            ),
                            Divider(
                              thickness: 2.5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Text(
                                      "A football competition is a sporting competition in which teams from different countries or regions participate. Teams compete on the field to win and outperform their opponents by scoring the highest number of goals.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Register:",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontSize: 25),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    child: Text(
                                      "“Join now for our exciting football competition!” We invite all football fans and football talents to participate in our wonderful football competition. If you want to test your skills and compete with distinguished players, don't miss this great opportunity.",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Get.offNamed(AppRoute.Sport1, arguments: {'args':args,'sporttype':'football'});
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColor.primaryColor,
                        size: 35,
                      ),
                      label: const Text(
                        'Register',
                        style: TextStyle(
                            color: AppColor.primaryColor, fontSize: 20),
                      ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
