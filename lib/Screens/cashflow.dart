import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//dummy data
class CashFlowItem {
  final String description;
  final double amount;
  final bool isIncome;
  final DateTime date; // Add a date property

  CashFlowItem({
    required this.description,
    required this.amount,
    required this.isIncome,
    required this.date, // Initialize date when creating an instance
  });
}

List<CashFlowItem> cashFlowData = [
  CashFlowItem(
    description: 'Salary',
    amount: 2500.0,
    isIncome: true,
    date: DateTime(2023, 9, 1), // Add a date for the first item
  ),
  CashFlowItem(
    description: 'Buy a new phone',
    amount: 300.0,
    isIncome: false,
    date: DateTime(2023, 11, 10), // Add a date for the first item
  ),
  // Add dates for other items here
];

//dummy data

class DetailCashFlowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 85, 145, 141),
        title: Text('Detail Cash Flow'),
      ),
      body: ListView.builder(
        itemCount: cashFlowData.length, // Replace with your data source
        itemBuilder: (context, index) {
          final item = cashFlowData[index]; // Replace with your data model

          // Determine the arrow icon color based on income or expense
          final iconColor = item.isIncome ? Colors.green : Colors.red;

          return ListTile(
            leading: Icon(
              Icons.arrow_forward,
              color: iconColor,
            ),
            title: Text(item.description), // Display item description
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Date: ${DateFormat('MMM dd, yyyy').format(item.date)}'), // Display date
              ],
            ),
          );
        },
      ),
    );
  }
}
