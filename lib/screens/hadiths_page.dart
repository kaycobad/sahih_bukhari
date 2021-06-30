import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahih_bukhari/services/database_service.dart';
import 'package:sahih_bukhari/widgets/card_item.dart';
import 'single_hadith.dart';
import 'package:sahih_bukhari/widgets/back_page_button.dart';

class HadithsPage extends StatelessWidget {
  final String title;
  final int volumeIndex;
  final int bookIndex;
  HadithsPage(
      {@required this.title,
      @required this.volumeIndex,
      @required this.bookIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackPageButton(),
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 20,
        ),
        itemBuilder: (context, index) {
          String str =
              mainData[volumeIndex].books[bookIndex].hadiths[index].info;
          String last = str.split(", ").last;
          String first = last.split(":").first;
          return CardItem(
            isThreeLines: true,
            title: 'Hadith $first',
            subTitle: mainData[volumeIndex].books[bookIndex].hadiths[index].by,
            subTitleIcon: Icons.person,
            hadithText:
                mainData[volumeIndex].books[bookIndex].hadiths[index].text,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SingleHadith(
                    hadithText: mainData[volumeIndex]
                        .books[bookIndex]
                        .hadiths[index]
                        .text,
                    by: mainData[volumeIndex]
                        .books[bookIndex]
                        .hadiths[index]
                        .by,
                    info: mainData[volumeIndex]
                        .books[bookIndex]
                        .hadiths[index]
                        .info,
                    bukhariNo: mainData[volumeIndex]
                        .books[bookIndex]
                        .hadiths[index]
                        .bukhariNo,
                  ),
                ),
              );
            },
            leadingIcon: CupertinoIcons.moon_stars_fill,
          );
        },
        itemCount: mainData[volumeIndex].books[bookIndex].hadiths.length,
      ),
    );
  }
}
