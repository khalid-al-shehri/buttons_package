class UIModel{

  late final String type;
  late UIModel? child;
  late List<UIModel>? children;
  late Args? args;

  UIModel.fromJson(Map<String, dynamic> json){
    type = json["type"];
    child = json["child"] != null ? UIModel.fromJson(json["child"]) : null;
    children = _parseChildren(json);
    args = json["args"] != null ? Args.fromJsom(json["args"]) : null;
  }

  List<UIModel>? _parseChildren(Map<String, dynamic> json){
    if(json["children"] != null){
      return List<UIModel>.from(json["children"].map((x) => UIModel.fromJson(x)));
    }
    return null;
  }
}

class Args{

  String? text;
  String? title;
  AppBarUI? appBar;
  OnPressed? onPressed;
  String? mainAlignment;
  String? crossAlignment;

  Args.fromJsom(Map<String, dynamic> json){
    text = json["text"];
    title = json["title"];
    appBar = json["app_bar"] != null ? AppBarUI.fromJson(json["app_bar"]) : null;
    onPressed = json["on_pressed"] != null ? OnPressed.fromJson(json["on_pressed"]) : null;
    mainAlignment = json["main_alignment"];
    crossAlignment = json["cross_alignment"];
  }
}

class OnPressed{
  String? print;

  OnPressed.fromJson(Map<String, dynamic> json){
    print = json["print"];
  }
}

class AppBarUI{
  String? title;

  AppBarUI.fromJson(Map<String, dynamic> json){
    title = json["title"];
  }
}