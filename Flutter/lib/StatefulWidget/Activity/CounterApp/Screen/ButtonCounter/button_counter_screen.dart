import 'package:flutter/material.dart';
import '../../Model/counter_model.dart';

enum CardType { red, blue }

class ButtonCounterScreen extends StatelessWidget {
  final CounterModel model;

  const ButtonCounterScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColorTap(
          type: CardType.red,
          count: model.redTaps,
          onTap: model.incrementRed,
        ),
        ColorTap(
          type: CardType.blue,
          count: model.blueTaps,
          onTap: model.incrementBlue,
        ),
      ],
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int count;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.count,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $count',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
