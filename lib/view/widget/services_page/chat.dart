// ignore_for_file: prefer_const_constructors, avoid_print, avoid_unnecessary_containers, dead_code, unused_local_variable, unnecessary_new, sized_box_for_whitespace

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.title});

  final String title;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Client client = http.Client();
  TextEditingController controller = TextEditingController();
  List<dynamic> messagess = [];
  String? x;
  String? y;
  String? z;
  String? w;
  Color color = AppColor.orang2;
  Color color1 = Color.fromARGB(255, 173, 158, 148);

  @override
  void initState() {
    _retriveMessages();
    super.initState();
  }

  Future<void> _retriveMessages() async {
    try {
      //xx=https://jsonplaceholder.typicode.com/users/
      await Future.delayed(Duration(microseconds: 500));
      var response = await http
          .get(Uri.parse('${Share.Url}get_messages/$x/$z/'), headers: {
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
          Uri.parse('${Share.Url}send_message/$y/$x/${controller.text}'),
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

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as dynamic;
    x = args['id'].toString();
    y = args['user1'];
    z = args['user2'];
   
    print(args['id']);
    print(args);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: AppColor.backgroundbuttom,
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
            _retriveMessages();
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
                        color: messages['sender'] == y ? color : color1,
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
                color: AppColor.orang,
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
                    hintStyle: TextStyle(color: const Color.fromARGB(255, 1, 1, 1)),
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
