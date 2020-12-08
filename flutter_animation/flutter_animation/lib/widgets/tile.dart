import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';
import 'package:flutter_animation/models/section.dart';

class TilePerso extends StatelessWidget {
  final Section section;

  TilePerso(this.section);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: Icon(section.icon),
      title: Text(section.name),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: (() => Datas().pusher(context, section.name, section.destination)),
    );
  }
}
