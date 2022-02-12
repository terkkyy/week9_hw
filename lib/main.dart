import 'package:week9/Nextpage.dart';
import 'package:flutter/material.dart';
import 'package:week9/Nextpage.dart';
import 'package:week9/Numpad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PIN PASSWORD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Numpad(),
    );
  }

}