import 'package:flutter/material.dart';
import './student/student_details.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      'Frozen',
      'Ropz',
      'Karrigan',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Students')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];

          return ListTile(
            leading: const Icon(Icons.class_),
            title: Text(student),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      StudentDetails(studentId: student),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
