import 'package:flutter/material.dart';

class ClassroomStudents extends StatelessWidget {
  const ClassroomStudents({super.key, required this.classroomId});
  final String classroomId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber,
      ),
    );
  }
}
