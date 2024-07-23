import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

// ignore: must_be_immutable
class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;

  final String textbutton;
  final IconData iconData;

  final bool? active;
  const CustomButtonAppBar(
      {super.key,
      required this.textbutton,
      required this.iconData,
      this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: active == true ? const Color.fromARGB(255, 255, 94, 7) : AppColor.grey2,
          ),
          Text(
            textbutton,
            style: TextStyle(
                color: active == true ? const Color.fromARGB(255, 255, 98, 0) : AppColor.grey2),
          ),
        ],
      ),
    );
  }
}
