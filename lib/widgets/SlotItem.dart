import 'package:flutter/material.dart';

class SlotItem extends StatelessWidget {
  final String assetName;
  final int index;
  int currentIndex;
  SlotItem(this.assetName, {Key key, this.index, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        flex: 1,
        child: Stack(
          children: <Widget>[
            Image.asset('assets/img/$assetName.png'),
            Visibility(
              child: Image.asset('assets/img/${assetName}_f.png'),
              visible: this.index == this.currentIndex,
            ),
          ],
        ),
      ),
    );
  }
}
