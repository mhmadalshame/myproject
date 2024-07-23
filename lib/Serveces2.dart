// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/Services_controler.dart';
import 'package:universityservices/core/constant/color.dart';


class Services2 extends GetView<ServicesControllerImp> {
  const Services2({super.key});

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments ;

    // ignore: unused_local_variable
    ServicesControllerImp contrller = Get.put(ServicesControllerImp());
    return Scaffold(
      body: Container(
       color: AppColor.background,
        child: ListView(children: [
          /*CustomAppBar(
            titleappbar: "Find Serves",
            onPressedIcon: () {},
            onPressedSearch: () {},
          ),*/
          const SizedBox(
            height: 90,
          ),
      
          GridView.builder(
              shrinkWrap: true,
              itemCount: arts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.9),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    controller.goToPagePagedetails(index,"arts",args);
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
                            arts[index]['image']!,
                            height: 120, // Adjust the height as needed
                           
                            fit: BoxFit.fill,
                          ),
                           Text(
                            arts[index]['name']!,
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
final List<Map<String, String>> arts = [
  {
    'name': 'Souvenir images',
    'image': 'assets/images/sunvner.png',
  },
  {
    'name': 'Talent Student',
    'image': 'assets/images/taelnt.png',
  },
 
  
];