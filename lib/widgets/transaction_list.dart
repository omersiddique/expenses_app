import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty ? Column(children: <Widget>[Text('No transactions add yet!', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 20,),
        Container(height:200, child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))]) 
      : ListView.builder( // Expenses list
              itemBuilder: (ctx, index) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10, horizontal:30),
                        decoration: BoxDecoration(border: Border.all(color: Theme.of(context).primaryColorLight, width: 2),),
                        padding: EdgeInsets.all(10),
                        child: Text('\$${transactions[index].amount.toStringAsFixed(2)}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Theme.of(context).primaryColorDark),),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(transactions[index].title, style: Theme.of(context).textTheme.headline6),
                          Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Container(
                        child: Expanded(child: IconButton(icon: Icon(Icons.delete), color: Theme.of(context).errorColor, onPressed: () => deleteTransaction(transactions[index].id) ,)),
                      )
                    ]
                  ),
                ); 
              },
              itemCount: transactions.length,
            ),
    );
  }
}