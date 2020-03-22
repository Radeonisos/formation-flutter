import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTx;

  TransactionList(this.userTransactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 493,
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
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              "${userTransactions[key].amount.toStringAsFixed(2)} €",
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        userTransactions[key].title,
                        style: Theme.of(context).textTheme.title,
                      ),
                      subtitle: Text(DateFormat('dd MMMM yyyy', 'fr_FR')
                          .format(userTransactions[key].dateTime)),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        onPressed: () => deleteTx(userTransactions[key].id),
                      ),
                    ),
                  );
                },
              ));
  }
}
/*
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
 */
