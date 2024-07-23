// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, library_private_types_in_public_api, unnecessary_import, prefer_final_fields, unnecessary_null_comparison, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

class Information4 extends StatefulWidget {
  const Information4({Key? key}) : super(key: key);

  @override
  _Information4PageState createState() => _Information4PageState();
}

class _Information4PageState extends State<Information4> {
  List<dynamic> g = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _complaintController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    g = jsonDecode(args);
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Form'),
        backgroundColor: AppColor.backgroundbuttom,
      ),
      body: Container(
        color: AppColor.background,
        height: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'Complaint Name', icon: Icon(Icons.title)),
                ),
                SizedBox(height: 16.0),
                TextField(
                  controller: _complaintController,
                  maxLines: 5,
                  decoration: InputDecoration(
                      labelText: 'Complaint content',
                      icon: Icon(Icons.content_paste)),
                ),
                SizedBox(height: 16.0),
                customBottomAuth(
                  text: 'Submit',
                  onPressed: () async {
                    // Perform submission logic here
                    String name = _nameController.text;
                    String complaint = _complaintController.text;
                    // You can process the complaint data or send it to an API
                    // for further handling
                    print('Name: $name');
                    print('Complaint: $complaint');
                    // Show a dialog or navigate to a confirmation page
                    if (complaint.isNotEmpty && name.isNotEmpty) {
                      String postUrl = "${Share.Url}createComplaint/";
          
                      var request =
                          http.MultipartRequest('POST', Uri.parse(postUrl));
                      request.fields['name'] = name;
                      request.fields['student'] = g[0]['id'].toString();
          
                      request.fields['complaint'] = complaint;
          
                      var response = await request.send();
                      if (response.statusCode == 200) {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'Sucssesfully',
                          message: 'complaint added sucsessfully',
                          isDismissible: true,
                          duration: Duration(seconds: 2),
                          backgroundColor: AppColor.gren,
                        ));
                        Navigator.pop(context);
                      } else {
                        Get.showSnackbar(const GetSnackBar(
                          title: 'fail',
                          message: 'fial uploed complaint',
                          isDismissible: true,
                          duration: Duration(seconds: 2),
                          backgroundColor: AppColor.red,
                        ));
                      }
                    } else {
                      print('Please fill all fields.');
                      Get.showSnackbar(const GetSnackBar(
                        title: 'fail',
                        message: 'Please fill all fields.',
                        isDismissible: true,
                        duration: Duration(seconds: 2),
                        backgroundColor: AppColor.red,
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
