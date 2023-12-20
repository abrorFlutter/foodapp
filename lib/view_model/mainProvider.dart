import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainProvider extends ChangeNotifier{

  static const stringKey = "str";
  //String text = '';

  Future setName(String text) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(stringKey, text);

  }

  Future setDesc(String text) async{
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(stringKey, text);

  }

  Future<String> getName() async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey) ?? "";

  }

  Future<String> getDesc() async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString(stringKey) ?? "";

  }


  void notifierMetod() {
    notifyListeners();
  }
}