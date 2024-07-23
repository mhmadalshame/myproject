// ignore_for_file: library_prefixes, prefer_const_constructors_in_immutables, avoid_print, depend_on_referenced_packages, prefer_const_constructors, unnecessary_string_interpolations

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as Path;
import 'package:universityservices/core/constant/color.dart';
import 'package:universityservices/core/shared/share.dart';
//import 'package:universityservices/view/widget/services_page/check_permission.dart';
import 'package:universityservices/view/widget/services_page/directory_path.dart';
import 'package:http/http.dart' as http;

class Gradtion2 extends StatefulWidget {
  Gradtion2({super.key});

  @override
  State<Gradtion2> createState() => _Gradtion2State();
}

class _Gradtion2State extends State<Gradtion2> {
  bool isPermission = false;
    List<dynamic> dataList = [];
 // var checkAllPermissions = CheckPermission();

  checkPermission() async {
  //  var permission = await checkAllPermissions.isStoragePermission();
    //if (permission) {
      setState(() {
        isPermission = true;
      });
    //}
  }

  @override
  void initState() {
    super.initState();
    checkPermission();
    fetchNewsData();

  }


   Future<void> fetchNewsData() async {
    String url = "${Share.Url}getvideo1";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        dataList = json.decode(response.body);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
        body: isPermission
            ? ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (BuildContext context, int index) {
                  var data = dataList[index];
                  return TileList(
                    fileUrl: "${Share.Url}getvideopath1/${data['name']}",
                    title: data['name'].toString(),
                  );
                })
            : TextButton(
                onPressed: () {
                  checkPermission();
                },
                child: const Text("Permission issue")));
  }
}

class TileList extends StatefulWidget {
  TileList({super.key, required this.fileUrl, required this.title});
  final String fileUrl;
  final String title;

  @override
  State<TileList> createState() => _TileListState();
}

class _TileListState extends State<TileList> {
  bool dowloading = false;
  bool fileExists = false;
  double progress = 0;
  String fileName = "";
  late String filePath;
  late CancelToken cancelToken;
  var getPathFile = DirectoryPath();

  startDownload() async {
    cancelToken = CancelToken();
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    setState(() {
      dowloading = true;
      progress = 0;
    });

    try {
      await Dio().download(widget.fileUrl, filePath,
          onReceiveProgress: (count, total) {
        setState(() {
          progress = (count / total);
        });
      }, cancelToken: cancelToken);
      setState(() {
        dowloading = false;
        fileExists = true;
      });
    } catch (e) {
      print(e);
      setState(() {
        dowloading = false;
      });
    }
  }

  cancelDownload() {
    cancelToken.cancel();
    setState(() {
      dowloading = false;
    });
  }

  checkFileExit() async {
    var storePath = await getPathFile.getPath();
    filePath = '$storePath/$fileName';
    bool fileExistCheck = await File(filePath).exists();
    setState(() {
      fileExists = fileExistCheck;
    });
  }

  openfile() {
    OpenFile.open(filePath,type: "video/mp4");
    print("fff $filePath");
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fileName = Path.basename(widget.fileUrl);
    });
    checkFileExit();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.grey.shade100,
      child: ListTile(
          title: Text(widget.title),
          leading: IconButton(
              onPressed: () {
                fileExists && dowloading == false
                    ? openfile()
                    : cancelDownload();
              },
              icon: fileExists && dowloading == false
                  ? const Icon(
                      Icons.window,
                      color: Colors.green,
                    )
                  : const Icon(Icons.close)),
          trailing: IconButton(
              onPressed: () {
                fileExists && dowloading == false
                    ? openfile()
                    : startDownload();
              },
              icon: fileExists
                  ? const Icon(
                      Icons.save,
                      color: Colors.green,
                    )
                  : dowloading
                      ? Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(
                              value: progress,
                              strokeWidth: 3,
                              backgroundColor: Colors.grey,
                              valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.blue),
                            ),
                            Text(
                              "${(progress * 100).toStringAsFixed(2)}",
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        )
                      : const Icon(Icons.download))),
    );
  }
}
