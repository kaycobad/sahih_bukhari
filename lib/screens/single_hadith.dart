import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahih_bukhari/widgets/back_page_button.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:sahih_bukhari/widgets/heart_button.dart';

class SingleHadith extends StatelessWidget {
  final String hadithText;
  final String by;
  final String info;
  final String bukhariNo;
  SingleHadith({
    @required this.hadithText,
    @required this.by,
    @required this.info,
    @required this.bukhariNo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackPageButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: CustomPaint(
        painter: BluePainter(),
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(by),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "“",
                            style: TextStyle(
                              fontSize: 50,
                              height: 1,
                              //color: Colors.pink,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            hadithText,
                            style: TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              // foreground: Paint()
                              //   ..shader = LinearGradient(
                              //     colors: <Color>[Colors.blue, Colors.blueAccent],
                              //   ).createShader(
                              //     Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                              //   ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "”",
                            style: TextStyle(
                              fontSize: 50,
                              height: 1,
                              //color: Colors.pink,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                      Text(
                        info,
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        bukhariNo.toUpperCase(),
                        style: TextStyle(
                          fontSize: 11,
                          //color: Colors.pink,
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Row(
                      //   children: [
                      //     Image.asset(
                      //       'assets/google-play-badge.png',
                      //       width: 150,
                      //     ),
                      //     Expanded(
                      //       child: Text(
                      //         'Sahih Al-Bukhari',
                      //         textAlign: TextAlign.right,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 10,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DelayedDisplay(
                    delay: Duration(
                      milliseconds: 1000,
                    ),
                    slidingBeginOffset: Offset(-.35, 0),
                    child: IconButton(
                      icon: Icon(CupertinoIcons.share),
                      onPressed: () {},
                    ),
                  ),
                  DelayedDisplay(
                    delay: Duration(
                      milliseconds: 1000,
                    ),
                    slidingBeginOffset: Offset(.35, 0),
                    child: HeartButton(
                      reference: info,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BluePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;
    Paint paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, width, height));
    paint.color = Colors.blue.shade700;
    //canvas.drawPath(mainBackground, paint);

    Path ovalPath = Path();
    // Start paint from 20% height to the left
    ovalPath.moveTo(0, height * 0.2);

    // paint a curve from current position to middle of the screen
    ovalPath.quadraticBezierTo(
        width * 0.45, height * 0.25, width * 0.51, height * 0.5);

    // Paint a curve from current position to bottom left of screen at width * 0.1
    ovalPath.quadraticBezierTo(width * 0.58, height * 0.8, width * 0.2, height);

    // draw remaining line to bottom left side
    ovalPath.lineTo(0, height);

    // Close line to reset it back
    ovalPath.close();

    paint.color = Colors.pink;
    canvas.drawPath(ovalPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
