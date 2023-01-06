import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICRevenueList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICActivityScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class XAxis {
  String? head;

  XAxis({this.head});
}

class ICRevenueScreen extends StatefulWidget {
  @override
  _ICRevenueScreenState createState() => _ICRevenueScreenState();
}

class _ICRevenueScreenState extends State<ICRevenueScreen> {
  List<XAxis> axis = [];
  int selected = 1;

  List<ICRevenueList1> list = getRevenueList1();
  List<ICRevenueList2> list2 = getRevenueList2();

  @override
  void initState() {
    axis.add(XAxis(head: "Jan"));
    axis.add(XAxis(head: "Feb"));
    axis.add(XAxis(head: "Mar"));
    axis.add(XAxis(head: "Apr"));
    axis.add(XAxis(head: "May"));
    axis.add(XAxis(head: "Jun"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        backgroundColor: ic_ScafoldBgColor,
        title: Text('Revenue Flow', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 16,
              children: List.generate(
                axis.length,
                (index) {
                  XAxis data = axis[index];
                  bool isSelected = selected == index;
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationDefault(color: isSelected ? ic_skip : ic_lightBlue),
                    child: Text('${data.head}', style: secondaryTextStyle(color: ic_whiteColot, size: 10)),
                  ).onTap(() {
                    selected = index;
                    setState(() {});
                  }, highlightColor: ic_lightBlue);
                },
              ),
            ),
            16.height,
            Container(
              height: 150,
              width: 150,
              child: Text("\$ 1545.4", style: boldTextStyle(color: ic_whiteColot, size: 25)).center(),
              decoration: BoxDecoration(border: Border.all(width: 8, color: Colors.blue), color: ic_ScafoldBgColor, borderRadius: radius(100)),
            ).center(),
            16.height,
            Wrap(
              spacing: 4,
              runSpacing: 16,
              children: list.map((e) {
                return Container(
                  width: 150,
                  child: Row(
                    children: [
                      Container(
                        height: 8,
                        width: 8,
                        decoration: BoxDecoration(color: e.c, borderRadius: BorderRadius.circular(8)),
                      ),
                      4.width,
                      Text("${e.h1}", style: boldTextStyle(color: white)),
                      4.width,
                      Text("${e.h2}", style: secondaryTextStyle(color: e.c)).expand(),
                    ],
                  ),
                );
              }).toList(),
            ),
            16.height,
            Column(
              children: list2.map(
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
                            Image.asset('${e.i}', height: 30),
                            8.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Bitcoin", style: boldTextStyle(color: white)),
                                4.height,
                                Text("42%", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text('\$2,561  ', style: secondaryTextStyle(color: e.c)),
                            e.ic!,
                          ],
                        )
                      ],
                    ),
                  ).onTap(() {
                    ICActivityScreen().launch(context);
                  }, highlightColor: ic_ScafoldBgColor);
                },
              ).toList(),
            ).paddingAll(8)
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
