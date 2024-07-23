// ignore_for_file: prefer_const_constructors, file_names, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/Services_controler.dart';
import 'package:universityservices/core/constant/color.dart';


class Services1 extends GetView<ServicesControllerImp> {
  const Services1({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments ;
    print(args);
    // ignore: unused_local_variable
    ServicesControllerImp contrller = Get.put(ServicesControllerImp());
    return Scaffold(
      body: Container(
        color: AppColor.background,
        
    
        child: ListView(children: [
         
          const SizedBox(
            height: 90,
          ),
        //  const GridCategoriesItem(),
          GridView.builder(
              shrinkWrap: true,
              itemCount: education.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.9),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    controller.goToPagePagedetails(index, "education",args);
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
             colors: [ 
             AppColor.orang2, 
            AppColor.orang 
             ] 
           ), 
          boxShadow: [ 
            BoxShadow( 
              color: Colors.grey , 
              blurRadius: 2.0, 
              offset: Offset(2.0,2.0) 
            ) 
          ] 
          ), 
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //add images to backend
                          Image.asset(
                            education[index]["image"]!,
                            height: 120, // Adjust the height as needed
                           
                            fit: BoxFit.fill,
                          ),
                          Text(
                            education[index]["name"]!,
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
        ]),
      ),
    );
  }
}

final List<Map<String, String>> education = [
  {
    'name': 'Question',
    'image': 'assets/images/quiz.png',
  },
  {
    'name': 'ChatGpt',
    'image': 'assets/images/chatgpt.png',
  },
  {
    'name': 'Books Education',
    'image': 'assets/images/22.png',
  },
  {
    'name': 'video Education',
    'image': 'assets/images/educationvideo.png',
  }
];
