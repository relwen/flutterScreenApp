import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICMyWalletList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICAddCard.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICDetailCard.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICWalletScreen extends StatefulWidget {
  @override
  _ICWalletScreenState createState() => _ICWalletScreenState();
}

class _ICWalletScreenState extends State<ICWalletScreen> {
  List a = ['', '', '', ''];

  List<SendList> list = getSendList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('My Wallet', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Available Balance', style: TextStyle(color: ic_whiteColot, fontSize: 15)),
                8.height,
                Text('\$26 421.03', style: boldTextStyle(color: ic_whiteColot, size: 26)),
                16.height,
                Text('My Cards', style: boldTextStyle(color: ic_whiteColot)),
              ],
            ).paddingOnly(left: 16),
            16.height,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: ic_navyBlueColor),
                    child: IconButton(
                      onPressed: () {
                        ICAddCard().launch(context);
                      },
                      iconSize: 20,
                      icon: Icon(Icons.add, color: ic_whiteColot),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: Colors.purpleAccent),
                    width: 180,
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.call_to_action, color: ic_whiteColot, size: 30),
                            Row(
                              children: [
                                Row(
                                  children: a.map((e) {
                                    return Container(
                                      margin: EdgeInsets.all(2),
                                      height: 6,
                                      width: 6,
                                      decoration: BoxDecoration(color: ic_whiteColot, borderRadius: BorderRadius.circular(8)),
                                    );
                                  }).toList(),
                                ),
                                4.width,
                                Text('1211', style: TextStyle(color: ic_whiteColot, fontSize: 15)),
                              ],
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Mastercard', style: boldTextStyle(color: ic_whiteColot, size: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Platinum', style: TextStyle(color: ic_whiteColot, fontSize: 10)),
                                Image.network(
                                  'https://1000logos.net/wp-content/uploads/2017/03/Mastercard-logo.png',
                                  width: 50,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ).paddingAll(16),
                  ).onTap(() {
                    ICDetailCard().launch(context);
                  }, highlightColor: ic_ScafoldBgColor),
                  Container(
                    margin: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: Colors.pinkAccent),
                    width: 180,
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: a.map((e) {
                                return Container(
                                  margin: EdgeInsets.all(2),
                                  height: 6,
                                  width: 6,
                                  decoration: BoxDecoration(color: ic_whiteColot, borderRadius: BorderRadius.circular(8)),
                                );
                              }).toList(),
                            ),
                            4.width,
                            Text('1211', style: TextStyle(color: ic_whiteColot, fontSize: 15)),
                          ],
                        ),
                        Image.asset('images/iiumiaCrypto/ic_visa.png', width: 80)
                      ],
                    ).paddingAll(16),
                  ).onTap(() {
                    ICDetailCard().launch(context);
                  }, highlightColor: ic_ScafoldBgColor),
                ],
              ),
            ),
            16.height,
            Text('Send to', style: boldTextStyle(color: ic_whiteColot)).paddingOnly(left: 16),
            SingleChildScrollView(
              padding: EdgeInsets.only(left: 16),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: ic_navyBlueColor),
                    child: IconButton(
                      onPressed: () {
                        ICAddCard().launch(context);
                      },
                      iconSize: 20,
                      icon: Icon(Icons.add, color: ic_whiteColot),
                    ),
                  ),
                  HorizontalList(
                    itemCount: list.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      var e = list[index];
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(16),
                        decoration: boxDecorationDefault(color: ic_lightBlue),
                        child: Column(
                          children: [
                            ClipRRect(child: Image.asset('${e.img}', height: 50, width: 50), borderRadius: radius()),
                            8.height,
                            Text('${e.name}', style: TextStyle(color: ic_whiteColot, fontSize: 10)),
                          ],
                        ),
                      ).onTap(() {
                        ICDetailCard().launch(context);
                      }, highlightColor: ic_ScafoldBgColor);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
