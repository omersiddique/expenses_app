import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [ 
    Transaction( id: 't1', title: 'New Shoes', amount: 70.00, date: DateTime.now(), ),
    Transaction( id: 't2', title: 'New Bag', amount: 50.00, date: DateTime.now(), ),
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Card( // Chart
            child: Container(
              child: Text('CHART!'),
              width: double.infinity,
              ),
            elevation: 5,
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal:30),
                      decoration: BoxDecoration(border: Border.all(color: Colors.purple, width: 2),),
                      padding: EdgeInsets.all(10),
                      child: Text('\$${tx.amount}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.purple),),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(tx.title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                        Text(DateFormat().format(tx.date), style: TextStyle(color: Colors.grey)),
                      ],
                    )
                  ]
                ),
              );
            }).toList(),
          ),
        ]
      ),      
    );
  }
}
