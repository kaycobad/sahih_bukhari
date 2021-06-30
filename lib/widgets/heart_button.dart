import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahih_bukhari/services/database_service.dart';

class HeartButton extends StatefulWidget {
  final String reference;
  const HeartButton({
    Key key,
    @required this.reference,
  }) : super(key: key);

  @override
  _HeartButtonState createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton>
    with SingleTickerProviderStateMixin {
  bool _opacity = true;
  bool iconChange = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (favoriteValues.contains(widget.reference)) {
      iconChange = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: AnimatedOpacity(
        opacity: _opacity ? 1 : 0,
        duration: Duration(
          milliseconds: 500,
        ),
        child: Icon(
          iconChange ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
          color: iconChange
              ? Colors.pink
              : Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
        ),
      ),
      onPressed: () {
        if (iconChange == false) {
          favoriteValues.add(widget.reference);
        } else {
          favoriteValues.remove(widget.reference);
        }
        setState(() {
          _opacity = !_opacity;
        });
        Future.delayed(Duration(milliseconds: 500), () {
          setState(() {
            _opacity = !_opacity;
            iconChange = !iconChange;
          });
        });
        print(favoriteValues);
      },
    );
  }
}
