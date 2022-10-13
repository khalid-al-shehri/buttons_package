import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';

class GenerateColumn extends StatefulWidget {
  final Map<String, dynamic> json;

  const GenerateColumn({Key? key, required this.json}) : super(key: key);

  @override
  State<GenerateColumn> createState() => _GenerateColumnState();
}

class _GenerateColumnState extends State<GenerateColumn> {
  List<dynamic>? _children;
  Map<String, dynamic>? _args;
  bool top = true;
  bool bottom = false;
  bool center = false;

  _fetchValues(){
    setState(() {
      _children = widget.json["children"];
      _args = widget.json["args"];
    });


  }

  _getMainAlignment(Map<String, dynamic> ){

  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();

    if(_children != null){
      return Column(
        mainAxisAlignment: ,
        children: List.generate(
          _children!.length,
              (index) {
            return Generator.generateWidget(_children![index]);
          },
        ),
      );
    }
    else{
      return SizedBox();
    }
  }
}
