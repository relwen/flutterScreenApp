import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICActivityList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICRecentTransactions.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICActivityScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICHomeScreen extends StatefulWidget {
  @override
  _ICHomeScreenState createState() => _ICHomeScreenState();
}

class _ICHomeScreenState extends State<ICHomeScreen> {
  List<ICActivityList> activityList = getActivityList();
  List<ICRecentTransactions> recentTxnList = getRecentTransactionsList();

  @override
  void initState() {
    super.initState();
    setStatusBarColor(ic_navyBlueColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                    color: ic_navyBlueColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('images/iiumiaCrypto/ic_logo.jpg', height: 50),
                            8.width,
                            Text("Home", style: boldTextStyle(size: 20, color: white)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(icon: Icon(Icons.music_note_outlined, color: ic_whiteColot, size: 20), onPressed: () {}),
                            IconButton(icon: Icon(Icons.notifications_none, color: ic_whiteColot, size: 20), onPressed: () {})
                          ],
                        )
                      ],
                    ),
                    16.height,
                    Text('Good Morning', style: secondaryTextStyle(color: ic_whiteColot)),
                    Text('Richard', style: boldTextStyle(color: ic_whiteColot, size: 28)),
                    8.height,
                    Container(
                      width: context.width(),
                      decoration: boxDecorationDefault(color: ic_lightBlue),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Total Portfolio Value', style: secondaryTextStyle(color: ic_whiteColot)),
                          8.height,
                          Text(' \$ 4,409.98', style: TextStyle(color: ic_whiteColot, fontSize: 32)),
                          8.height,
                          RichText(
                            text: TextSpan(
                              text: '+\$324.87',
                              style: secondaryTextStyle(color: ic_skip),
                              children: <TextSpan>[
                                TextSpan(text: ' last month', style: secondaryTextStyle(color: ic_whiteColot)),
                              ],
                            ),
                          )
                        ],
                      ).paddingAll(16),
                    ).center()
                  ],
                ).paddingAll(16),
              ],
            ),
            8.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Activity', style: boldTextStyle(color: white)).paddingOnly(left: 16),
                16.height,
                HorizontalList(
                  itemCount: activityList.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (_, index) {
                    ICActivityList e = activityList[index];
                    return Container(
                      width: 150,
                      decoration: boxDecorationDefault(color: ic_lightBlue),
                      margin: EdgeInsets.only(right: 8),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('${e.i}', height: 30),
                                  4.width,
                                  Text('${e.head}', style: secondaryTextStyle(color: ic_whiteColot)),
                                ],
                              ),
                              8.height,
                              RichText(
                                text: TextSpan(
                                  text: '${e.pFig}',
                                  style: TextStyle(color: ic_whiteColot, fontWeight: FontWeight.bold, fontSize: 26),
                                  children: <TextSpan>[TextSpan(text: '${e.subStr}', style: secondaryTextStyle())],
                                ),
                              ),
                              4.height,
                              Text('${e.secFig}', style: secondaryTextStyle(color: e.secColor)),
                              4.height
                            ],
                          ).paddingOnly(left: 8, right: 8, top: 8),
                          8.height,
                          Container(
                            height: 100,
                            padding: EdgeInsets.only(bottom: 8),
                            child: Sparkline(
                              data: e.data!,
                              lineColor: e.lineColor!,
                              lineWidth: 2,
                              useCubicSmoothing: true,
                              cubicSmoothingFactor: 0.2,
                              fillMode: FillMode.below,
                              fillGradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: e.colors!.cast(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ).onTap(() {
                      ICActivityScreen().launch(context);
                    }, highlightColor: ic_ScafoldBgColor);
                  },
                ),
                16.height,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recent Transaction', style: boldTextStyle(color: white)),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          var e = recentTxnList[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: e.i,
                                    decoration: BoxDecoration(color: ic_darkBLue, borderRadius: BorderRadius.all(Radius.circular(4))),
                                  ),
                                  8.width,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${e.ptext}",
                                        style: boldTextStyle(color: white),
                                      ),
                                      4.height,
                                      Text(
                                        "${e.subtext}",
                                        style: secondaryTextStyle(color: ic_secTextColor, size: 10),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text("${e.fig}", style: primaryTextStyle(color: ic_whiteColot)),
                            ],
                          ).paddingAll(8).onTap(() {
                            ICActivityScreen().launch(context);
                          });
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2),
                        itemCount: recentTxnList.length)
                  ],
                ).paddingOnly(left: 16, right: 16, bottom: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
