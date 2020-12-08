import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_demo/animated_cross_fade_demo.dart';
import 'package:flutter_animation/animation_demo/animated_opacity.dart';
import 'package:flutter_animation/animation_demo/animated_physical.dart';
import 'package:flutter_animation/animation_demo/animated_position.dart';
import 'package:flutter_animation/animation_demo/animated_size.dart';
import 'package:flutter_animation/animation_demo/animated_text.dart';
import 'package:flutter_animation/animation_demo/fade_in.dart';
import 'package:flutter_animation/models/material_design.dart';
import 'package:flutter_animation/models/section.dart';
import 'package:flutter_animation/widgets/tile.dart';

class OtherAnimatedList extends StatelessWidget {
  List<Section> _sections = [
    Section(
      name: "Fade In",
      icon: Icons.menu,
      destination: FadeIn(),
    ),
    Section(
      name: "Opacité",
      icon: Icons.menu,
      destination: AnimatedOpacityDemo(),
    ),
    Section(
        name: "Cross Fade",
        icon: Icons.menu,
        destination: AnimatedCrossFadeDemo()),
    Section(
        name: "TextStyle",
        icon: Icons.menu,
        destination: AnimatedTextStyleDemo()),
    Section(
      name: "Taille",
      icon: Icons.menu,
      destination: AnimatedSizeDemo(),
    ),
    Section(
      name: "Positionement",
      icon: Icons.menu,
      destination: AnimatedPositionDemo(),
    ),
    Section(
      name: "Physical Model",
      icon: Icons.menu,
      destination: AnimatedPhysicalModelDemo(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((ctx, i) => TilePerso(_sections[i])),
        separatorBuilder: ((ctx, i) => MyDivider()),
        itemCount: _sections.length);
  }
}
