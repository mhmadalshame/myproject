import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

class CustomCardHome extends StatelessWidget {
  final String title;
  final String body;
  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: AppColor.orang2),
          child: ListTile(
            title: Text(
              title,
              style:
                  const TextStyle(color: AppColor.primaryColor, fontSize: 20),
            ),
            subtitle: Text(
              body,
              style: const TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Positioned(
        //     top: -20,
        //     right: -20,
        //     child: Container(
        //       height: 160,
        //       width: 160,
        //       decoration: BoxDecoration(
        //           color: AppColor.grey2,
        //           borderRadius: BorderRadius.circular(170)),
        //     ))
      ]),
    );
  }
}
