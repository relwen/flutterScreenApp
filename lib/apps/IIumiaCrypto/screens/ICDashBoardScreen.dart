import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICDashBoardList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ICDashboardScreen extends StatefulWidget {
  @override
  _ICDashboardScreenState createState() => _ICDashboardScreenState();
}

class _ICDashboardScreenState extends State<ICDashboardScreen> {
  List<ICDashBoardList> dashBoardList = getDashBoradList();
  String? dropdownValue = 'Today';
  List dropdownItems = ['Today', 'Yesterday'];
  List yAxis = ['40K', '30K', '20K', '10K', '1K'];
  List axis = ['10', '11', '12', '13', '14'];

  @override
  void initState() {
    super.initState();
    setStatusBarColor(ic_ScafoldBgColor, statusBarIconBrightness: Brightness.light);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      appBar: AppBar(
        elevation: 0,
        leading: Image.asset('images/iiumiaCrypto/ic_logo.jpg', height: 30).paddingOnly(left: 16),
        backgroundColor: ic_ScafoldBgColor,
        title: Text('Dashboard', style: boldTextStyle(color: white)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: dashBoardList.map(
                (e) {
                  return Container(
                    width: context.width() * 0.43,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: ic_lightBlue, borderRadius: radius()),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8),
                          child: e.i,
                          decoration: BoxDecoration(color: ic_darkBLue, borderRadius: BorderRadius.all(Radius.circular(4))),
                        ),
                        8.width,
                        Text("${e.head}", style: primaryTextStyle(color: ic_whiteColot, weight: FontWeight.bold))
                      ],
                    ),
                  ).onTap(() {
                    e.screen.launch(context);
                  }, highlightColor: ic_lightBlue);
                },
              ).toList(),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 8),
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: radius(8),
                    color: ic_navyBlueColor,
                  ),
                  child: DropdownButton(
                    elevation: 2,
                    value: dropdownValue,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    dropdownColor: ic_ScafoldBgColor,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: ic_whiteColot,
                    ),
                    items: dropdownItems.map((e) {
                      return DropdownMenuItem(
                        child: Text(
                          e,
                          style: TextStyle(color: ic_whiteColot, fontSize: 10),
                        ),
                        value: e,
                      );
                    }).toList(),
                    hint: Text("Today", style: TextStyle(color: ic_whiteColot)),
                    underline: SizedBox(),
                  ),
                ),
                Row(
                  children: [
                    statusWidget(color: ic_skip, statusName: "Received"),
                    16.width,
                    statusWidget(color: Colors.red, statusName: "Sent"),
                  ],
                )
              ],
            ),
            16.height,
            Row(
              children: [
                Container(
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: yAxis.map(
                        (e) {
                          return Text(
                            '$e',
                            style: secondaryTextStyle(size: 10),
                          );
                        },
                      ).toList()),
                ),
                8.width,
                Container(
                  height: 150,
                  child: Sparkline(
                    data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
                    lineWidth: 4,
                    useCubicSmoothing: true,
                    cubicSmoothingFactor: 0.2,
                    backgroundColor: ic_ScafoldBgColor,
                  ),
                )
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: axis.map((e) {
                return Text('$e', style: secondaryTextStyle(color: ic_whiteColot, size: 10));
              }).toList(),
            )
          ],
        ).paddingAll(16),
      ),
    );
  }
}
