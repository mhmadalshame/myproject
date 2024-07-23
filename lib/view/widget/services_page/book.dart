// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

class Donation2 extends StatelessWidget {
 Donation2({super.key});
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
                  const SizedBox(
                    height: 20,
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

                  const Text(
                    "Donate Books",
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
                                    'assets/images/22.png',
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
                      height: height * 1.1,
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
                              "Donate Books",
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
                                      "The University Library is pleased to announce the availability of book and lecture paper donation at the library. It is a wonderful opportunity for students, faculty members, and staff to contribute to the enrichment and sharing of knowledge within the university community.\n\nDetails of the Book Donation and Replenishment at the Library:\n\nAll university members are encouraged to donate books and lecture papers that they deem valuable and worthy of retention in the library.\nPlease ensure that the donated books and lecture papers are in good condition and usable.\nProvide details of the donated books and lecture papers, including the book title, author's name, edition, and general condition.\nThe donated books and lecture papers will be reviewed by the library team to determine whether they meet the criteria for replenishment in the library.\nSpecific books will be replenished in the library after evaluation and approval by the library team.\nPlease deliver the donated books and lecture papers to the designated location at the university library.\n\nTogether, we can build a library rich in resources and knowledge by donating books and lecture papers and replenishing them in the library for the benefit of the entire community. Let us come together and contribute to creating a vibrant and sustainable university community.",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
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

      request.fields['type_donation'] ="book";

     

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
      else{

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
                     })
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
