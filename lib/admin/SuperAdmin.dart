// ignore_for_file: prefer_const_constructors, duplicate_ignore, file_names, prefer_const_literals_to_create_immutables, unnecessary_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

class SuperAdmin extends StatefulWidget {
  const SuperAdmin({super.key, required this.title});

  final String title;

  @override
  State<SuperAdmin> createState() => _SuperAdminState();
}

class _SuperAdminState extends State<SuperAdmin> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SuperAdmin'),
          backgroundColor: AppColor.backgroundbuttom,
          leading: IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Get.offNamed(AppRoute.login);
            },
          ),
        ),

        // ignore: prefer_const_constructors
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColor.background,
          child: Stack(
            children: [
              /*  Image(
                image: AssetImage('assets/images/life2.jpg'),
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
              ),*/
              ListView(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  //  const GridCategoriesItem(),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: admin.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1),
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Get.toNamed(admin[index]['url']);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 91, 0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                    colors: [AppColor.orang2, AppColor.orang]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //add images to backend

                                  Text(
                                    admin[index]["name"]!,
                                    style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  // const Text(
                                  //   "A description of each image will be displayed",
                                  //   textAlign: TextAlign.center,
                                  // ),
                                ]),
                          ),
                        );
                      })
                ],
              )
            ],
          ),
        ));
  }
}

final List<Map<String, dynamic>> admin = [
  {
    'name': 'Students',
    'url': AppRoute.UserPage,
  },
  {
    'name': 'Search',
    'url': AppRoute.SearchUserPage,
  },
  {
    'name': 'Add',
    'url': AppRoute.SearchUserPage,
  },
  {
    'name': 'Update',
    'url': AppRoute.SearchUserPage,
  },
  {
    'name': 'Delete',
    'url': AppRoute.DeleteUserPage,
  }
];
