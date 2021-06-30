import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahih_bukhari/services/database_service.dart';
import 'hadiths_page.dart';
import 'package:sahih_bukhari/widgets/card_item.dart';
import 'package:sahih_bukhari/widgets/back_page_button.dart';

class BooksPage extends StatelessWidget {
  final String title;
  final int volumeIndex;
  BooksPage({@required this.title, @required this.volumeIndex});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackPageButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 20,
        ),
        itemBuilder: (context, index) {
          return CardItem(
            title: mainData[volumeIndex].books[index].name,
            subTitle:
                '${mainData[volumeIndex].books[index].hadiths.length} Hadiths',
            subTitleIcon: Icons.bedtime_rounded,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HadithsPage(
                    title: mainData[volumeIndex].books[index].name,
                    volumeIndex: volumeIndex,
                    bookIndex: index,
                  ),
                ),
              );
            },
            leadingIcon: CupertinoIcons.book,
          );
        },
        itemCount: mainData[volumeIndex].books.length,
      ),
    );
  }
}
