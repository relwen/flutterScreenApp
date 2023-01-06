import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICBalanceList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICBalanceScreen extends StatefulWidget {
  @override
  _ICBalanceScreenState createState() => _ICBalanceScreenState();
}

class _ICBalanceScreenState extends State<ICBalanceScreen> {
  String? dropdownValue = 'TimeFrames';

  List dropdownItems = ['TimeFrames'];

  List axis = ['jan', 'feb', 'mar', 'apr', 'may', 'jun'];

  List<ICBalanceList> list = getBalanceList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Balance Currency', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  child: Text("USD", style: secondaryTextStyle(color: ic_secTextColor), textAlign: TextAlign.start),
                ),
                8.width,
                Text('26 421.03', style: boldTextStyle(color: ic_whiteColot, size: 30)),
                Icon(Icons.arrow_drop_down, color: ic_skip)
              ],
            ),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.trending_down, color: Colors.red),
                8.width,
                Text("\$241 (13%) today", style: secondaryTextStyle(color: ic_secTextColor)),
              ],
            ),
            16.height,
            Container(
              decoration: boxDecorationDefault(color: ic_lightBlue),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ic_navyBlueColor),
                        child: DropdownButton(
                          elevation: 2,
                          value: dropdownValue,
                          onChanged: (dynamic newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          dropdownColor: ic_ScafoldBgColor,
                          icon: Icon(Icons.arrow_drop_down, color: ic_whiteColot),
                          items: dropdownItems.map((e) {
                            return DropdownMenuItem(child: Text(e, style: TextStyle(color: ic_whiteColot, fontSize: 10)), value: e);
                          }).toList(),
                          underline: SizedBox(),
                        ),
                      ),
                      16.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: axis.map((e) {
                          return Text('$e', style: secondaryTextStyle(color: ic_whiteColot, size: 10));
                        }).toList(),
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(borderRadius: radius(4), color: Colors.blue),
                    child: Text("+\$168(5%)", style: primaryTextStyle(color: ic_whiteColot)),
                  ),
                  8.height,
                  Container(
                    height: 150,
                    child: Sparkline(
                      data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
                      lineColor: ic_skip,
                      lineWidth: 6,
                      useCubicSmoothing: true,
                      pointsMode: PointsMode.last,
                      pointSize: 10,
                      pointColor: ic_whiteColot,
                      cubicSmoothingFactor: 0.2,
                      fillMode: FillMode.below,
                      fillGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue[700]!, Colors.transparent],
                      ),
                    ),
                  ),
                ],
              ).paddingOnly(top: 16),
            ),
            16.height,
            Text('Transaction History', style: boldTextStyle(color: white)),
            16.height,
            Column(
              children: list.map((e) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationDefault(color: ic_lightBlue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('${e.img}', height: 30),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${e.head}", style: boldTextStyle(color: white)),
                              4.height,
                              Text("${e.sec}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${e.fig}", style: boldTextStyle(color: white)),
                          8.width,
                          Icon(Icons.arrow_drop_down, color: ic_whiteColot),
                        ],
                      )
                    ],
                  ),
                ).onTap(() {
                  ICHistoryScreen().launch(context);
                }, highlightColor: ic_ScafoldBgColor);
              }).toList(),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
