// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, library_private_types_in_public_api, unnecessary_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;

class Information2 extends StatefulWidget {
  const Information2({Key? key}) : super(key: key);

  @override
  _Information2PageState createState() => _Information2PageState();
}

class _Information2PageState extends State<Information2> {
  List<bool> selectedItems = List<bool>.generate(12, (index) => false);
  List<int> counters = List<int>.generate(12, (index) => 1);
  bool checkAll = false;
  List<dynamic> pepersData = [];
  List<dynamic> g = [];
  Future<void> fetchpepersData() async {
    String url = "${Share.Url}get_pepers";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        pepersData = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchpepersData();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    g = jsonDecode(args);
    return Scaffold(
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
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
                "Students Affairs",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'AutofillHints.familyName',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Request documents for the student. Choose the required documents",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'AutofillHints.familyName',
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: pepersData.length,
                itemBuilder: (context, index) {
                  return Card(
                 
                    child: CheckboxListTile(
                      activeColor: AppColor.grey2,
                      contentPadding: EdgeInsets.all(13),
                      subtitle: Text(
                        'Price:${pepersData[index]['price'] * counters[index]}',
                        style: TextStyle(color: Colors.red),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(pepersData[index]['name'],style: TextStyle(fontSize: 11),),
                          IconButton(
                            onPressed: () {
                              if (counters[index] > 1) {
                                setState(() {
                                  counters[index]--;
                                });
                              }
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(counters[index].toString()),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                counters[index]++;
                              });
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                      value: selectedItems[index],
                      onChanged: (bool? value) {
                        setState(() {
                          selectedItems[index] = value ?? false;
                        });
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          List<int> selectedIndices = [];
          List<int> selectedcounter = [];

          for (int i = 0; i < selectedItems.length; i++) {
            if (selectedItems[i]) {
              selectedIndices.add(pepersData[i]['id']);
              selectedcounter.add(counters[i]);
            }
          }
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('تأكيد'),
                content: const Text('هل ترغب في تأكيد الاختيارات؟'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      print('تم تأكيد الاختيارات');
                      print(selectedIndices);
                      print(selectedcounter);
                      for (int i = 0; i < selectedIndices.length;i++)
                      { 
                        String posturl = "${Share.Url}createRequestPeper/";
                      http.post(Uri.parse(posturl), body: {
                        'student': g[0]['id'].toString(),
                        'peper': selectedIndices[i].toString(),
                        'counter': selectedcounter[i].toString()
                      });

                      }
                       Get.showSnackbar(const GetSnackBar(
            title: 'Sucssesfully',
            message: 'register request sucsessfully',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.gren,
            
          ));
                       
                    },
                    child: const Text('تأكيد'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      print('تم إلغاء الاختيارات');
                    },
                    child: const Text('إلغاء'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.done),
        backgroundColor: Colors.orange[700],
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