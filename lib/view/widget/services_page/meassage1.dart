// ignore_for_file: avoid_print, unnecessary_string_interpolations, prefer_const_constructors, sized_box_for_whitespace, unnecessary_brace_in_string_interps, unnecessary_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  Client client = http.Client();
  List<dynamic> chatRooms = [];
  String? x;

  @override
  void initState() {
    super.initState();
    _retriveChat1(); // pass the g list as a parameter
  }

  Future<void> _retriveChat1() async {
    // accept the g list as a parameter

    try {
      print(x);
      await Future.delayed(Duration(microseconds: 500));
      var response = await http.get(
          Uri.parse('${Share.Url}get_chat_rooms/${x}/'),
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
          chatRooms = jsonDecode(response.body)['chat_rooms'];
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
    final args = ModalRoute.of(context)!.settings.arguments as String;
    print(args);
    List<dynamic> g = jsonDecode(args);
    x = g[0]["student_name"].toString();
    print(g[0]["student_name"]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor:AppColor.orang2,
      ),
      body: RefreshIndicator(
        onRefresh: () => _retriveChat1(), // pass the g list as a parameter
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
                    for (var chatRoom in chatRooms)
                      Card(
                        child: ListTile(
                          leading: IconButton(
                            color:const Color.fromARGB(255, 225, 72, 25),
                            icon: Icon(Icons.chat),
                            onPressed: () {
                              Get.toNamed("ChatPage", arguments: chatRoom);
                            },
                          ),
                          title: chatRoom['user1'].toString()==x?Text(chatRoom['user2']):Text(chatRoom['user1']),
                          subtitle: Text(chatRoom['last_message']),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color:Color.fromARGB(255, 255, 0, 0),
                            ),
                            onPressed: () async {
                              print(chatRoom['id']);
                              setState(() {
                                chatRooms.remove(chatRoom);
                              });
                              deleteNote(chatRoom['id'].toString());
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
