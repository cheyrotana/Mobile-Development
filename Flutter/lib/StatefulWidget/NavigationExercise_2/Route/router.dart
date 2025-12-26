import 'package:flutterexercise/StatefulWidget/NavigationExercise_2/ui/classrooms/classrooms.dart';
import 'package:flutterexercise/StatefulWidget/NavigationExercise_2/ui/home.dart';
import 'package:flutterexercise/StatefulWidget/NavigationExercise_2/ui/students/students.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(path: '/',builder: (context, state) => Home()),
    GoRoute(path: '/', builder: (context, state) => Classrooms()),
    GoRoute(path: '/', builder: (context, state) => Students()),
    GoRoute(path: '/', builder: (context, state) => Home()),
]);
