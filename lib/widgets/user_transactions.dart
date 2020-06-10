import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
   
final List<Transaction> _userTransactions = [
    Transaction( id: 't1', title: 'New Shoes', amount: 70.00, date: DateTime.now(), ),
    Transaction( id: 't2', title: 'New Bag', amount: 50.00, date: DateTime.now(), ),
  ];

  void _addNewTransaction(String txTitle, String txAmount){

    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: double.parse(txAmount), date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ]
    );
  }
}