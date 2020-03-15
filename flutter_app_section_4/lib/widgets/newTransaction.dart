import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTxt;
  NewTransaction(this.newTxt);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitTxt() {
    final titleEntered = titleController.text;
    final amountEntered = double.parse(amountController.text);

    if (titleEntered.isEmpty || amountEntered <= 0) {
      return;
    }
    widget.newTxt(titleEntered, amountEntered);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Titre"),
              controller: titleController,
              onSubmitted: (_) => submitTxt(),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Prix"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitTxt(),
            ),
            FlatButton(
                child: Text('Ajouter dépense'),
                textColor: Colors.green,
                onPressed: submitTxt)
          ],
        ),
      ),
    );
  }
}
