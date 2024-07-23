// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

class Register extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(214, 243, 154, 53),
              Color.fromARGB(246, 253, 221, 158),
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
          )),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 60),
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
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "Register",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 30,
                        fontFamily: AutofillHints.familyName,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.6,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          const SizedBox(height: 50),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Please enter full name',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            height: height * 0.080,
                            child: Stack(
                              children: [
                                TextFormField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                    enabled: true,
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    contentPadding: EdgeInsets.all(20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Please enter your number',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              enabled: true,
                              labelText: 'number',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.grey2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Text(
                                  'Please enter your Email',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              enabled: true,
                              labelText: 'Email',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.grey2),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              contentPadding: EdgeInsets.all(20),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(246, 130, 76, 0),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 50), // تعديل حجم الزر
                            ),
                            child: const Text(
                              'Send',
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: 20, // تعديل حجم النص
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
