import 'package:ssr_package/src/widgets/center.dart';
import 'package:ssr_package/src/widgets/column.dart';
import 'package:ssr_package/src/widgets/scaffold.dart';
import 'package:ssr_package/src/widgets/text.dart';
import 'package:ssr_package/src/widgets/text_button.dart';
import 'package:flutter/material.dart';

class Generator{

  static Widget generateWidget(Map<String, dynamic>? json){
    if(json != null && json.containsKey("type")){
      String type = json["type"].toString();

      if(type == "scaffold"){
        return GenerateScaffold(
          json: json,
        );
      }
      else if(type == "text"){
        return GenerateText(
          json: json,
        );
      }
      else if(type == "column"){
        return GenerateColumn(
          json: json,
        );
      }
      else if(type == "text_button"){
        return GenerateTextButton(
          json: json,
        );
      }
      else if(type == "center"){
        return GenerateCenter(
          json: json,
        );
      }
      else{
        return const SizedBox();
      }
    }
    else{
      return const SizedBox();
    }
  }

}