// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';

import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;

class Information3 extends StatefulWidget {
  const Information3({Key? key}) : super(key: key);

  @override
  _Information3PageState createState() => _Information3PageState();
}

class _Information3PageState extends State<Information3> {
  List<bool> selectedItems = List<bool>.generate(12, (index) => false);
  List<int> counters = List<int>.generate(12, (index) => 1);
  bool checkAll = false;
  List<dynamic> pepersData = [];
  List<dynamic> g = [];
  Future<void> fetchpepersData() async {
    String url = "${Share.Url}getRequestbystudent/${g[0]['id']}";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      pepersData = json.decode(response.body);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    g = jsonDecode(args);
    return Scaffold(
      body: Container(
        color: AppColor.background,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "My request",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'AutofillHints.familyName',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FutureBuilder(
                    future: fetchpepersData(),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: pepersData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    Color.fromARGB(255, 184, 86, 24),
                                    AppColor.orang
                                  ]),
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromARGB(223, 238, 233, 233)),
                              child: Column(
                                children: [
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Student Name :"),
                                        Text(
                                          '${pepersData[index]['peper']['name']}',
                                        ),
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Counter :"),
                                        Text(
                                          '${pepersData[index]['counter'].toString()}',
                                        ),
                                      ],
                                    ),
                                  ),
                                     Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Counter :"),
                                        Text(
                                          '${pepersData[index]['counter'] * pepersData[index]['peper']['price']}',
                                        ),
                                      ],
                                    ),
                                  ),
                                     Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text("Request state:"),
                                        Switch(
                                          hoverColor: Colors.red,
                                          value: pepersData[index]['state'],
                                          onChanged: (value) {
                                            setState(() {
                                              pepersData[index]['state'] = value;
                                              print(pepersData[index]['state']);
                                            });
                                          },
                                          activeTrackColor: Colors.greenAccent,
                                          activeColor: Colors.green,
                                        ),
                                      ],
                                    ),
                                  ),
                                     Divider(),
                                  SizedBox(
                                    height: 30,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
final List<Map<String, dynamic>> options = [
  {
    'name': 'Education',
    'price': 1000,
  },
  {
    'name': 'Arts',
    'price': 1200,
  },
  {
    'name': 'Entertainment',
    'price': 350,
  },
  {
    'name': 'Student affairs',
    'price': 100,
  },
  {
    'name': 'Sport',
    'price': 250,
  },
  {
    'name': 'Voluntary work',
    'price': 154,
  },
  {
    'name': 'Advertisements',
    'price': 458,
  },
  {
    'name': 'نادي الخريجين',
    'price': 481,
  },
];
*/