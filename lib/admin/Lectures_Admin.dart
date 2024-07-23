// ignore_for_file: file_names, library_private_types_in_public_api, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:url_launcher/url_launcher.dart';

class Lectures extends StatefulWidget {
  const Lectures({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<Lectures> {
  String imagePath = 'path/to/image.jpg';
  String serviceText = 'Service Text';
  String Lectures_name = 'Lectures_name';
  String? link;

  void updateImage(String newPath) {
    setState(() {
      imagePath = newPath;
    });
  }

  void updateServiceText(String newText) {
    setState(() {
      serviceText = newText;
      Lectures_name = newText;
    });
  }

  void deleteService() {
    setState(() {
      imagePath = '';
      serviceText = '';
      Lectures_name = '';
    });
  }

  void _launchURL() async {
    if (link != null && await canLaunch(link!)) {
      await launch(link!);
    } else {
      throw 'Invalid link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 150, 79),
        title: const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            "Admin Lectures ",
            style: TextStyle(
                color: AppColor.black,
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Color.fromARGB(255, 246, 216, 176),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lectures name:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Lectures_name,
                      style: TextStyle(fontSize: 24.0, color: AppColor.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 150, 79),
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(15.0),
                      ),
                      child: const Text(
                        'Edit Text',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  const Text(
                    'Image:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Container(
                        width: 200.0,
                        height: 200.0,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.adb, size: 50.0),
                            SizedBox(height: 8.0),
                            Text(
                              "Advertisements",
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                     
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 150, 79),
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(18.0),
                      ),
                      child: const Text(
                        'Change Image',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  const Text(
                    'Add a link:',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColor.black),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Add a link'),
                              content: TextFormField(
                                onChanged: (value) {
                                  setState(() {
                                    link = value;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Enter a link',
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    _launchURL();
                                  },
                                  child: Text('Add'),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Cancel'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 150, 79),
                      ),
                      child: const Text(
                        'Add a link',
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'body Lectures text:',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      serviceText,
                      style: TextStyle(fontSize: 24.0, color: AppColor.black),
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
             
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 150, 79),
                        onPrimary: Colors.black,
                        padding: EdgeInsets.all(15.0),
                      ),
                      child: const Text(
                        'Edit Text',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Confirmation'),
                              content: Text('Are you sure you want to delete?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                  
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .black), // تغيير لون النص إلى الأسود
                                    textStyle: MaterialStateProperty
                                        .all<TextStyle>(TextStyle(
                                            fontSize:
                                                18.0)), // تكبير الحجم قليلاً
                                  ),
                                  child: Text('Yes'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ButtonStyle(
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .black), // تغيير لون النص إلى الأسود
                                    textStyle: MaterialStateProperty
                                        .all<TextStyle>(TextStyle(
                                            fontSize:
                                                18.0)), // تكبير الحجم قليلاً
                                  ),
                                  child: Text('No'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        padding: EdgeInsets.all(16.0),
                        minimumSize: Size(200.0, 0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delete,
                            size: 24.0,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Delete Service',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
