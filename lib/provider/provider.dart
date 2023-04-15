import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getcurrentuser with ChangeNotifier, DiagnosticableTreeMixin {
  static String? name = "";
  static String? email = "";

  String? get userName => name;
  String? get userEmail => email;
  void getuser() async {
    final prefs = await SharedPreferences.getInstance();

    name = prefs.getString('user_name');
    email = prefs.getString('user_email');

    if (name == Null || name == '' || name == null) {
      name = email;
    }

    notifyListeners();
  }
}


// class Getdomain with ChangeNotifier, DiagnosticableTreeMixin {
//   static String? name = "";
//   static String? email = "";

//   String? get userName => name;
//   String? get userEmail => email;
//   void getuser() async {
//     final prefs = await SharedPreferences.getInstance();

//     name = prefs.getString('user_name');
//     email = prefs.getString('user_email');

//     if (name == Null || name == '' || name == null) {
//       name = email;
//     }

//     notifyListeners();
//   }
// }
