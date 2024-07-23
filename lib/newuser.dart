// ignore_for_file: avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_final_fields, duplicate_ignore, library_private_types_in_public_api, unnecessary_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/routes.dart';
import 'package:universityservices/core/shared/share.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _formKey = GlobalKey<FormState>();

  String student_name = '';
  String academic_year = "";
  String specialization = '';
  TextEditingController _dateOfBirth = TextEditingController();
  String _address = '';
  String interests = '';
  String gpa = "";

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Form'),
        backgroundColor: Color.fromARGB(251, 209, 145, 8),
      ),
      body: Container(
        color: Color.fromARGB(221, 228, 226, 226),
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      student_name = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'academic_year',
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your academic_year';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      academic_year = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'specialization',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your specialization';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      specialization = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _dateOfBirth,
                    decoration: const InputDecoration(
                      labelText: 'Date of Birth',
                    ),
                     keyboardType: TextInputType.datetime,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _address = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'interests',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your interests';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      interests = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'GPA',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your GPA';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      gpa = value!;
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      height: 50.0,
                      margin: EdgeInsets.all(10),
                      child: MaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            // Call a function to save the user data to the database
                            // with the values collected from the form.
                            _saveUser();
                          }
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80.0)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(216, 240, 181, 113),
                                  Color.fromARGB(246, 205, 108, 4),
                                ],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(30.0)),
                          child: Container(
                            constraints: BoxConstraints(
                                maxWidth: 250.0, minHeight: 50.0),
                            alignment: Alignment.center,
                            // ignore: prefer_const_constructors
                            child: Text(
                              "Save",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _saveUser() async {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    print(args);
    print(student_name);
    print(academic_year);
    print(specialization);
    print(_dateOfBirth.text);
    print(_address);
    print(interests);
    print(gpa);
    String posturl = "${Share.Url}createFinalStudent/";
    http.post(Uri.parse(posturl), body: {
      'login': args,
      'student_name': student_name,
      'academic_year': academic_year,
      'specialization': specialization,
      'date_of_birth': _dateOfBirth.text,
      'address': _address,
      'interests': interests,
      'gpa': gpa,
    });
    var d = const Duration(seconds: 2);
    sleep(d);
    String postur2 = "${Share.Url}loginIsStudent";
    Response response1 = await get(Uri.parse("$postur2/$args/"));
    
     if (response1.body.length > 2) {
            Get.offNamed(AppRoute.HomeScreen, arguments: response1.body);
          }
          else{

print(response1.body);
          }

  }
}
