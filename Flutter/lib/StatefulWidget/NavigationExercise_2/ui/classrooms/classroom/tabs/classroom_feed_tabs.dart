import 'package:flutter/material.dart';

class ClassroomFeeds extends StatelessWidget {
  const ClassroomFeeds({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent
      ),
    );
  }
}