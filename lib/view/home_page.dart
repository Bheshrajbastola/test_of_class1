import 'package:flutter/material.dart';
import 'package:test_of_class1/view/user_data.dart';

import '../model/user_detail.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _amountController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _payFees() {
    double amount = double.parse(_amountController.text);
    if (widget.user.balance < amount) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Insufficient balance.')),
      );
    } else {
      UserData.updateUserBalance(widget.user.email, amount);
      setState(() {
        widget.user.balance -= amount;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment successful.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fee Management'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Your balance is Rs ${widget.user.balance}',
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _amountController,
            decoration: const InputDecoration(
              labelText: 'Enter amount',
            ),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the amount you want to pay.';
              }
              double amount = double.tryParse(value) ?? 0;
              if (amount <= 0) {
                return 'Please enter a positive amount.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _payFees,
            child: const Text('Pay'),
          ),
        ],
      ),
    );
  }
}
