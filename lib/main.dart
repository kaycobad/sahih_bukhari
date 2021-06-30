import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:sahih_bukhari/models/bukhari.dart';
import 'services/database_service.dart';
import 'screens/books_page.dart';
import 'package:sahih_bukhari/widgets/card_item.dart';
import 'package:delayed_display/delayed_display.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sahih Al-Bukhari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/sahih_bukhari.json');
    final val = await json.decode(response);
    setState(() {
      mainData
          .addAll((val as List).map((data) => Bukhari.fromJson(data)).toList());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.chart_bar_alt_fill,
            color: Colors.pink,
          ),
          onPressed: () {},
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: CustomPaint(
              painter: ColorPatternsPainter(),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(
                    20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        CupertinoIcons.book_circle_fill,
                        size: 40,
                        color: Colors.white,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sahih',
                            style: TextStyle(
                              fontSize: 25,
                              letterSpacing: 3,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Al-Bukhari',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 3,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '9 VOLUMES . 93 CHAPTERS . 6000 HADITHS',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          mainData.isEmpty == true
              ? Container()
              : DelayedDisplay(
                  delay: Duration(
                    microseconds: 1,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    itemBuilder: (context, index) {
                      return CardItem(
                        title: mainData[index].name,
                        subTitle:
                            '${mainData[index].books.length.toString()} Chapters',
                        subTitleIcon: Icons.bedtime_rounded,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BooksPage(
                                title: mainData[index].name,
                                volumeIndex: index,
                              ),
                            ),
                          );
                        },
                        leadingIcon: CupertinoIcons.book_solid,
                      );
                    },
                    itemCount: mainData.length,
                  ),
                ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Color mainBGColor = Color(0xFF652A78);
Color redColor = Colors.red;
Color purpleColor = Colors.pink;
Color cyan = Color(0xFF99D5E5);
Color orange = Colors.pinkAccent;

class ColorPatternsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();

    Path mainBGPath = Path();
    mainBGPath.addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height));
    paint.color = mainBGColor;
    canvas.drawPath(mainBGPath, paint);

    Path purplePath = Path();
    purplePath.lineTo(size.width * .45, 0);
    purplePath.quadraticBezierTo(
        size.width * .25, size.height * .3, 0, size.height * 0.55);
    purplePath.close();
    paint.color = purpleColor;
    canvas.drawPath(purplePath, paint);

    Path redPath = Path();
    redPath.moveTo(size.width * 0.9, 0.0);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.1, 0, size.height * 0.85);
    redPath.lineTo(0, size.height);
    redPath.lineTo(size.width * 0.25, size.height);
    redPath.quadraticBezierTo(
        size.width * .5, size.height * 0.7, size.width, size.height * 0.6);
    redPath.lineTo(size.width, 0.0);
    redPath.close();
    paint.color = redColor;
    canvas.drawPath(redPath, paint);

    Path orangePath = Path();
    orangePath.moveTo(0, size.height * 0.75);
    orangePath.quadraticBezierTo(
        size.width * .25, size.height * 0.85, size.width * .40, size.height);
    orangePath.lineTo(0, size.height);
    orangePath.close();
    paint.color = orange;
    canvas.drawPath(orangePath, paint);

    Path trianglePath = Path();
    trianglePath.lineTo(size.width * .25, 0);
    trianglePath.lineTo(0, size.height * .25);
    trianglePath.close();
    paint.color = cyan;
    //canvas.drawPath(trianglePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
