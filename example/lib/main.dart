import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ssr_package/ssr_package.dart';
import 'package:ssr_package/src/models/UI_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final channel = IOWebSocketChannel.connect(
    'wss://demo.piesocket.com/v3/channel_1?api_key=VCXCEuvhGcBDP7XhiJJUDvR1e1D3eiVjgZ9VRiaV&notify_self',
  );

  late String data;
  late UIModel uiModel;
  final Map<String, dynamic> _json = {
    "type": "center",
    "child": {
      "type": "column",
      "args":{
        "main_alignment": "center",
        "cross_alignment": "center"
      },
      "children": [
        {
          "type": "text",
          "args": {
            "text": "Server-Side Render"
          }
        },
        {
          "type": "text",
          "args": {
            "text": "Please send any UI-JSON to render it here"
          }
        }
      ]
    }
  };

  filterData(){

    // print("${socketData.toString()}");

    channel.stream.listen((socketData) {
      // print(socketData);
      if(socketData.toString().contains("scaffold")){
        setState(() {
          data = socketData.toString();
          uiModel = UIModel.fromJson(json.decode(data));
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initialUI();
    filterData();
  }

  initialUI(){
    setState(() {
      uiModel = UIModel.fromJson(_json);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          WidgetByJson(uiModel),
        ],
      )
    );
  }
}
