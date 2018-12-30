import 'dart:math';

import 'package:flutter/material.dart';
import './widgets/SlotItem.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  AnimationController controller;
  Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  void _startSlotsGame() {
    int duration = Random().nextInt(3) + 5;
    int end = _currentIndex + 50 + Random().nextInt(50) - 25;
    controller.duration = Duration(seconds: duration);
    animation = IntTween(
      begin: _currentIndex,
      end: end,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    ))
      ..addListener(() {
        print(animation.value);
        setState(() {
          _currentIndex = animation.value % 7;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          // controller.reverse();
          // controller.reset();
          controller.resync(this);
        }
      });
    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SlotItem(
                  'image0',
                  index: 0,
                  currentIndex: _currentIndex,
                ),
                SlotItem(
                  'image1',
                  index: 1,
                  currentIndex: _currentIndex,
                ),
                SlotItem(
                  'image2',
                  index: 2,
                  currentIndex: _currentIndex,
                ),
                SlotItem(
                  'image3',
                  index: 3,
                  currentIndex: _currentIndex,
                ),
                SlotItem(
                  'image4',
                  index: 4,
                  currentIndex: _currentIndex,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                SlotItem(
                  'image5',
                  index: 5,
                  currentIndex: _currentIndex,
                ),
                Spacer(),
                Spacer(),
                Spacer(),
                SlotItem(
                  'image6',
                  index: 6,
                  currentIndex: _currentIndex,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _startSlotsGame,
        tooltip: 'Increment',
        child: Icon(Icons.stars),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
