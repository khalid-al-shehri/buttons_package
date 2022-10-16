import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';
import 'package:ssr_package/src/models/UI_model.dart';

class GenerateText extends StatefulWidget {

  final UIModel uiModel;

  const GenerateText(this.uiModel, {Key? key}) : super(key: key);

  @override
  State<GenerateText> createState() => _GenerateTextState();
}

class _GenerateTextState extends State<GenerateText> {

  Args? _args;

  String? _text;

  _fetchValues(){
    _args = widget.uiModel.args;

    checkText(_args);
  }

  checkText(Args? args){
    if(args != null){
      // Text
      setState(() {
        _text = args.text;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();
    return Text(
      _text ?? ""
    );
  }
}
