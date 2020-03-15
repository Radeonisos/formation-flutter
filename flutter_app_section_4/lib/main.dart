import 'package:flutter/material.dart';
import 'package:flutter_app_section_4/widgets/newTransaction.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'models/transaction.dart';
import 'widgets/transactionList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('fr_FR', null);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dépenses",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [];

  void _addNewTransaction(String title, double amount) {
    final newTxt = Transaction(
        title: title,
        amount: amount,
        dateTime: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTxt);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dépenses"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => startAddNewTransaction(context),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text("CHART!!"),
              elevation: 5.0,
            ),
          ),
          TransactionList(_userTransactions)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddNewTransaction(context),
      ),
    );
  }
}
