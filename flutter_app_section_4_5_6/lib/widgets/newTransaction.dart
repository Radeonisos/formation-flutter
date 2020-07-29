import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function newTxt;
  NewTransaction(this.newTxt) {
    print('constructor NewTransaction widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  _NewTransactionState() {
    print('constructor NewTransaction State');
  }

  @override
  void initState() {
    print('initState NewTransaction');
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUpdateWidget NewTransaction');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose NewTransaction');
    super.dispose();
  }

  void _submitTxt() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final titleEntered = _titleController.text;
    final amountEntered = double.parse(_amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0 || _selectedDate == null) {
      return;
    }

    widget.newTxt(titleEntered, amountEntered, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((dateTime) {
      if (dateTime == null) {
        return;
      }
      setState(() {
        _selectedDate = dateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: "Titre"),
                controller: _titleController,
                onSubmitted: (_) => _submitTxt(),
              ),
              TextField(
                decoration: InputDecoration(labelText: "Prix"),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitTxt(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(_selectedDate == null
                          ? 'Pas de date choisi'
                          : "Date : ${DateFormat('dd MMMM yyyy', 'fr_FR').format(_selectedDate)}"),
                    ),
                    AdaptiveFlatButton(
                      "Choix Date",
                      _presentDatePicker,
                    )
                  ],
                ),
              ),
              RaisedButton(
                  child: Text('Ajouter dépense'),
                  textColor: Theme.of(context).textTheme.button.color,
                  color: Theme.of(context).primaryColor,
                  onPressed: _submitTxt)
            ],
          ),
        ),
      ),
    );
  }
}
