import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';

class MyDivider extends Divider {
  MyDivider() : super(color: Colors.blue, thickness: 1);
}

class MyScaffold extends Scaffold {
  final String title;
  final Widget dest;

  MyScaffold({this.title, this.dest})
      : super(
            appBar: AppBar(
              title: Text(title),
            ),
            body: dest);
}

class EmptyWidget extends Center {
  EmptyWidget() : super(child: Image.asset(Datas().imgFlutter));
}
