import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionPointer;

  NewTransaction(this.addTransactionPointer);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData(){
    if( titleController.text.isEmpty){
      return;
    }
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null){
      return;
    }
    widget.addTransactionPointer(enteredTitle, enteredAmount, _selectedDate); // refers to NewTransaction Class
    Navigator.of(context).pop(); // Pop modal off screen once complete
  }

  void _presentDatePicker(){
    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2020), lastDate: DateTime.now(), ).then((pickedDate){
      if (pickedDate == null){
        return;
      }
      setState(() {
        _selectedDate = pickedDate;        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController, onSubmitted: (_) => _submitData, ),
            TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountController, keyboardType: TextInputType.numberWithOptions(decimal:true), onSubmitted: (_) => _submitData, ),
            Container(height: 70, child: Row(
              children: <Widget>[Expanded(                
                child: Text(_selectedDate == null ? 'No Date Chosen!' : 'Selected: ${DateFormat.yMMMEd().format(_selectedDate)}' )), 
              FlatButton(
                onPressed: _presentDatePicker, 
                child: Text('Select Date', style: TextStyle(fontWeight: FontWeight.bold)), 
                textColor: Theme.of(context).primaryColor, ) ])),
            RaisedButton(onPressed: _submitData, child: Text('Add Transaction'), textColor: Theme.of(context).textTheme.button.color, padding: EdgeInsets.all(5), highlightColor: Colors.lightBlue, color: Theme.of(context).primaryColor, )
          ]
        ),
      ),
    );
  }
}