// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_unnecessary_containers, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:universityservices/core/constant/color.dart';

import 'package:universityservices/core/shared/share.dart';

class Arts1 extends StatefulWidget {
  @override
  _Arts1State createState() => _Arts1State();
}

class _Arts1State extends State<Arts1> {
  List<dynamic> newsData = [];

  Future<void> fetchNewsData() async {
    String url = "${Share.Url}getNewsSouvenir";
    final response =
        await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        newsData = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Container(
        
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 650,
                padding: const EdgeInsets.all(5),
                child: Swiper(
                  fade: 0.0,
                  itemBuilder: (BuildContext context, int index) {
                    var newsImage = newsData[index]['news_image'];
                    return Column(
                      children: <Widget>[
                        Container(
                          
                          height: 420,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: newsImage != null
                              ? Image.memory(
                                  base64Decode(newsImage),
                                  fit: BoxFit.contain,
                                )
                              : const Placeholder(), // Placeholder for no image
                        ),
                        Container(
                          height: 100,
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
                          child: SingleChildScrollView(
                            child: ListTile(
                            subtitle: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(newsData[index]['news_content'],style: TextStyle(color: Colors.black,),textAlign:TextAlign.center ),
                                ),
                                title: Text(newsData[index]['news_title'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: newsData.length,
                  scale: 0.9,
                  pagination: const SwiperPagination(
                    margin: EdgeInsets.all(1),
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
