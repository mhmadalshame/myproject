// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

class customBottomAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const customBottomAuth({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        onPressed: onPressed,
        color: AppColor.backgroundbuttom,
        textColor: Colors.white,
        child: Text(text,
            style: const TextStyle(
              fontSize: 19,
            )),
      ),
    );
  }
}
