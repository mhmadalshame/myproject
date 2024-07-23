// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, dead_code, unused_local_variable, unnecessary_new, sized_box_for_whitespace, unnecessary_import, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';

class CreateChat extends StatefulWidget {
  const CreateChat({super.key, required this.title});

  final String title;

  @override
  State<CreateChat> createState() => _CreateChatState();
}

class _CreateChatState extends State<CreateChat> {
  Client client = http.Client();

  @override
  void initState() {
    _retriveUser();
    super.initState();
  }

  Future<List> _retriveUser() async {
    try {
      //xx=https://jsonplaceholder.typicode.com/users/
      var response =
          await http.get(Uri.parse('${Share.Url}getStudent'), headers: {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    List<dynamic> g = jsonDecode(args);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor:AppColor.orang,
        leading: IconButton(icon: Icon(Icons.chat),onPressed: () {
           Get.toNamed("Message", arguments: args);
        },),
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
            _retriveUser();
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder<List>(
                  future: _retriveUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                             decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 91, 0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(colors: [
                                      AppColor.orang2, 
            AppColor.orang
                                ]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                            child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: AppColor.primaryColor,
                                ),
                                title: Text(
                                  snapshot.data?[index]['student_name'],
                                ),
                                // ignore: prefer_interpolation_to_compose_strings
                                subtitle: Text(snapshot.data![index]['academic_year'].toString() +
                                    "\n" +
                                    snapshot.data?[index]['specialization'] +
                                    "\n" +
                                    snapshot.data?[index]['address'] +
                                    "\n" +
                                    snapshot.data?[index]['date_of_birth'] +
                                    "\n" +
                                    snapshot.data![index]['gpa'].toString()),
                                trailing: IconButton(
                                  icon: Icon(Icons.add,color: AppColor.primaryColor,),
                                  onPressed: () {
                                    g.add(snapshot.data?[index]['student_name']);
                                    
                                  Get.toNamed("UserChatPage", arguments: g);
                                  },
                                )),
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
      ),
    );
  }
}
