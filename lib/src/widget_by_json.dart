import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';

class WidgetByJson extends StatelessWidget {
  final Map<String, dynamic> json;

  const WidgetByJson({
    Key? key,
    required this.json,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Generator.generateWidget(json);
  }
}
