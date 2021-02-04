import 'package:course_app_hamburger/burger_page.dart';
import 'package:flutter/material.dart';

import 'categoies.dart';
import 'hamburgers_list.dart';
import 'header.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.teal, centerTitle: true),
        bottomAppBarColor: Colors.teal,
        primaryColor: Colors.teal,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Colors.orangeAccent),
      ),
      home: Hamburger(),
      routes: {BurgerPage.routeName: (_) => BurgerPage()},
    );
  }
}

class Hamburger extends StatefulWidget {
  @override
  _HamburgerState createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Deviver me'),
            pinned: true,
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {})
            ],
          ),
          Header(),
          Categories(),
          HamburgerList(row: 1),
          HamburgerList(row: 2),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        child: Container(
          child: BottomAppBar(
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    icon: Icon(
                      Icons.add_alert,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.turned_in,
                      color: Colors.white,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
