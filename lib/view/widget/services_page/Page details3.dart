// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

class Pagedetails3 extends StatelessWidget {
  const Pagedetails3({super.key});

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
                   Color.fromARGB(216, 240, 181, 113),
              Color.fromARGB(246, 202, 131, 55),
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
                        onPressed: () {},
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: 2,
                  // ),
                  const Text(
                    "Basketball",
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
                                    'assets/images/14.png',
                                    width: 500,
                                    height: innerHeight * 0.5,
                                    fit: BoxFit.fill,
                                  ),
                                ]),
                              )),
                        ],
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: height * 0.7,
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
                              "Basketball",
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
                                      "Basketball is a popular team sport loved around the world. The match consists of two teams, with each team trying to score as many points as possible by putting the ball in the opponent's basket.",
                                      style: TextStyle(
                                          fontSize: 16,
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
                                      "Do you like basketball? Would you like to join a great team and experience playing in exciting competitions? Then we have a great opportunity waiting for you! \nWe announce the opening of registration for our basketball team. Whether you are a beginner or have previous experience in the game, you are invited to join us. We are looking for motivated and committed players to enhance their athletic abilities and develop their basketball skills",
                                      style: TextStyle(
                                          fontSize: 14,
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
                            Get.offNamed(AppRoute.Sport1, arguments: {'args':args,'sporttype':'basketball'});


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
