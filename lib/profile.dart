// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors, non_constant_identifier_names, avoid_print, prefer_const_literals_to_create_immutables, unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

class Porfil extends StatelessWidget {
  const Porfil({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
      final args = ModalRoute.of(context)!.settings.arguments as String;
      List<dynamic> g = jsonDecode(args);
            print(args);

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 91, 0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(colors: [
                                  AppColor.orang2, 
            AppColor.orang 
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
              child: Column(
                children: [
                  const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.primaryColor,
                        size: 35,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "My profile",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 30,
                        fontFamily: AutofillHints.familyName,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
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
                                height: innerHeight * 0.65,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.white),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                   Text(
                                   g[0]["student_name"],
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                       Column(
                                        children: [
                                          Text(
                                            "academic year",
                                            style: TextStyle(
                                                color: AppColor.grey2,
                                                fontSize: 19),
                                          ),
                                          Text(
                                            g[0]["academic_year"].toString(),
                                            style: TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 19),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(22),
                                        child: Container(
                                          height: 20,
                                          width: 3,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: AppColor.grey2),
                                        ),
                                      ),
                                       Column(
                                        children: [
                                          Text(
                                            " level ",
                                            style: TextStyle(
                                                color: AppColor.grey2,
                                                fontSize: 19),
                                          ),
                                          Text(
                                           g[0]["level"].toString(),
                                            style: TextStyle(
                                                color: AppColor.primaryColor,
                                                fontSize: 19),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ]),
                              )),
                          Positioned(
                              top: -10,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Image.asset(
                                    'assets/images/55.png',
                                    width: innerWidth * 0.50,
                                    fit: BoxFit.fitHeight,
                                  ),
                                ),
                              ))
                        ],
                      );
                    }),
                  ),
                 
                 
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
