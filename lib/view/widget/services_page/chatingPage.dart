// ignore_for_file: prefer_const_constructors, avoid_print, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, unnecessary_import, sized_box_for_whitespace, file_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';

class UserChatPage extends StatefulWidget {
  const UserChatPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<UserChatPage> createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  Client client = http.Client();

  List<dynamic> chatRooms = [];
  TextEditingController controller = TextEditingController();
  List<dynamic> messagess = [];
  String? x;
  String? y;
  String? z;
  dynamic m;

  @override
  void initState() {
    super.initState();
    _createChat(); // pass the g list as a parameter
  }

  Future<void> _createChat() async {
    await Future.delayed(Duration(microseconds: 500));
    // accept the g list as a parameter

    try {
      print(x);
      await Future.delayed(Duration(microseconds: 500));
      var response = await http
          .get(Uri.parse('${Share.Url}create_chat_room/${x}/$y'), headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Credentials': 'true',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
      });

      if (response.statusCode == 200) {
        print(response.statusCode);
        setState(() {
          print(response.body);
          if (response.body.length > 3) {
          
              Get.toNamed("MessageAdminPage", arguments: m);
            
          } else {
            _retriveMessages();
          }
          // print(response.body);

          z = response.body.toString();
        });
      } else {
        throw Exception("server error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _retriveMessages() async {
    try {
      //xx=https://jsonplaceholder.typicode.com/users/
      await Future.delayed(Duration(microseconds: 500));
      var response = await http.get(
          Uri.parse('${Share.Url}get_messages/$z/$y/'),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
          });

      if (response.statusCode == 200) {
        print(response.statusCode);
        setState(() {
          messagess = jsonDecode(response.body)['messages'];
        });
      } else {
        throw Exception("server error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> _sendMessages() async {
    try {
      //xx=https://jsonplaceholder.typicode.com/users/
      await Future.delayed(Duration(microseconds: 500));
      var response = await http.get(
          Uri.parse(
              '${Share.Url}send_message/$y/$z/${controller.text}'),
          headers: {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Credentials': 'true',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE'
          });

      if (response.statusCode == 200) {
        print(response.statusCode);
        setState(() {
          _retriveMessages();
          controller.clear();
        });
      } else {
        throw Exception("server error");
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  void deleteNote(String id) async {
    String posturl = "${Share.Url}";
    Response response = await delete(Uri.parse("$posturl/deletedoner/$id/"));
    if (response.statusCode == 200) {
      print("deleted");
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    //final args1 = ModalRoute.of(context)!.settings.arguments as String;
    m = args;
    print(args);
    x = args[0]["student_name"].toString();
    y = args[1];

    //print(args[0]["full_name"]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor:AppColor.orang,
      ),
      body: RefreshIndicator(
        onRefresh: () => _retriveMessages(), // pass the g list as a parameter
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (var messages in messagess)
                      Card(
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        color: Colors.yellow,
                        child: ListTile(
                          leading: Icon(
                              color: Colors.red, Icons.fork_right_outlined),
                          title: Text(messages['content']),
                          trailing: Text(messages['timestamp']),
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                color:AppColor.orang,
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    suffixIcon: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(0),
                      child: RotatedBox(
                        quarterTurns: 0,
                        child: IconButton(
                          icon: Icon(Icons.send),
                          onPressed: () {
                            _sendMessages();
                          },
                        ),
                      ),
                    ),
                    hintText: ' send meassee',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
