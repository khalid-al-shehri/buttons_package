import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';

class GenerateColumn extends StatefulWidget {
  final Map<String, dynamic> json;

  const GenerateColumn({Key? key, required this.json}) : super(key: key);

  @override
  State<GenerateColumn> createState() => _GenerateColumnState();
}

class _GenerateColumnState extends State<GenerateColumn> {
  List<Map<String, dynamic>>? _children;

  @override
  initState(){
    super.initState();
    _children = widget.json["children"];
  }

  @override
  Widget build(BuildContext context) {
    if(_children != null){
      return Column(
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
