import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICDetailCardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICWatchList1.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICActivityScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICWatchListScreen extends StatefulWidget {
  @override
  _ICWatchListScreenState createState() => _ICWatchListScreenState();
}

class _ICWatchListScreenState extends State<ICWatchListScreen> {
  bool t0 = true;
  bool t1 = false;
  bool t2 = false;
  bool t3 = false;
  int i = 1;

  List<ICWatchList1> list = getWatchList1();
  List<DetailCardTranList> levelList = getLevelList();

  @override
  void initState() {
    super.initState();
    setStatusBarColor(ic_ScafoldBgColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Watch list', style: boldTextStyle(color: white)),
        actions: [
          IconButton(icon: Icon(Icons.add, color: ic_whiteColot, size: 20), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20), onPressed: () {}),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalList(
              padding: EdgeInsets.only(left: 8),
              spacing: 0,
              itemCount: levelList.length,
              itemBuilder: (context, index) {
                DetailCardTranList data = levelList[index];

                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    backgroundColor: i == index ? ic_skip : ic_lightBlue,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  child: Text(data.pText!, style: boldTextStyle(color: white)),
                ).onTap(() {
                  setState(() {
                    i = index;
                  });
                }, highlightColor: ic_ScafoldBgColor);
              },
            ),
            Column(
              children: list.map(
                (e) {
                  return Container(
                    decoration: boxDecorationDefault(color: ic_lightBlue),
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              '${e.img}',
                              height: 30,
                            ),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${e.pText}", style: boldTextStyle(color: white)),
                                4.height,
                                Text("${e.secText}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [Text('${e.fig}  ', style: secondaryTextStyle(color: e.c)), e.i!],
                        )
                      ],
                    ),
                  ).onTap(() {
                    ICActivityScreen().launch(context);
                  }, highlightColor: ic_ScafoldBgColor);
                },
              ).toList(),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
