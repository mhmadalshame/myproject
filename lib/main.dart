// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:universityservices/binding.dart';

import 'package:universityservices/routes.dart';

import 'package:universityservices/view/screen/auth/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 224, 225, 208)),
        useMaterial3: true,
      ),
       initialBinding: MyBinding(),
      getPages: routes,
      home: Login(),
    );
  }
}
