import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';

class GenerateCenter extends StatefulWidget {
  final Map<String, dynamic> json;

  const GenerateCenter({Key? key, required this.json}) : super(key: key);

  @override
  State<GenerateCenter> createState() => _GenerateCenterState();
}

class _GenerateCenterState extends State<GenerateCenter> {
  Map<String, dynamic>? _child;

  _fetchValues(){
    setState(() {
      try{
        _child = widget.json["child"];
      }catch(e){
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();

    if(_child != null){
      return Center(
        child: Generator.generateWidget(_child),
      );
    }
    else{
      return SizedBox();
    }
  }
}
