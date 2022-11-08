import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI CALCULATOR',
      theme: ThemeData.dark().copyWith(primaryColor:kPrimaryColor ,scaffoldBackgroundColor: kPrimaryColor),
      home: const InputPage(),
    );
  }
}



