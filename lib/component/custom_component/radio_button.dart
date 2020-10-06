import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  List<String> buttonTitles;
  RadioButton();

  @override
  Widget build(BuildContext context) {
    var commentWidgets = List<Widget>();
    for (var title in buttonTitles) {
      commentWidgets
          .add(Text(title)); // TODO: Whatever layout you need for each widget.
    }
    // TODO: implement build
    return Container(
      child: new Expanded(
        child: new ListView(
          shrinkWrap: true,
          children: <Widget>[
            // Comments List will go here
            Row(
              children: commentWidgets,
            ),
          ],
        ),
      ),
    );
  }
}
