// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

import 'dart:io';
import 'package:path/path.dart' as path;

import 'package:http/http.dart' as http;
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

import 'package:universityservices/core/shared/share.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

class AddNews extends StatefulWidget {
  @override
  _AddNewsState createState() => _AddNewsState();
}

class _AddNewsState extends State<AddNews> {
  String? _filePath;
  String? newsTitle;
  String? newsContent;
  String? news_publisher;

  Future pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
     type: FileType.any,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Addnews'),
          backgroundColor: AppColor.backgroundbuttom,
          leading: IconButton(
            icon: Icon(Icons.login),
            onPressed: () {
              Get.offNamed(AppRoute.login);
            },
          ),
          
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
               // customBottomAuth(text: 'selectImg', onPressed: pickImage,),
               IconButton(onPressed: pickImage, icon: Icon(Icons.add_a_photo,size:70 ,)),
               
               
                SizedBox(height: 20.0),
                _filePath != null
                    ? Image.file(
                        File(_filePath!),
                        height: 200,
                      )
                    : SizedBox(),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    news_publisher = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'News_Publisher',
                    icon: Icon(Icons.person)
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    newsTitle = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'News Title',
                    icon: Icon(Icons.title)
                  ),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  onChanged: (value) {
                    newsContent = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'News Content',
                    icon: Icon(Icons.content_paste_rounded)
                  ),
                ),
                SizedBox(height: 20.0),
                customBottomAuth(text: 'Save',  onPressed: () async {
                    if (_filePath != null &&
                        newsTitle != null &&
                        newsContent != null) {
                      String postUrl = "${Share.Url}createNews/";
            
                      var request =
                          http.MultipartRequest('POST', Uri.parse(postUrl));
                      request.fields['news_title'] = newsTitle!;
                      request.fields['news_content'] = newsContent!;
                      request.fields['news_publisher'] = news_publisher!;
            
                      String fileName = path.basename(_filePath!);
                      request.files.add(await http.MultipartFile.fromPath(
                        'news_image',
                        _filePath!,
                        filename: fileName,
                      ));
            
                      var response = await request.send();
                      if (response.statusCode == 200) {
                        Get.showSnackbar(const GetSnackBar(
            title: 'Sucssesfully',
            message: 'news added sucsessfully',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.gren,
            
          ));
                      } else {
                        Get.showSnackbar(const GetSnackBar(
            title: 'fail',
            message: 'fail add news',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.red,
            
          ));
                      }
                    } else {
                      print('Please fill all fields.');
                    }
                  },)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
