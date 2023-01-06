import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICDetailCardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICDetailCard extends StatefulWidget {
  @override
  _ICDetailCardState createState() => _ICDetailCardState();
}

class _ICDetailCardState extends State<ICDetailCard> {
  List<ICDetCardMenuList> detCardMenuList = getDetCardMenuList();

  List<DetailCardTranList> detailCardTranList = getDetailCardTranList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Detail Card', style: boldTextStyle(color: white)),
        actions: [
          IconButton(icon: Icon(Icons.search_outlined, color: ic_whiteColot, size: 20), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications_none, color: ic_whiteColot, size: 20), onPressed: () {}),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    top: 170,
                    left: 60,
                    child: Container(width: 200, height: 20, decoration: boxDecorationDefault(color: Colors.lightBlue)),
                  ),
                  Container(
                    decoration: boxDecorationDefault(color: Colors.lightBlueAccent),
                    height: 180,
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.call_to_action, color: ic_whiteColot, size: 30),
                                8.width,
                                Text('Venture capital card', style: boldTextStyle(color: ic_whiteColot)),
                              ],
                            ),
                            IconButton(icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 30), onPressed: () {})
                          ],
                        ),
                        Text('4916   9091   8053    9956', style: TextStyle(color: ic_whiteColot, fontSize: 15)),
                        16.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Card Holder', style: secondaryTextStyle(color: ic_secTextColor)),
                                8.height,
                                Text('Harinder Bharwal', style: boldTextStyle(color: ic_whiteColot)),
                              ],
                            ),
                            Image.asset('images/iiumiaCrypto/ic_visa.png', width: 80)
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            16.height,
            Wrap(
              runSpacing: 16,
              spacing: 16,
              children: detCardMenuList.map((e) {
                return Container(
                    height: 100,
                    width: context.width() * 0.27,
                    decoration: boxDecorationDefault(color: ic_navyBlueColor),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        IconButton(icon: e.i!, onPressed: () {}),
                        Text(
                          '${e.head}',
                          style: TextStyle(color: ic_whiteColot, fontSize: 10),
                        )
                      ],
                    ));
              }).toList(),
            ),
            16.height,
            Text('Transactions', style: boldTextStyle(color: white)),
            16.height,
            Column(
                children: detailCardTranList.map(
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
                          ClipRRect(child: Image.asset('${e.img}', height: 50, width: 50), borderRadius: radius()),
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
                      Text('${e.fig}  ', style: boldTextStyle(color: ic_whiteColot, size: 20))
                    ],
                  ),
                );
              },
            ).toList()),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
