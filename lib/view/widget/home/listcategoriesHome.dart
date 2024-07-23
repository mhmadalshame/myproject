// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/home_controler.dart';
import 'package:universityservices/core/constant/color.dart';

class GridCategoriesHome extends GetView<HomeControllerImp> {
  const GridCategoriesHome({Key? key});

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as String;
      
    return SizedBox(
      height: 240,
      child: GridView.builder(
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Set the number of columns in the grid
          crossAxisSpacing: 4, // Set the spacing between columns
          mainAxisSpacing: 4, // Set the spacing between rows
        ),
        itemBuilder: (context, index) {
          return Services(
            categoryName: categories[index]['name']!,
            categoryImage: categories[index]['image']!,
            onTap: () {
              controller.goToServices(categories,index,args);
            },
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Services extends GetView<HomeControllerImp> {
  final String categoryName;
  final String categoryImage;
  final VoidCallback onTap;

  const Services({
    Key? key,
    required this.categoryName,
    required this.categoryImage,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),

        child: Ink(
          
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
            children: [
              
              Opacity(
                opacity: 1,
                child: Image.asset(
                  categoryImage,
                  height: 120, // Adjust the height as needed
                  width: 120, // Adjust the width as needed
                  fit: BoxFit.fill// Adjust the fit property as needed
                ),
              ),
              const SizedBox(height: 8),
              Text(
                categoryName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(223, 0, 0, 0),
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, String>> categories = [
  {
    'name': 'Education',
    'image': 'assets/images/educationlab.png',
  },
  {
    'name': 'Arts',
    'image': 'assets/images/arts1.png',
  },
  {
    'name': 'Entertainment',
    'image': 'assets/images/entertament.png',
  },
  {
    'name': 'Student affairs',
    'image': 'assets/images/information1.png',
  },
  {
    'name': 'Sport',
    'image': 'assets/images/sport1.png',
  },
  {
    'name': 'Voluntary work',
    'image': 'assets/images/helped.png',
  },
  {
    'name': 'Advertisements',
    'image': 'assets/images/ads.png',
  },
  {
  'name': 'alumni club',
  'image': 'assets/images/pngegg.png',
  }
];