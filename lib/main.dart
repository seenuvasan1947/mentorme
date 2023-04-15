import 'package:flutter/material.dart';
import 'package:mentorme/components/language/multi_lang.dart';
import 'package:mentorme/provider/provider.dart';
import 'package:mentorme/screens/home_screen.dart';
import 'package:mentorme/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
      
  runApp(MultiProvider(providers: [

ChangeNotifierProvider(create: (_) => Getcurrentuser())

  ],
  child: const MaterialApp(home: HomeScreen()),
  // child: const MaterialApp(home: MyApp()),
  ));
}
