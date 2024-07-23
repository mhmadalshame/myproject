// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/home_controler.dart';
import 'package:universityservices/core/constant/color.dart';

import 'package:universityservices/view/widget/home/coustom_nuse1.dart';
import 'package:universityservices/view/widget/home/customappbar.dart';
import 'package:universityservices/view/widget/home/listcategoriesHome.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    List<dynamic> g = jsonDecode(args);

    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          // margin: const EdgeInsets.only(top: 2),
          child: ListView(
            children: [
              CustomAppBar(
                titleappbar: "Search for service",
                onPressedIcon: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 194, 91, 0),
                            border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                                colors: [AppColor.orang2, AppColor.orang]),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                  offset: Offset(2.0, 2.0))
                            ]),
                        child: AlertDialog(
                          backgroundColor: AppColor.background,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/person.png',
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Student_name: ${g[0]['student_name']}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Date_of_birth: ${g[0]['date_of_birth']}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Specialization: ${g[0]['specialization']}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Level: ${g[0]['level']}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Gpa: ${g[0]['gpa']}',
                                style: TextStyle(
                                    color: Colors.grey[700],
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // Get.offNamed(AppRoute.login);
                              },
                              child: Text(
                                'OK',
                                style: TextStyle(
                                  color: AppColor.backgroundbuttom,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                onPressedSearch: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              // const CustomCardHome(
              //   title: "News page ",
              //   body: "Services news",
              // ),
              SlidersNuse(),
              /*const CustomservicesHome(
                title: "",
              ),
*/
              const GridCategoriesHome(),
              
            ],
          )),
    );
  }
}
