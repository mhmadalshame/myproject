// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

class Donation1 extends StatelessWidget {
  Donation1({super.key});
  List<dynamic> g = [];

  @override
  Widget build(BuildContext context) {
     final args =
        ModalRoute.of(context)!.settings.arguments as String;

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
                    "Blood Donation",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.black,
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
                                    'assets/images/20.png',
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
                      height: height * 1,
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
                              "Blood Donation",
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
                                      "Our university proudly announces the launch of a fantastic blood donation campaign at the university clinic. It is a great opportunity for students, faculty members, and staff to contribute to saving lives and providing assistance to the community.\nBlood donation is a noble humanitarian act that can save the lives of many individuals in need, and we invite you to join us and participate in this valuable campaign.\n\nCampaign Details:\nDate: 20/3/2024\nLocation: University Clinic\nTime: From 9:00 to 12:00\nAll students, faculty members, and staff are encouraged to participate.\nYou must meet the necessary health requirements for blood donation.\nQualified medical personnel will be available to facilitate the donation process.\nStrict safety and hygiene measures will be strictly observed at all times.\nAll blood donors will receive a certificate of appreciation for their generous contribution.\n\nTogether, we can make a real difference in the lives of others and contribute to building a healthy and strong community. Remember that every drop of donated blood can bring hope and healing to those in times of need.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                  customBottomAuth(text: 'Register',  onPressed: () async {

                        String postUrl = "${Share.Url}createDonation/";
                                var request = http.MultipartRequest('POST', Uri.parse(postUrl));
      request.fields['student'] = g[0]['id'].toString();

      request.fields['type_donation'] ="blood";

     

      var response = await request.send();
      if (response.statusCode == 200) {

          showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Column(
              children: [
                Text('Congratalations register Scucsesfully '),

         
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
      else{   showDialog(
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
      );}
                  },)
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
