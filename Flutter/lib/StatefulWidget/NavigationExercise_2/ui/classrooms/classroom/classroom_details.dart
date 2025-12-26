import 'package:flutter/material.dart';

import 'tabs/classroom_feed_tabs.dart';
import 'tabs/classroom_student_tab.dart';
import 'tabs/classroom_assignment_tab.dart';

class ClassroomDetails extends StatefulWidget {
  const ClassroomDetails({super.key, required this.classroomId});

  final String classroomId;

  @override
  State<ClassroomDetails> createState() => _ClassroomDetailsState();
}

enum ClassroomTab { feedTab, studentsTab, assignmentTab }

class _ClassroomDetailsState extends State<ClassroomDetails> {
  ClassroomTab _currentTab = ClassroomTab.feedTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Classroom ${widget.classroomId}')),
      body: IndexedStack(
        index: _currentTab.index,
        children: [
          ClassroomFeeds(classroomId: widget.classroomId),
          ClassroomStudents(classroomId: widget.classroomId),
          ClassroomAssignment(classroomId: widget.classroomId)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab.index,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            _currentTab = ClassroomTab.values[index];
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_feed),
            label: 'Feed',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Students'),
          BottomNavigationBarItem(icon: Icon(Icons.assignment), label: 'Assignments'),
        ],
      ),
    );
  }
}
