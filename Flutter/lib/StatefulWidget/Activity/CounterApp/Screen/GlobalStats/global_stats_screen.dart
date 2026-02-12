import 'package:flutter/material.dart';
import '../../Model/counter_model.dart';

class GlobalStatsScreen extends StatelessWidget {
  final CounterModel model;

  const GlobalStatsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Red Taps: ${model.redTaps}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          Text(
            'Blue Taps: ${model.blueTaps}',
            style: const TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
