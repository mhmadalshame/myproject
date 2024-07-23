// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, dead_code, unused_local_variable, unnecessary_new, sized_box_for_whitespace, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';

class DeleteUserPage extends StatefulWidget {
  const DeleteUserPage({super.key, required this.title});

  final String title;

  @override
  State<DeleteUserPage> createState() => _DeleteUserPageState();
}

class _DeleteUserPageState extends State<DeleteUserPage> {
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

  void deleteNote(String id) async {
    String posturl = Share.Url;
    Response response = await delete(Uri.parse("$posturl/$id/deleteStudent/"));
    if (response.statusCode == 200) {
      print("deleted");
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor:AppColor.backgroundbuttom,
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
                          return Card(
                            child: ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.orange,
                                ),
                                title: Text(
                                snapshot.data?[index]['student_name'],
                              ),
                              // ignore: prefer_interpolation_to_compose_strings
                              subtitle: Text(snapshot.data![index]
                                          ['academic_year']
                                      .toString() +
                                  "\n" +
                                  snapshot.data?[index]['specialization'] +
                                  "\n" +
                                  snapshot.data![index]['gpa'].toString() +
                                  "\n" +
                                  snapshot.data![index]['date_of_birth']
                                      .toString() +
                                  "\n" +
                                  snapshot.data![index]['level'].toString()),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    print(snapshot.data?[index]['id']);
                                    setState(() {
                                      _retriveUser();
                                    });
                                    deleteNote((snapshot.data?[index]['id'])
                                        .toString());
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
