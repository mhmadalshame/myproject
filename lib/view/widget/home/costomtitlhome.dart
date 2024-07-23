import 'package:flutter/material.dart';


class CustomservicesHome extends StatelessWidget {
  final String title;
  const CustomservicesHome({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,
          style: const TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold)),
    );
  }
}
