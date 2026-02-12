import 'package:flutter/material.dart';
import 'ButtonCounter/button_counter_screen.dart';
import 'GlobalStats/global_stats_screen.dart';
import '../Model/counter_model.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> implements Observer {
  late final CounterModel _model;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _model = CounterModel();
    _model.addObserver(this);
  }

  @override
  void dispose() {
    _model.removeObserver(this);
    super.dispose();
  }

  @override
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: [
            ButtonCounterScreen(model: _model),
            GlobalStatsScreen(model: _model),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Buttons'),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Stats',
            ),
          ],
        ),
      ),
    );
  }
}
