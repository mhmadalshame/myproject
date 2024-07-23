// ignore_for_file: deprecated_member_use, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

class stu_info extends StatelessWidget {
  const stu_info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: AppColor.white,
        //   // elevation: 0.0,
        //   title: const Text(
        //     'Student information',
        //     style: TextStyle(
        //       color: AppColor.orang,
        //       fontWeight: FontWeight.bold,
        //       fontSize: 30,
        //     ),
        //   ),
        // ),
        body: Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(216, 240, 181, 113),
              Color.fromARGB(246, 205, 108, 4),
            ],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
          )),
        ),
        const SizedBox(
          height: 80,
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Text(
              "معلومات الطالب",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Form(
            child: Column(
          children: [
            TextFormField(
                textAlign: TextAlign.end,
                cursorColor: AppColor.grey2,
                keyboardType: TextInputType.name,
                // ? const TextInputType.numberWithOptions(decimal: true)
                // : TextInputType.text,
                decoration: InputDecoration(
                    hintText: "اضافة اسم",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: const Text("الاسم:")),
                    suffixIcon: InkWell(
                      child: const Icon(Icons.person),
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColor.orang),
                        borderRadius: BorderRadius.circular(30)))),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                textAlign: TextAlign.end,
                cursorColor: AppColor.grey2,
                keyboardType: TextInputType.number,
                // ? const TextInputType.numberWithOptions(decimal: true)
                // : TextInputType.text,
                decoration: InputDecoration(
                    hintText: " السنة الراسية",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: const Text(" السنة ")),
                    suffixIcon: InkWell(
                      child: const Icon(Icons.person),
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)))),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                textAlign: TextAlign.end,
                cursorColor: AppColor.grey2,
                keyboardType: TextInputType.number,
                // ? const TextInputType.numberWithOptions(decimal: true)
                // : TextInputType.text,
                decoration: InputDecoration(
                    hintText: " المعدل  ",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: const Text(" المعدل ")),
                    suffixIcon: InkWell(
                      child: const Icon(Icons.person),
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)))),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                textAlign: TextAlign.end,
                cursorColor: AppColor.grey2,
                keyboardType: TextInputType.number,
                // ? const TextInputType.numberWithOptions(decimal: true)
                // : TextInputType.text,
                decoration: InputDecoration(
                    hintText: " الاختصاص ",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                    label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: const Text(" الاختصاص ")),
                    suffixIcon: InkWell(
                      child: const Icon(Icons.person),
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)))),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
                textAlign: TextAlign.end,
                cursorColor: AppColor.grey2,
                keyboardType: TextInputType.number,
                // ? const TextInputType.numberWithOptions(decimal: true)
                // : TextInputType.text,
                decoration: InputDecoration(
                    hintText: " الجامعة  ",
                    hintStyle: const TextStyle(fontSize: 14),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: const Text(" الجامعة ")),
                    suffixIcon: InkWell(
                      child: const Icon(Icons.person),
                      onTap: () {},
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)))),
          ],
        ))
      ],
    ));
  }
}
