// ignore_for_file: avoid_unnecessary_containers, unused_import, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/Settings_controller.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/imgaeasset.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    Settings_controller controller = Get.put(Settings_controller());
    return Container(
      child: ListView(
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Container(
                height: Get.width / 2,
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
              Positioned(
                  top: Get.width / 4,
                  child: const CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(AppImaeAsset.person),
                  )),
            ],
          ),
          const SizedBox(
            height: 110,
          ),
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
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () {},
                    title: const Text("About us"),
                    trailing: const Icon(Icons.help_center_outlined),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Contact us"),
                    trailing: Icon(Icons.phone_android_outlined),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      controller.logout();
                    },
                    title: const Text("Logout"),
                    trailing: const Icon(Icons.exit_to_app_outlined),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
