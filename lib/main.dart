import 'package:flutter/material.dart';
import 'package:sbbwu_class/screen/first_screen.dart';
import 'package:sbbwu_class/screen/web_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase project',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const Webview(),
    );
  }
}
