// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;

class MangeSport extends StatefulWidget {
  @override
  State<MangeSport> createState() => _MangeSportState();
}

class _MangeSportState extends State<MangeSport> {
  @override
  void initState() {
    _retriveRequest();
    super.initState();
  }

  Future<List> _retriveRequest() async {
    try {
      //xx=https://jsonplaceholder.typicode.com/users/
      var response =
          await http.get(Uri.parse('${Share.Url}getSport'), headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
      });

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error("server error");
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.login),onPressed: (){

 Get.offNamed(AppRoute.login);

        },),
        backgroundColor: AppColor.backgroundbuttom,
        title: Text("Admin Mange Sport"),
        /* actions: [
          IconButton(
            
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SerchPage()));
              },
              icon: Icon(Icons.search))
        ],*/
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _retriveRequest();
          });
        },
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: FutureBuilder<List>(
                future: _retriveRequest(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                           
                            // ignore: prefer_interpolation_to_compose_strings
                            title: Card(
                              margin: EdgeInsets.only(top: 16),
                              elevation: 4,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
Text("Student Name: "),
                                      Text(
                                      snapshot.data?[index]['student']
                                          ['student_name'],
                                ),
                                    ],
                                  ),
                                  Divider(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("Sport Name: "),
                                    Text(snapshot.data?[index]['name']),
                                  ],
                                ),
                                  Divider(),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    
                                    Text("Level: "),
                                    Text(snapshot.data![index]['level'].toString()),
                                  ],
                                ),
                                  Divider(),

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text('State request'),
                                        Switch(
                                          hoverColor: Colors.red,
                                          value: snapshot.data![index]['state'],
                                          onChanged: (value)async {

       Map<String, dynamic> data = {
                                  'id': snapshot.data?[index]['id'],
                                  'student': snapshot.data?[index]['student'],
                                  'name': snapshot.data?[index]['name'],
                                  'level': snapshot.data?[index]['level'],
                                  'state': !snapshot.data?[index]['state'],
                                };

                                final response = await http.put(
                                    Uri.parse(
                                        '${Share.Url}updateStateSport/${snapshot.data?[index]['id']}/'),
                                    headers: {
                                      'Content-Type': 'application/json',
                                      'Access-Control-Allow-Origin': '*',
                                      'Access-Control-Allow-Credentials':
                                          'true',
                                      'Access-Control-Allow-Headers':
                                          'Content-Type',
                                      'Access-Control-Allow-Methods':
                                          'GET,PUT,POST,DELETE',
                                    },
                                    body: jsonEncode(data));

                                if (response.statusCode == 200) {
                                  Get.showSnackbar(const GetSnackBar(
            title: 'Sucssesfully',
            message: 'changes state sucsessfully',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.gren,
            
          ));
                                  print(response.body);
                                } else {
                                  Get.showSnackbar(const GetSnackBar(
            title: 'fail',
            message: 'not changed sate ',
            isDismissible: true,
            duration: Duration(seconds: 2),
            backgroundColor: AppColor.red,
            
          ));
                                }

                                            setState(() {
                                              snapshot.data![index]['state'] =
                                                  value;
                                              print(snapshot.data![index]
                                                  ['state']);
                                            });
                                          },
                                          activeTrackColor: Colors.orangeAccent,
                                          activeColor: Colors.orange,
                                        ),
                                       
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                           
                          ),
                        );
                      },
                    );
                  } else {
                    return Container(
                      child: Text('no data found'),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
