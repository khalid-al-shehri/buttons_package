import 'dart:convert';
import 'package:ssr_package/ssr_package.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'SSR'),
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
  final Map<String, dynamic> _json = {
    "type": "scaffold",
    "args": {
      "app_bar": {
        "title": "SSR"
      }
    },
    "child": {
      "type": "column",
      "children": [
        {
          "type": "text",
          "args": {
            "text": "Khalid"
          }
        },
        {
          "type": "column",
          "children": [
            {
              "type": "text_button",
              "args": {
                "title": "Click me 1",
                "onPressed": {
                  "print": "khalid mohammed"
                }
              }
            },
            {
              "type": "text_button",
              "args": {
                "title": "Click me 2",
                "onPressed": {
                  "print": null
                }
              }
            }
          ]
        }
      ]
    }
  };

  @override
  Widget build(BuildContext context) {
    return Material(
      child: WidgetByJson(json: _json),
    );
  }
}
