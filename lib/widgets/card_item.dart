import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
    @required this.title,
    @required this.subTitle,
    @required this.onTap,
    @required this.leadingIcon,
    @required this.subTitleIcon,
    this.isThreeLines = false,
    this.hadithText,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final Function onTap;
  final IconData leadingIcon;
  final IconData subTitleIcon;
  final bool isThreeLines;
  final String hadithText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.transparent,
      margin: new EdgeInsets.symmetric(vertical: 7.0),
      child: Container(
        decoration: BoxDecoration(
            //color: Color.fromRGBO(64, 75, 96, .9),
            ),
        child: ListTile(
          isThreeLine: isThreeLines,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            height: double.infinity,
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: new Border(
                right: new BorderSide(
                    width: 1.0,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white24
                        : Colors.black12),
              ),
            ),
            child: Icon(
              leadingIcon,
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

          subtitle: Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Icon(
                      subTitleIcon,
                      color: Colors.pink,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Text(
                        subTitle,
                        style: TextStyle(),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                isThreeLines == true
                    ? Container(
                        margin: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          hadithText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          trailing: Container(
            height: double.infinity,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 25,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
