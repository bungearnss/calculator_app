import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './binding/get_binding.dart';
import './screen/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: GetBinding(),
      title: "Calculator App",
      home: CalculatorScreen(),
    );
  }
}
