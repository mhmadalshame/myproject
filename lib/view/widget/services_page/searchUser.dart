// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, dead_code, unused_local_variable, unnecessary_new, unnecessary_brace_in_string_interps, sized_box_for_whitespace, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({super.key, required this.title});

  final String title;

  @override
  State<SearchUserPage> createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  Client client = http.Client();
  TextEditingController controller = TextEditingController();

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

  String x = "";
  Future<List> _retriveUser1() async {
    try {
      if (controller.text.isNotEmpty) {
        x = controller.text;
      }
      var response = await http.get(
          Uri.parse('${Share.Url}getStudentbyfullname/${x}'),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
          });

      if (response.statusCode == 200) {
        print(response.statusCode);
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
            controller.clear();
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
              TextField(
                controller: controller,
                onChanged: (value) async {
                  setState(() {
                    _retriveUser1();
                  });
                },
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
                    icon: Icon(Icons.search)),
              ),
              Expanded(
                child: FutureBuilder<List>(
                  future: controller.text.isEmpty
                      ? _retriveUser()
                      : _retriveUser1(),
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
                              trailing: Icon(Icons.more_vert),
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
      ),
    );
  }
}
