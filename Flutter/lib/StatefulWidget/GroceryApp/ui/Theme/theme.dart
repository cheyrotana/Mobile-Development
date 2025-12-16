import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData.light().copyWith(

  // Scaffold background
  scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),

  // AppBar theme
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 150, 136),
    foregroundColor: Colors.white,
    elevation: 2,
  ),

  // ListTile theme
  listTileTheme: ListTileThemeData(
    tileColor: Colors.white,
    textColor: Colors.black87,
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      side: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
  ),

  // Text theme
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 18,
      color: Colors.black87,
    ), // Large body text
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.black54,
    ), // Medium body text
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black87,
    ), // Large titles
  ),

  // ElevatedButton theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
  ),

  // Input decoration theme
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal), // Teal border when focused
    ),
  ),
);
