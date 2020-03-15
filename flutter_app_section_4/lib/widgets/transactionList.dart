import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: userTransactions.isEmpty
            ? Column(
                children: <Widget>[
                  Text(
                    "Pas de dépenses ajouté",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              )
            : ListView.builder(
                itemCount: userTransactions.length,
                itemBuilder: (ctx, key) {
                  return Card(
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          child: Text(
                            "${userTransactions[key].amount.toStringAsFixed(2)} €",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Theme.of(context).primaryColorDark),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userTransactions[key].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              DateFormat('dd MMMM yyyy HH:MM', 'fr_FR')
                                  .format(userTransactions[key].dateTime),
                              style: Theme.of(context).textTheme.title,
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ));
  }
}
