import 'package:flutter/material.dart';

class SlotItem extends StatelessWidget {
  final String assetName;
  final int index;
  int currentIndex;
  SlotItem(this.assetName, {Key key, this.index, this.currentIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isFocus = this.index == this.currentIndex;
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          color: isFocus ?  Color(0xffe74c3c) : null,
        ),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Stack(
            children: <Widget>[
              Image.asset('assets/img/$assetName.png'),
              Visibility(
                child: Image.asset('assets/img/${assetName}_f.png'),
                visible: isFocus,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
