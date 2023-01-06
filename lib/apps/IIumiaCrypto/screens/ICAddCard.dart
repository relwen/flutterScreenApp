import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICAddCardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICAddCard extends StatefulWidget {
  @override
  _ICAddCardState createState() => _ICAddCardState();
}

class _ICAddCardState extends State<ICAddCard> {
  List<ICAddCardList> addCardList = getAddCardList();
  List a = ['', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Add Card', style: boldTextStyle(color: white)),
        actions: [
          IconButton(icon: Icon(Icons.notifications_none, color: ic_whiteColot, size: 20), onPressed: () {}),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            32.height,
            Column(
              children: [
                Text('Current Balance', style: secondaryTextStyle(color: ic_secTextColor)),
                8.height,
                Text('\$7,136.00', style: boldTextStyle(color: ic_whiteColot, size: 32)),
              ],
            ).center(),
            32.height,
            Text('List Cards', style: boldTextStyle(color: white)),
            8.height,
            Container(
              decoration: boxDecorationDefault(color: ic_lightBlue),
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    child: Icon(Icons.add, color: ic_whiteColot, size: 20),
                    decoration: boxDecorationDefault(color: ic_navyBlueColor),
                  ),
                  16.width,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Add New Card', style: boldTextStyle(color: white)),
                      4.height,
                      Text('Add card payment', style: secondaryTextStyle(color: ic_secTextColor)),
                    ],
                  )
                ],
              ),
            ),
            Column(
                children: addCardList.map(
              (e) {
                return Container(
                  decoration: boxDecorationDefault(color: ic_lightBlue),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      e.img!,
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${e.pText}", style: boldTextStyle(color: white)),
                          4.height,
                          Row(
                            children: [
                              Row(
                                children: a.map((e) {
                                  return Container(
                                    margin: EdgeInsets.all(2),
                                    height: 4,
                                    width: 4,
                                    decoration: BoxDecoration(color: ic_whiteColot, borderRadius: BorderRadius.circular(8)),
                                  );
                                }).toList(),
                              ),
                              4.width,
                              Row(
                                children: a.map(
                                  (e) {
                                    return Container(
                                      margin: EdgeInsets.all(2),
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(color: ic_whiteColot, borderRadius: BorderRadius.circular(8)),
                                    );
                                  },
                                ).toList(),
                              ),
                              4.width,
                              Text("${e.secText}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                            ],
                          )
                        ],
                      ),
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
