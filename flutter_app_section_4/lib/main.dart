import 'package:flutter/material.dart';
import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'Chaussures', amount: 69.99, dateTime: DateTime.now()),
    Transaction(
        id: 't2', title: 'Uber eats', amount: 39.25, dateTime: DateTime.now()),
    Transaction(
        id: 't3', title: 'Course', amount: 24.27, dateTime: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Card(
            color: Colors.red,
            child: Text("LIST OF TX"),
          )
        ],
      ),
    );
  }
}
