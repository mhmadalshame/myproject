// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';

class CoustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CoustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.headline2,
    );
  }
}
