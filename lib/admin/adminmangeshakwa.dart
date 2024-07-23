// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, library_private_types_in_public_api, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, unnecessary_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/constant/routes.dart';

import 'package:universityservices/core/shared/share.dart';
import 'package:http/http.dart' as http;

class MangeComplaints extends StatefulWidget {
  @override
  State<MangeComplaints> createState() => _MangeComplaintsState();
}

class _MangeComplaintsState extends State<MangeComplaints> {
  @override
  void initState() {
    _retriveRequest();
    super.initState();
  }

  Future<List> _retriveRequest() async {
    try {
      //xx=https://jsonplaceholder.typicode.com/users/
      var response =
          await http.get(Uri.parse('${Share.Url}getComplaints'), headers: {
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
        title: Text("Admin Mange Complaints"),
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
                      return Column(
                        children: [
                            Card(
                              color:AppColor.backgroundbuttom ,
                               margin: EdgeInsets.only(top: 4),
                                elevation: 10,
                              child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                              Text((index==0?"Total number of Complaints:":"").toString(),style: TextStyle(color: Colors.white,fontSize: 20),),
                                      Text((index==0?snapshot.data?.length:"").toString(),style: TextStyle(color: Colors.white,fontSize: 20)),
                                    ],
                                  ),
                            ),
                                Divider(),
                          Card(
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
                                      Text("Complaint Name: "),
                                      Text(snapshot.data?[index]['name']),
                                    ],
                                  ),
                                    Divider(),
                    
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    
                                    children: [
                                      Text("Complaint Content"),

                                     
                                    ],
                                  ),
                                   
SingleChildScrollView( child:Text(snapshot.data?[index]['complaint']),),
                     Divider(),
                                      
                                    ],
                                  ),
                                ),
                              ),
                             
                            ),
                          ),
                        ],
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
