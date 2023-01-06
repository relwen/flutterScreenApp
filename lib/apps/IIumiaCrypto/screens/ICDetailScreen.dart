import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICNewsList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICDetailScreen extends StatefulWidget {
  ICNewsList? data = ICNewsList();

  ICDetailScreen({this.data});

  @override
  _ICDetailScreenState createState() => _ICDetailScreenState();
}

class _ICDetailScreenState extends State<ICDetailScreen> {
  List<String> myList = ['Coin', 'Star', 'Italian'];
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Detail', style: boldTextStyle(color: white)),
        actions: [
          IconButton(
            icon: Icon(like ? Icons.bookmark_border_outlined : Icons.bookmark, color: ic_whiteColot, size: 20),
            onPressed: () {
              like = !like;
              setState(() {});
            },
          ),
          IconButton(icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20), onPressed: () {}),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(widget.data!.img!, fit: BoxFit.cover, width: context.width()),
            Column(
              children: [
                Text(widget.data!.pText!, style: boldTextStyle(color: ic_whiteColot, size: 18)),
                16.height,
                Row(
                  children: [
                    Icon(Icons.calendar_today_outlined, color: ic_whiteColot, size: 18),
                    8.width,
                    Text(widget.data!.secText!, style: secondaryTextStyle(color: ic_whiteColot, size: 15)),
                  ],
                ),
                16.height,
                Row(
                    children: myList.map((e) {
                  return Container(
                    margin: EdgeInsets.only(top: 8, right: 8, bottom: 8),
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: ic_navyBlueColor),
                    child: Text('$e', style: TextStyle(color: ic_whiteColot)),
                  );
                }).toList()),
                8.height,
                Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                    style: TextStyle(color: ic_whiteColot)),
                8.height,
                Text(
                    'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).',
                    style: TextStyle(color: ic_whiteColot))
              ],
            ).paddingAll(16)
          ],
        ),
      ),
    );
  }
}

//widget.data.pText
