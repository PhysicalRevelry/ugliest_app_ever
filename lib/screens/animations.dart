import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Animations extends StatefulWidget {
  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations>
    with SingleTickerProviderStateMixin {
  ///animated Container Control Station
  //did some basic shit to force it to go back and forth
  double _width = 100;
  double _height = 100;
  Color _color = Colors.purple;

  void _updateState() {
    setState(() {
      _width == 200 ? _width = 100 : _width = 200;
      _height == 200 ? _height = 100 : _height = 200;
      _color == Colors.purple
          ? _color = Colors.orangeAccent
          : _color = Colors.purple;
    });
  }

  ///Tween Animation control station
  //Did a hack to make it button controllable, Tweens usually start right on load
  //Seems that you can only use one tween per widget?
  double endTweenValue = 1;
  // Tween<double> _scaleTween = Tween<double>(begin: 1, end: 1);
  ColorTween _colorTween = ColorTween(begin: Colors.green, end: Colors.green);

  void _updateTween() {
    setState(() {
      // _scaleTween = Tween<double>(begin: 1, end: 2);
      _colorTween = ColorTween(begin: Colors.green, end: Colors.pinkAccent);
    });
  }

  ///Custom Animation Control Station
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    // _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  ///Here is the widget tree you'll see on the app
  //The widgets are not in the same order as the control stations above, SORRY
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller.view,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * pi,
                    child: child,
                  );
                },
                child: GestureDetector(
                  onTap: () {
                    _controller.forward();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.red,
                    child: Center(
                      child: Text('Tap Me Builder'),
                    ),
                  ),
                ),
              ),
              TweenAnimationBuilder(
                tween: _colorTween,
                curve: Curves.linear,
                duration: Duration(seconds: 1),
                builder: (context, value, _) {
                  return GestureDetector(
                    onTap: () {
                      _updateTween();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: value,
                      child: Center(
                        child: Text('Tap Me Tween'),
                      ),
                    ),
                  );
                },
              ),
              AnimatedContainer(
                duration: Duration(seconds: 2),
                curve: Curves.bounceOut,
                width: _width,
                height: _height,
                color: _color,
                child: GestureDetector(
                  onTap: () {
                    _updateState();
                  },
                  child: Center(
                    child: Text('Tap Me'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
