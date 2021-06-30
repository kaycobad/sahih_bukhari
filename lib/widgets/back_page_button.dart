import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BackPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        CupertinoIcons.arrow_left_circle,
        size: 25,
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : Colors.black,
      ),
    );
  }
}
