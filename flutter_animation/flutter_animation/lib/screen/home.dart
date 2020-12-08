import 'package:flutter/material.dart';
import 'package:flutter_animation/animation_demo/animated_builder.dart';
import 'package:flutter_animation/animation_demo/animated_container.dart';
import 'package:flutter_animation/animation_demo/animation_list_demo.dart';
import 'package:flutter_animation/animation_demo/animation_listener.dart';
import 'package:flutter_animation/animation_demo/graph.dart';
import 'package:flutter_animation/animation_demo/tinder_animation.dart';
import 'package:flutter_animation/models/datas.dart';
import 'package:flutter_animation/models/material_design.dart';
import 'package:flutter_animation/models/section.dart';
import 'package:flutter_animation/screen/other_animated_ist.dart';
import 'package:flutter_animation/screen/transition_list.dart';
import 'package:flutter_animation/widgets/tile.dart';

import 'hero_list.dart';
import 'menu_page.dart';

class Home extends StatelessWidget {
  List<Section> _sections = [
    Section(
        name: "Animated Container",
        icon: Icons.score,
        destination: AnimatedContainerDemo()),
    Section(
        name: "Les autres animated",
        icon: Icons.local_movies,
        destination: OtherAnimatedList()),
    Section(name: "Hero", icon: Icons.flash_on, destination: HeroList()),
    Section(
        name: "Animated List",
        icon: Icons.list,
        destination: AnimationListDemo()),
    Section(
        name: "Transitions",
        icon: Icons.compare_arrows,
        destination: TransitionList()),
    Section(
        name: "Animated Builder",
        icon: Icons.build,
        destination: AnimatedBuilderDemo()),
    Section(name: "Graphique", icon: Icons.show_chart, destination: Graph()),
    Section(
        name: "Animation Listener",
        icon: Icons.hearing,
        destination: AnimationListenerDemo()),
    Section(name: "Menu animé", icon: Icons.menu, destination: MenuPage()),
    Section(
        name: "Animation Tinder",
        icon: Icons.photo_library,
        destination: TinderAnimationDemo())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.all(3),
          child: Image.asset(
            Datas().imgFlutter,
          ),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          margin: EdgeInsets.all(5),
        ),
        title: Text('Animation'),
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) {
            return TilePerso(_sections[index]);
          },
          separatorBuilder: ((ctx, index) => MyDivider()),
          itemCount: _sections.length),
    );
  }
}
