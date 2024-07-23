// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/controller/auth/Services_controler.dart';

class GridCategoriesItem extends StatelessWidget {
  const GridCategoriesItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    Get.put(ServicesControllerImp());
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemBuilder: (context, index) {
          return Services(
            categoryName: categories[index]['name']!,
            categoryImage: categories[index]['image']!,
            onTap: () {
           
              Navigator.pushNamed(
                context,
                '/Services${index + 1}',
                arguments: args,
              );
            },
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}

class Services extends StatefulWidget {
  final String categoryName;
  final String categoryImage;
  final VoidCallback onTap;

  const Services({
    Key? key,
    required this.categoryName,
    required this.categoryImage,
    required this.onTap,
  }) : super(key: key);

  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isPressed = !isPressed;
        });
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isPressed ? Colors.red : null,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 194, 91, 0),
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
                colors: [Color.fromARGB(255, 234, 90, 0), Colors.blueAccent]),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                offset: Offset(2.0, 2.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.categoryName,
                style: TextStyle(
                  fontSize: 13,
                  color: isPressed ? Colors.white : Colors.black,
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
    'image': 'assets/images/1.png',
  },
  {
    'name': 'Arts',
    'image': 'assets/images/6.png',
  },
  {
    'name': 'Entertainment',
    'image': 'assets/images/7.png',
  },
  {
    'name': 'Student affairs',
    'image': 'assets/images/8.png',
  },
  {
    'name': 'Sport',
    'image': 'assets/images/9.png',
  },
  {
    'name': 'Voluntary work',
    'image': 'assets/images/10.png',
  },
  {
    'name': 'Advertisements',
    'image': 'assets/images/10.png',
  },
  {
    'name': 'نادي الخريجين',
    'image': 'assets/images/10.png',
  },
];
