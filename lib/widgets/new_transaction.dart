import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionPointer;

  NewTransaction(this.addTransactionPointer);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }
    widget.addTransactionPointer(enteredTitle, enteredAmount); // refers to NewTransaction Class
    Navigator.of(context).pop(); // Pop modal off screen once complete
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController, onSubmitted: (_) => submitData, ),
            TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountController, keyboardType: TextInputType.numberWithOptions(decimal:true), onSubmitted: (_) => submitData, ),
            RaisedButton(onPressed: submitData, child: Text('Add Transaction'), textColor: Colors.white, padding: EdgeInsets.all(5), highlightColor: Colors.lightBlue, color: Colors.blue, )
          ]
        ),
      ),
    );
  }
}