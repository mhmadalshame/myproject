// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

class Funny1 extends StatelessWidget {
  const Funny1({super.key});

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
              Color.fromARGB(215, 255, 193, 122),
              Color.fromARGB(246, 238, 148, 52),
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
                    "Music",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 30,
                        fontFamily: AutofillHints.familyName,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: height * 0.4,
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
                                height: innerHeight * 0.85,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // color: AppColor.white
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    'assets/images/17.png',
                                    width: 500,
                                    height: innerHeight * 0.6,
                                    fit: BoxFit.fill,
                                  ),
                                ]),
                              )),
                        ],
                      );
                    }),
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
                              height: 5,
                            ),
                            Text(
                              "Music",
                              style: TextStyle(
                                color: AppColor.black,
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
                                      "Do you have a talent for music and would love to enhance your musical skills? Would you like to compete with musicians? Other talented people and win valuable prizes? Then, we invite you to participate in the wonderful music competition organized by our university!This competition will be the perfect opportunity to showcase your musical talent and shine in the field you are passionate about. You will have the opportunity to play your favorite instrument and impress the judges with your exceptional performance.",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
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
                                  "Play:",
                                  style: TextStyle(
                                      color: AppColor.black, fontSize: 25),
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
                                      "To participate in the competition, please submit your music recording or performance video via the email provided. Your performance must be original and bear your artistic mark.\nHurry to participate and let your voice dance and enchant the audience! Don't miss the opportunity to enjoy musical creativity and win valuable prizes.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
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
                        Get.offNamed(AppRoute.Sport1,
                            arguments: {'args': args, 'sporttype': 'music'});
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: AppColor.black,
                        size: 35,
                      ),
                      label: const Text(
                        'Play',
                        style: TextStyle(color: AppColor.black, fontSize: 20),
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
