import 'package:flutter/material.dart';

enum Types{
  scaffold,
  text,
  column,
  text_button,
  center
}

Types? parseType(String type){
  switch(type){
    case "scaffold":
      return Types.scaffold;
    case "text":
      return Types.text;
    case "column":
      return Types.column;
    case "text_button":
      return Types.text_button;
    case "center":
      return Types.center;
    default:
      return null;
  }
}

MainAxisAlignment parseMainAlignment(String? value){
  switch(value){
    case "center":
      return MainAxisAlignment.center;
    case "start":
      return MainAxisAlignment.start;
    case "end":
      return MainAxisAlignment.end;
    default:
      return MainAxisAlignment.start;
  }
}

CrossAxisAlignment parseCrossAlignment(String? value){
  switch(value){
    case "center":
      return CrossAxisAlignment.center;
    case "start":
      return CrossAxisAlignment.start;
    case "end":
      return CrossAxisAlignment.end;
    default:
      return CrossAxisAlignment.start;
  }
}