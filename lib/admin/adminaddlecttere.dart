// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, avoid_print, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';


import 'package:path/path.dart' as path;

import 'package:http/http.dart' as http;
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

import 'package:universityservices/core/shared/share.dart';
import 'package:universityservices/view/widget/login&singup/custombuttonauth.dart';

class AddPdf extends StatefulWidget {
  @override
  _AddPdfState createState() => _AddPdfState();
}

class _AddPdfState extends State<AddPdf> {
  String? _filePath;
  String? Title;
 

  Future pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _filePath = result.files.single.path!;
      });
    } else {
      print('No Pdf selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AddPdf'),
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
               // customBottomAuth(text: 'ChoosePdf',  onPressed: pickPdf,),
              IconButton(onPressed: pickPdf, icon: Icon(Icons.picture_as_pdf,size: 70,)),
                SizedBox(height: 20.0),
                _filePath != null
                    ? Text(
                        _filePath!,
                      
                      )
                    : SizedBox(),
                SizedBox(height: 20.0),
                
                TextFormField(
                  onChanged: (value) {
                    Title = value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Title',
                    icon: Icon(Icons.title)
                  ),
                ),
             
                SizedBox(height: 20.0),
                 customBottomAuth(
                        text: "Save",
                        onPressed: ()async {
                     if (_filePath != null &&
                        Title != null
                       ) {
                      String postUrl = "${Share.Url}createPdf/";
          
                      var request =
                          http.MultipartRequest('POST', Uri.parse(postUrl));
                      request.fields['title'] = Title!;
                  
          
                      String fileName = path.basename(_filePath!);
                      request.files.add(await http.MultipartFile.fromPath(
                        'file',
                        _filePath!,
                        filename: fileName,
                      ));
          
                      var response = await request.send();
                      if (response.statusCode == 200) {
                     Get.showSnackbar(const GetSnackBar(
            title: 'Sucssesfully',
            message: 'pdf added sucsessfully',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.gren,
            
          ));
                      } else {
                        Get.showSnackbar(const GetSnackBar(
            title: 'fail',
            message: 'fial uploed pdf',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.red,
            
          ));
                      }
                    } else {
                      print('Please fill all fields.');
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
