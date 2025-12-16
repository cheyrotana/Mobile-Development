import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final void Function(Expense) onExpenseCreate;
  const ExpenseForm({super.key, required this.onExpenseCreate});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.food;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future onDatePickerPressed() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _showValidationError(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void onCreate() {
    String title = _titleController.text;
    DateTime date = _selectedDate;
    Category category = _selectedCategory;

    if (title.isEmpty) {
      _showValidationError('Missing Title', 'Please enter a title for your expense.');
      return;
    }

    double? amount = double.tryParse(_amountController.text);
    if (amount == null || amount.isNaN) {
      _showValidationError('Invalid Amount', 'Please enter a valid number for the amount.');
      return;
    }

    if (amount <= 0) {
      _showValidationError('Invalid Amount', 'Amount must be greater than zero.');
      return;
    }

    if (_selectedDate.isAfter(DateTime.now())) {
      _showValidationError('Invalid Date', 'Cannot select future dates for expenses.');
      return;
    }

    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: category,
    );

    widget.onExpenseCreate(newExpense);

    Navigator.pop(context);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onSelectedCategory(Category? newValue) {
    if (newValue != null) {
      setState(() {
        _selectedCategory = newValue;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),

          TextField(
            controller: _amountController,
            decoration: InputDecoration(label: Text('Amount')),
            maxLength: 50,
          ),

          Row(
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: onSelectedCategory,
              ),
              Spacer(),
              Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              ),
              IconButton(
                onPressed: onDatePickerPressed,
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),

          ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
          ElevatedButton(onPressed: onCreate, child: Text("Create")),
        ],
      ),
    );
  }
}
