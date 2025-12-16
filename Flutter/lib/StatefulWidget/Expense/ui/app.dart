import 'package:flutter/material.dart';

import '../models/expense.dart';
import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> _expenses = [];

  void onAddClicked(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      builder: (c) => Center(
        child: ExpenseForm(
          onExpenseCreate: (expense) {
            setState(() {
              _expenses.add(expense);
            });
          },
        ),
      ),
    );
  }

  void onUndo(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onAddClicked(context),
            icon: Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ExpensesView(
        expenses: _expenses,
        onExpenseRemoved: (expense) {
          setState(() {
            _expenses.remove(expense);
          });

          ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(seconds: 3),
              content: const Text('Expense deleted'),
              action: SnackBarAction(
                label: 'Undo',
                onPressed: () => onUndo(expense),
              ),
            ),
          );
        },
      ),
    );
  }
}
