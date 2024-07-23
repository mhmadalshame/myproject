// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last, use_build_context_synchronously, unnecessary_import, unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:universityservices/core/constant/color.dart';

import 'package:universityservices/core/shared/share.dart';

class Sport1 extends StatefulWidget {
  @override
  _Sport1State createState() => _Sport1State();
}

class _Sport1State extends State<Sport1> {
  late bool ss;
  late int counter;
  late String args11;
  Map<int, String> selectedOptions = {};
  Map<int, int> selectedindex = {};
  Color colo1 = Colors.black;
  Color colo2 = Colors.black54;
  Color? colo3 = Colors.green[900];
  Color? colo4 = const Color.fromARGB(255, 223, 1, 1);

  List<dynamic> questions = [];
  List<dynamic> g = [];
  @override
  void initState() {
    super.initState();

    ss = false;
    counter = 0;
    args11 = '';
  }

  Future<void> retrieveQuestions() async {
    if (questions.isEmpty) {
      final response = await http
          .get(Uri.parse('${Share.Url}get_openai_mcqsabousport/${args11}'));
      if (response.statusCode == 200) {
        questions = jsonDecode(response.body);
      } else {
        // Handle error
      }
    }
  }

  Color getOptionColor(int index) {
    if (selectedOptions.containsKey(index)) {
      final correctAnswerIndex = questions[index]['correct_answer'];
      if (selectedindex[index] == correctAnswerIndex) {
        return Colors.green;
      } else {
        return Colors.red;
      }
    }
    return Colors.black;
  }

  void selectOption(int index, String option, int n) {
    ss = false;
    setState(() {
      selectedOptions[index] = option;
      selectedindex[index] = n;

      counter = 0;
      for (int i = 0; i < selectedindex.length; i++) {
        final selected = selectedindex[i];
        final correct = questions[i]['correct_answer'];

        if (selected == correct) {
          counter++;
        }
      }
    });
  }

  void save() async {
    setState(() {
      ss = true;
    });

    print(counter);
    print(g[0]['level']);
    String postUrl = "${Share.Url}createSport/";
    if (args11 == "football" || args11 == "chess" || args11 == "basketball") {
      if (counter >= 5) {
        var request = http.MultipartRequest('POST', Uri.parse(postUrl));
        request.fields['student'] = g[0]['id'].toString();
        request.fields['name'] = args11;
        request.fields['level'] = counter.toString();

        var response = await request.send();
        if (response.statusCode == 200) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Column(
                  children: [
                    Text('Congratalations register sport '),
                    Text('Your Answer is $counter from 10'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Column(
                  children: [
                    Text('Sorry you alredy register'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context1) {
            return AlertDialog(
              title: Column(
                children: [
                  Text('Your Answer is $counter from 10'),
                  Text('Sorry not register in sport  ')
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context1);
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }else{
      showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Column(
                  children: [
                    
                    Text('Your Score is $counter from 10'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
  }}

  @override
  Widget build(BuildContext context) {
    final args1 =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final args = args1['args'];
    args11 = args1['sporttype'];
    g = jsonDecode(args);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sport'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColor.background, AppColor.background],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: FutureBuilder<void>(
                  future: retrieveQuestions(),
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) {
                    if (questions.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: questions.length,
                        itemBuilder: (BuildContext context, int index) {
                          final question = questions[index];
                          final text = question['question'];
                          final option1 = question['options'][0];
                          final option2 = question['options'][1];
                          final option3 = question['options'][2];
                        //  final ans = question['correct_answer'];
                          return Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 194, 91, 0),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                    colors: [AppColor.orang2, AppColor.orang]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "$text",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: selectedOptions.isEmpty ||
                                              ss == false
                                          ? const Color.fromARGB(255, 8, 0, 0)
                                          : getOptionColor(index)),
                                ),
                                SizedBox(height: 10),
                                Column(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        selectOption(index, option1, 1);

                                        colo1 = Colors.black;
                                      },
                                      child: Text(
                                        option1,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: selectedOptions
                                                      .containsKey(index) &&
                                                  selectedOptions[index] ==
                                                      option1
                                              ? colo1
                                              : colo2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        selectOption(index, option2, 2);

                                        colo1 = Colors.black;
                                      },
                                      child: Text(
                                        option2,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: selectedOptions
                                                      .containsKey(index) &&
                                                  selectedOptions[index] ==
                                                      option2
                                              ? colo1
                                              : colo2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        selectOption(index, option3, 3);

                                        colo1 = Colors.black;
                                      },
                                      child: Text(
                                        option3,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: selectedOptions
                                                      .containsKey(index) &&
                                                  selectedOptions[index] ==
                                                      option3
                                              ? colo1
                                              : colo2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              ElevatedButton(
                onPressed: save,
                child: Text('Save'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
