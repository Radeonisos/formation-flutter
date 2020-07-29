import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_section_4/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    @required this.userTransaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction userTransaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  void initState() {
    super.initState();
    const availbleColors = [Colors.red, Colors.blue, Colors.green];
    _bgColor = availbleColors[Random().nextInt(3)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                "${widget.userTransaction.amount.toStringAsFixed(2)} €",
              ),
            ),
          ),
        ),
        title: Text(
          widget.userTransaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(DateFormat('dd MMMM yyyy', 'fr_FR')
            .format(widget.userTransaction.dateTime)),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                textColor: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.userTransaction.id),
                icon: Icon(Icons.delete),
                label: Text('Supprimer'))
            : IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.userTransaction.id),
              ),
      ),
    );
  }
}
