import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpensesView extends StatelessWidget {
  const ExpensesView({
    super.key,
    required this.expenses,
    required this.onExpenseRemoved,
  });

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return Center(child: Text('No expenses yet. Please add some!'));
    }
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: Key(expenses[index].id),
        onDismissed: (DismissDirection direction) {
          onExpenseRemoved(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index]),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.free_breakfast;
      case Category.travel:
        return Icons.travel_explore;
      case Category.leisure:
        return Icons.holiday_village;
      case Category.work:
        return Icons.work;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    expense.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${expense.amount.toStringAsFixed(2)} \$"),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(expenseIcon),
                  ),
                  Text(DateFormat.yMMMd().format(expense.date)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
