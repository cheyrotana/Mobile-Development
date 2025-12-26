import 'package:flutter/material.dart';

class ClassroomAssignment extends StatelessWidget {
  const ClassroomAssignment({super.key, required this.classroomId});

  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.pinkAccent));
  }
}
