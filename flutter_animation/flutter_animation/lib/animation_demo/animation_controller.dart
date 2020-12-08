import 'package:flutter/material.dart';
import 'package:flutter_animation/models/datas.dart';
import 'package:flutter_animation/models/material_design.dart';
import 'package:flutter_animation/models/transition_type.dart';

class AnimationControllerDemo extends StatefulWidget {
  final TransitionType type;

  AnimationControllerDemo(this.type);

  @override
  _AnimationControllerDemoState createState() =>
      _AnimationControllerDemoState();
}

class _AnimationControllerDemoState extends State<AnimationControllerDemo>
    with SingleTickerProviderStateMixin {
  Image _image = Image.asset(Datas().imgFlutter);

  AnimationController _animationController;
  Duration _duration = Duration(seconds: 1);
  DecorationTween _decorationTween;
  Animation<Decoration> _animationDecoration;
  CurvedAnimation _curvedAnimation;
  bool isAnim = false;
  double max;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _duration);
    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear);
    setupDecoration();
  }

  setupDecoration() {
    BoxDecoration begin = BoxDecoration(
        color: Colors.lightBlue, borderRadius: BorderRadius.circular(15));
    BoxDecoration end = BoxDecoration(
        color: Colors.orange, borderRadius: BorderRadius.circular(200));
    _decorationTween = DecorationTween(begin: begin, end: end);
    _animationDecoration = _decorationTween.animate(_curvedAnimation);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    max = size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          height: max,
          width: max,
          child: Center(
            child: transition(),
          ),
        ),
        FlatButton(
          child: Text('Faire la transition'),
          onPressed: performTransition,
        )
      ],
    );
  }

  Widget transition() {
    switch (widget.type) {
      case TransitionType.decoratedBox:
        return decoratedBox();
      case TransitionType.fade:
        return fade();
      case TransitionType.positioned:
        return positioned();
      case TransitionType.rotation:
        return rotation();
      case TransitionType.scale:
        return scale();
      case TransitionType.size:
        return sizeTra();
      case TransitionType.slide:
        return slide();
      default:
        return EmptyWidget();
    }
  }

  SizeTransition sizeTra() {
    return SizeTransition(
      child: _image,
      axis: Axis.horizontal,
      sizeFactor: Tween<double>(begin: 1, end: 0).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut)),
    );
  }

  SlideTransition slide() {
    return SlideTransition(
      child: _image,
      position: Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 0)).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut)),
    );
  }

  Widget positioned() {
    return Stack(
      children: <Widget>[
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, 0),
            end: RelativeRect.fromLTRB(max, max, max, max),
          ).animate(_curvedAnimation),
          child: Container(
            color: Colors.orange,
          ),
        ),
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromLTRB(0, 0, 0, 0),
            end: RelativeRect.fromLTRB(200, 250, 0, 0),
          ).animate(CurvedAnimation(
              parent: _animationController, curve: Curves.elasticOut)),
          child: _image,
        ),
      ],
    );
  }

  FadeTransition fade() {
    return FadeTransition(
      child: _image,
      opacity: Tween<double>(begin: 1, end: 0.33).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeOut)),
    );
  }

  DecoratedBoxTransition decoratedBox() {
    return DecoratedBoxTransition(
      decoration: _animationDecoration,
      child: _image,
    );
  }

  ScaleTransition scale() {
    Tween<double> tween = Tween<double>(begin: 0, end: 0.5);

    return ScaleTransition(
      child: _image,
      scale: tween.animate(_curvedAnimation),
    );
  }

  RotationTransition rotation() {
    Tween<double> tween = Tween<double>(begin: 0, end: 0.25);
    return RotationTransition(
      child: _image,
      turns: tween.animate(_curvedAnimation),
    );
  }

  performTransition() {
    if (isAnim) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    isAnim = !isAnim;
  }
}
