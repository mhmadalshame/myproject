// ignore_for_file: override_on_non_overriding_member, prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_final_fields, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/imgaeasset.dart';


class T14WalkThroughScreen2 extends StatefulWidget {
  @override
  _T14WalkThroughScreen2State createState() => _T14WalkThroughScreen2State();
}

class _T14WalkThroughScreen2State extends State<T14WalkThroughScreen2> {
  double? currentPage = 0;
  PageController _pageController = PageController(viewportFraction: 0.7);
  List<Widget> pages = [];


  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page;
      });
    });
    init();
  }

  init() async {}

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      Align(alignment: Alignment.topCenter, child: Image.asset( AppImaeAsset.logo, height: 150, width: 150, fit: BoxFit.cover)),
      Align(alignment: Alignment.topCenter, child: Image.asset(AppImaeAsset.person, height: 150, width: 150, fit: BoxFit.cover)),
      Align(alignment: Alignment.topCenter, child: Image.asset(AppImaeAsset.rootImages, height: 150, width: 150, fit: BoxFit.cover)),
    ];
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: pages.map((e) => e).toList(),
          ).paddingOnly(top: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
           Text("hi"),
            Text("hi"),
            
            ],
          ).paddingAll(16),
        ],
      ),
    );
    
    }}