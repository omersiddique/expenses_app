import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransactionPointer;

  NewTransaction(this.addTransactionPointer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController, ),
            TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountController, ),
            RaisedButton(onPressed: () => addTransactionPointer(titleController.text, amountController.text), child: Text('Add Transaction'), textColor: Colors.white, padding: EdgeInsets.all(5), highlightColor: Colors.lightBlue, color: Colors.blue, )
          ]
        ),
      ),
    );
  }
}