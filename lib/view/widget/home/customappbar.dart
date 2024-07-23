// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final Function()? onPressedSearch;
  CustomAppBar(
      {super.key,
      required this.titleappbar,
      this.onPressedIcon,
      this.onPressedSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: AppColor.primaryColor,
                ),
                onPressed: onPressedSearch),
            hintText: titleappbar,
            hintStyle:
                const TextStyle(fontSize: 18, color: AppColor.primaryColor),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15)),
            filled: true,
            fillColor: Color.fromARGB(255, 255, 255, 255),
          ),
        )),
        const SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient( 
             colors: [ 
             AppColor.orang2, 
             AppColor.orang 
             ] 
           ), 
            borderRadius: BorderRadius.circular(15),
          ),
          width: 70,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIcon,
              icon: const Icon(
                Icons.person,
                size: 35,
                color: Color.fromARGB(255, 0, 0, 0),
              )),
        )
      ]),
    );
  }
}
