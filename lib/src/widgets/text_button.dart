import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';

class GenerateTextButton extends StatefulWidget {

  final Map<String, dynamic> json;

  const GenerateTextButton({Key? key, required this.json}) : super(key: key);

  @override
  State<GenerateTextButton> createState() => _GenerateTextButtonState();
}

class _GenerateTextButtonState extends State<GenerateTextButton> {
  Map<String, dynamic>? _args;

  String _text = "";
  String? _print;

  @override
  initState(){
    super.initState();
    _args = widget.json["args"];

    checkText(_args);
    checkOnPressed(_args);
  }

  checkText(Map<String, dynamic>? args){
    if(args != null){
      // Text
      if(args.containsKey("title")){
        setState(() {
          _text = args["title"];
        });
      }
    }
  }

  checkOnPressed(Map<String, dynamic>? args){
    if(args != null){
      // onPressed
      if(args.containsKey("onPressed")){
        setState(() {
          _print = args["onPressed"]["print"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: _print != null ? (){
        debugPrint(_print);
      } : null,
      child: Text(
        _text
      ),
    );
  }
}
