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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = -1;
  AnimationController controller;
  Animation<int> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
  }

  void _startSlotsGame() {
    print('start');
    int duration = Random().nextInt(3) + 5;
    int end = _currentIndex + 100 + Random().nextInt(60) - 30;
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
          _currentIndex = animation.value % 20;
        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          print(status);
          print(_currentIndex);
        }
      });
    controller.forward(from: 0.0);
  }

  Widget _createSlotItem(String assetsName, int index) => SlotItem(
        assetsName,
        index: index,
        currentIndex: _currentIndex,
      );

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _createSlotItem('image0', 0),
                _createSlotItem('image1', 1),
                _createSlotItem('image2', 2),
                _createSlotItem('image3', 3),
                _createSlotItem('image4', 4),
              ],
            ),
            Row(
              children: <Widget>[
                _createSlotItem('image7', 19),
                Spacer(),
                Spacer(),
                Spacer(),
                _createSlotItem('image5', 5),
              ],
            ),
            Row(
              children: <Widget>[
                _createSlotItem('image6', 18),
                Spacer(),
                Spacer(),
                Spacer(),
                _createSlotItem('image6', 6),
              ],
            ),
            Row(
              children: <Widget>[
                _createSlotItem('one_more', 17),
                Spacer(),
                Spacer(),
                Spacer(),
                _createSlotItem('one_more', 7),
              ],
            ),
            Row(
              children: <Widget>[
                _createSlotItem('image5', 16),
                Spacer(),
                Spacer(),
                Spacer(),
                _createSlotItem('image7', 8),
              ],
            ),
            Row(
              children: <Widget>[
                _createSlotItem('image4', 15),
                Spacer(),
                Spacer(),
                Spacer(),
                _createSlotItem('image8', 9),
              ],
            ),
            Row(
              children: <Widget>[
                _createSlotItem('image3', 14),
                _createSlotItem('image2', 13),
                _createSlotItem('image1', 12),
                _createSlotItem('image0', 11),
                _createSlotItem('image9', 10),
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
