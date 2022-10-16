import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';
import 'package:ssr_package/src/models/UI_model.dart';

import '../utiles/enums.dart';

class GenerateColumn extends StatefulWidget {
  final UIModel uiModel;

  const GenerateColumn(this.uiModel, {Key? key}) : super(key: key);

  @override
  State<GenerateColumn> createState() => _GenerateColumnState();
}

class _GenerateColumnState extends State<GenerateColumn> {
  List<UIModel>? _children;
  Args? _args;
  bool top = true;
  bool bottom = false;
  bool center = false;

  _fetchValues(){
    setState(() {
      _children = widget.uiModel.children;
      _args = widget.uiModel.args;
    });


  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();

    if(_children != null){
      return Column(
        mainAxisAlignment: parseMainAlignment(_args?.mainAlignment),
        crossAxisAlignment: CrossAxisAlignment.center,
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
