import 'package:buttons/src/generator.dart';
import 'package:flutter/material.dart';

class GenerateText extends StatefulWidget {

  final Map<String, dynamic> json;

  const GenerateText({Key? key, required this.json}) : super(key: key);

  @override
  State<GenerateText> createState() => _GenerateTextState();
}

class _GenerateTextState extends State<GenerateText> {

  Map<String, dynamic>? _child;
  Map<String, dynamic>? _args;

  String _text = "";

  _GenerateTextState(){
    _args = widget.json["args"];
    _child = widget.json["child"];

    checkText(_args);
  }

  checkText(Map<String, dynamic>? args){
    if(args != null){
      // Text
      if(args.containsKey("text")){
        setState(() {
          _text = args["text"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text
    );
  }
}
