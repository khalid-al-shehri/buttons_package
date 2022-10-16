import 'package:ssr_package/src/models/UI_model.dart';
import 'package:ssr_package/src/utiles/enums.dart';
import 'package:ssr_package/src/widgets/center.dart';
import 'package:ssr_package/src/widgets/column.dart';
import 'package:ssr_package/src/widgets/scaffold.dart';
import 'package:ssr_package/src/widgets/text.dart';
import 'package:ssr_package/src/widgets/text_button.dart';
import 'package:flutter/material.dart';

class Generator{

  static Widget generateWidget(UIModel? model){
    if(model != null){
      String type = model.type;

      if(parseType(type) == Types.scaffold){
        return GenerateScaffold(model);
      }
      else if(parseType(type) == Types.text){
        return GenerateText(model);
      }
      else if(parseType(type) == Types.column){
        return GenerateColumn(model);
      }
      else if(parseType(type) == Types.text_button){
        return GenerateTextButton(model);
      }
      else if(parseType(type) == Types.center){
        return GenerateCenter(model);
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