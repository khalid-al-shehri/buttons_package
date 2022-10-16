import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';
import 'package:ssr_package/src/models/UI_model.dart';

class GenerateCenter extends StatefulWidget {
  final UIModel model;

  const GenerateCenter(this.model, {Key? key}) : super(key: key);

  @override
  State<GenerateCenter> createState() => _GenerateCenterState();
}

class _GenerateCenterState extends State<GenerateCenter> {
  UIModel? _child;

  _fetchValues(){
    setState(() {
      try{
        _child = widget.model.child;
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
