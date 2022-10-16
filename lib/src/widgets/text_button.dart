import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';
import 'package:ssr_package/src/models/UI_model.dart';

class GenerateTextButton extends StatefulWidget {

  final UIModel uiModel;

  const GenerateTextButton(this.uiModel, {Key? key}) : super(key: key);

  @override
  State<GenerateTextButton> createState() => _GenerateTextButtonState();
}

class _GenerateTextButtonState extends State<GenerateTextButton> {
  Args? _args;

  String _text = "";
  String? _print;

  _fetchValues(){
    _args = widget.uiModel.args;

    checkText(_args);
    checkOnPressed(_args);
  }

  checkText(Args? args){
    if(args != null){
      // Text
      setState(() {
        _text = args.title ?? "";
      });
    }
  }

  checkOnPressed(Args? args){
    if(args != null){
      // onPressed
      setState(() {
        _print = args.onPressed?.print;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();

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
