import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';
import 'package:ssr_package/src/models/UI_model.dart';

class WidgetByJson extends StatelessWidget {
  final UIModel model;

  const WidgetByJson(this.model, {
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Generator.generateWidget(model);
  }
}
