// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/home.dart';
import 'package:universityservices/profile.dart';
import 'package:universityservices/siting.dart';
import 'package:universityservices/view/widget/services_page/createchat.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const HomePage(),
    const Settings(),
    const Porfil(),
    const CreateChat(title: "Create Chat")
  ];

  List bottomappbar = [
    {"title": "Home", "icon": Icons.home},
    {"title": "settings", "icon": Icons.settings},
    {"title": "profile", "icon": Icons.person},
    {"title": "chat", "icon": Icons.chat_rounded},
  ];
  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
