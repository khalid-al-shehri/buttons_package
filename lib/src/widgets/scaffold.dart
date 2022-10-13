import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';

class GenerateScaffold extends StatefulWidget {

  final Map<String, dynamic> json;

  const GenerateScaffold({Key? key, required this.json}) : super(key: key);

  @override
  State<GenerateScaffold> createState() => _GenerateScaffoldState();
}

class _GenerateScaffoldState extends State<GenerateScaffold> {

  Map<String, dynamic>? _child;
  Map<String, dynamic>? _args;

  String? _appBarTitle;

  _fetchValues(){
    _args = widget.json["args"];
    _child = widget.json["child"];

    checkAppBar(_args);
  }

  checkAppBar(Map<String, dynamic>? args){
    if(args != null){
      // appBar
      if(args.containsKey("app_bar")){
        setState(() {
          _appBarTitle = args["app_bar"]["title"];
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();

    return Scaffold(
      appBar: _appBarTitle != null
          ?
          AppBar(
            title: Text(
              _appBarTitle!
            ),
          ) : null,
      body: Generator.generateWidget(_child),
    );
  }
}
