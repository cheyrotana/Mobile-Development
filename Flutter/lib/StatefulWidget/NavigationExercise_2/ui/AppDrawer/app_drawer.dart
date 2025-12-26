import 'package:flutter/material.dart';
import '../classrooms/classrooms.dart';
import '../students/students.dart';
import '../../utils/animations_util.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: const Text('Classrooms'),
            onTap: () {
              Navigator.of(
                context,
              ).push(AnimationUtils.createTopToBottomRoute(Classrooms()));
            },
          ),
          ListTile(
            title: const Text('Students'),
            onTap: () {
              Navigator.of(
                context,
              ).push(AnimationUtils.createTopToBottomRoute(Students()));
            },
          ),
        ],
      ),
    );
  }
}
