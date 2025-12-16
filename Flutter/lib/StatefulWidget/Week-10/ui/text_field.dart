import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _titleController = TextEditingController();
  double price = 0.0;

  void updateTitle(String newPrice) {
    setState(() {
      price = double.tryParse(newPrice) ?? 0.0;
    });
  }

  double get priceRiel => price * 4000 ;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            onChanged: updateTitle,
            decoration: InputDecoration(
              labelText: 'Price',
              // border: OutlineInputBorder(),
            ),
          ),
          Text(priceRiel.toStringAsFixed(2)),

          // TextField(
          //   decoration: InputDecoration(
          //     labelText: 'Price',
          //     // border: OutlineInputBorder()
          //   ),
          // ),
        ],
      ),
    );
  }
}
