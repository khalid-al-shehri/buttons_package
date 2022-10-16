import 'package:ssr_package/src/generator.dart';
import 'package:flutter/material.dart';
import 'package:ssr_package/src/models/UI_model.dart';

class GenerateScaffold extends StatefulWidget {
  final UIModel uiModel;

  const GenerateScaffold(this.uiModel, {Key? key}) : super(key: key);

  @override
  State<GenerateScaffold> createState() => _GenerateScaffoldState();
}

class _GenerateScaffoldState extends State<GenerateScaffold> {
  UIModel? _child;
  Args? _args;

  String? _appBarTitle;

  _fetchValues() {
    _args = widget.uiModel.args;
    _child = widget.uiModel.child;

    checkAppBar(_args);
  }

  checkAppBar(Args? args) {
    // appBar
    setState(() {
      _appBarTitle = args?.appBar?.title;
    });
  }

  @override
  Widget build(BuildContext context) {
    _fetchValues();

    return Scaffold(
      appBar: _appBarTitle != null
          ? AppBar(
              title: Text(_appBarTitle!),
            )
          : null,
      body: Generator.generateWidget(_child),
    );
  }
}
