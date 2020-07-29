import 'package:flutter/material.dart';
import 'package:flutter_app_section_4/widgets/transactionItem.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  "Pas de dépenses ajouté",
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: userTransactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id),
                    userTransaction: tx,
                    deleteTx: deleteTx))
                .toList(),
          );
  }
}
