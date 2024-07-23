// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_declarations, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universityservices/core/constant/color.dart';
import 'dart:convert';

import 'package:universityservices/core/shared/share.dart';

class Education2 extends StatefulWidget {
  @override
  _Education2State createState() => _Education2State();
}

class _Education2State extends State<Education2> {
  final TextEditingController _controller = TextEditingController();
  final List<String> messages = [];

  Future<void> sendMessage(String message) async {
    setState(() {
      messages.add('You: $message');
    });


    final endpoint = '${Share.Url}chatgpt/$message';

    try {
      final response = await http.get(
        Uri.parse(endpoint),
      
       
      );

      if (response.statusCode == 200) {

        final reply = jsonDecode(response.body);
        setState(() {
          messages.add('AI: $reply');
        });
      }
    } catch (e) {
      print('Error: $e');
    }

    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Text('Chat with AI'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index],style: TextStyle(color:messages[index].contains("AI:")? Color.fromARGB(255, 82, 113, 2):Color.fromARGB(255, 0, 0, 0)),),
                  
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(color: AppColor.black)
                    ),
                    onSubmitted: sendMessage,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}