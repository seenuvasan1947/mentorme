import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getcurrentuser with ChangeNotifier, DiagnosticableTreeMixin {
  static String? crnt_user = "";
  static String? crnt_email= "";

  String? get userName => crnt_user;
  String? get userEmail => crnt_email;

  void getuser() async {
    final prefs = await SharedPreferences.getInstance();
    crnt_email = prefs.getString('user_email');
    crnt_user = prefs.getString('user_name');

    if(crnt_user==null||crnt_user==""||crnt_user==''||crnt_user==Null){
      crnt_user=crnt_email;
    }
    // password = prefs.getString('password');

    

    notifyListeners();
  }
}
