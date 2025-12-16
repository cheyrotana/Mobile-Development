import 'package:flutter/material.dart';
import 'ui/groceries/grocery_list.dart';
import './ui/Theme/theme.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Groceries',
      theme: appTheme,
      home: const GroceryList(),
    );
  }
}
