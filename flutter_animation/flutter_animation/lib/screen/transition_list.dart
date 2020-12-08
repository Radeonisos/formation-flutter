import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_demo/animation_controller.dart';
import 'package:flutter_animation/models/material_design.dart';
import 'package:flutter_animation/models/section.dart';
import 'package:flutter_animation/models/transition_type.dart';
import 'package:flutter_animation/widgets/tile.dart';

class TransitionList extends StatelessWidget {
  List<Section> _sections = [
    Section(
      name: "DecoratedBox",
      icon: Icons.compare_arrows,
      destination: AnimationControllerDemo(TransitionType.decoratedBox),
    ),
    Section(
      name: "Fade",
      icon: Icons.menu,
      destination: AnimationControllerDemo(TransitionType.fade),
    ),
    Section(
        name: "Postionned",
        icon: Icons.menu,
        destination: AnimationControllerDemo(TransitionType.positioned)),
    Section(
        name: "Rotation",
        icon: Icons.menu,
        destination: AnimationControllerDemo(TransitionType.rotation)),
    Section(
      name: "Scale",
      icon: Icons.menu,
      destination: AnimationControllerDemo(TransitionType.scale),
    ),
    Section(
      name: "Size",
      icon: Icons.menu,
      destination: AnimationControllerDemo(TransitionType.size),
    ),
    Section(
      name: "Slide",
      icon: Icons.menu,
      destination: AnimationControllerDemo(TransitionType.slide),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, i) => TilePerso(_sections[i])),
        separatorBuilder: ((context, i) => MyDivider()),
        itemCount: _sections.length);
  }
}
