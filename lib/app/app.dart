import 'package:flutter/material.dart';
import 'package:tut_app/presentation/resources/thems_manager.dart';

class MyApp extends StatefulWidget {

  MyApp._internal(); // Named Constructor
  static final MyApp _instance = MyApp._internal(); // SingelTon 
  factory MyApp()=>_instance; //Factory for return instance

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getApplicationTheme(),
    );
  }
}
