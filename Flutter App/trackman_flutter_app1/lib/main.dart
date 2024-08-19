import 'package:flutter/material.dart';
import 'package:trackman_flutter_app1/const/constant.dart';
import 'package:trackman_flutter_app1/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor ,
        brightness: Brightness.dark,
      ),
      home: const MainScreen(),
    );
  }
}