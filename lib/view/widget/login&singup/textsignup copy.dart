// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class CoustmTextSignUpOrSingIn extends StatelessWidget {
  final String textone;
  final String texttwo;
  final void Function() onTap;
  const CoustmTextSignUpOrSingIn(
      {super.key,
      required this.textone,
      required this.texttwo,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(
            texttwo,
            style: const TextStyle(
                color: AppColor.orang, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
