// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_const_constructors_in_immutables, must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

class Donation3 extends StatelessWidget {
  Donation3({super.key});
  List<dynamic> g = [];

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    g = jsonDecode(args);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

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
                  const SizedBox(
                    height: 30,
                  ),
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

                  Text(
                    "Clothes donation drive",
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
                                height: innerHeight * 0.90,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  // color: AppColor.orang2
                                ),
                                child: Column(children: [
                                  Image.asset(
                                    'assets/images/19.png',
                                    width: 500,
                                    height: innerHeight * 0.8,
                                    fit: BoxFit.fill,
                                  ),
                                ]),
                              )),
                        ],
                      );
                    }),
                  ),

                  Container(
                      height: height * 1.0,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color.fromARGB(223, 238, 233, 233)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Clothes donation drive",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 12,
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
                                      "We are pleased to announce the launch of a Good Clothing Donation Campaign at our university. It's a wonderful opportunity for students, faculty members, and staff to contribute and provide assistance to those in need, fostering a spirit of community support.\nDonating good-quality clothing is a noble and impactful humanitarian act that can make a real difference in the lives of others. We invite you to join us and participate in this valuable campaign.\n\nCampaign Details:\nDate: 1/1/2024\nLocation: In the university's inner courtyard\nAll students, faculty members, and staff are encouraged to participate.\nPlease ensure that the clothing you donate is in good condition and wearable.\nClothing donations for men, women, and children are accepted.\nDonated clothing will be distributed to those in need and local communities in need.\nDedicated donation boxes will be provided at specific locations within the university to facilitate the donation process.\nTogether, we can make a positive and tangible impact in the lives of others by donating good-quality clothing. ",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                             customBottomAuth(text: 'Register',  onPressed: () async {
                                  String postUrl =
                                      "${Share.Url}createDonation/";
                                  var request = http.MultipartRequest(
                                      'POST', Uri.parse(postUrl));
                                  request.fields['student'] =
                                      g[0]['id'].toString();

                                  request.fields['type_donation'] = "clothes";

                                  var response = await request.send();
                                  if (response.statusCode == 200) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Text(
                                                  'Congratalations register Scucsesfully '),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Column(
                                            children: [
                                              Text('Sorry you alredy register'),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  }
                                },
                               )
                          ],
                        ),
                      )),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // ElevatedButton.icon(
                  //     onPressed: () {},
                  //     icon: const Icon(
                  //       Icons.arrow_forward,
                  //       color: AppColor.black,
                  //       size: 35,
                  //     ),
                  //     label: const Text(
                  //       'Register',
                  //       style: TextStyle(color: AppColor.black, fontSize: 20),
                  //     ))
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
