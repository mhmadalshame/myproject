// ignore_for_file: non_constant_identifier_names, sized_box_for_whitespace, unnecessary_import, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

class Funny2 extends StatelessWidget {
  const Funny2({super.key});

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
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColor.black,
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
                    "Poetry competition",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.black,
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
                                    'assets/images/18.png',
                                    width: 350,
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
                      height: height * 0.9,
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
                              "Poetry Competition",
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
                                      "Do you love words and love the art of poetry? Do you have the talent for creativity and poetic expression?\n Then, we invite you to participate in the wonderful hair competition organized by our university!! This competition will be an ideal opportunity to showcase your poetic talents and compete with other talented poets. You will have the opportunity to express your feelings and thoughts through your own poems and impress the judges with your creativity.\nThere will be valuable prizes for the winners, including the opportunity to publish the winning poems in a famous poetry magazine.",
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
                                      "To enter the competition, please email your original poem to the specified competition address. Poems must be in Arabic and include your full name and contact information.Hurry to participate and let your words dance and shine in the world of poetry! Don't miss the opportunity to enjoy creativity and win valuable prizes.Remember, every poem holds the power to inspire the world and change lives. Let the words come out and make us rejoice in them and contemplate their magnificence.Share your poem with us and be part of our amazing poetry competition!",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300),
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
                             Get.offNamed(AppRoute.Sport1, arguments: {'args':args,'sporttype':'poetry'});


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
