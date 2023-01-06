import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICTransactionHistoryList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICActivityScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICHistoryScreen extends StatefulWidget {
  @override
  _ICHistoryScreenState createState() => _ICHistoryScreenState();
}

class _ICHistoryScreenState extends State<ICHistoryScreen> {
  String? dropdownValue = 'All';

  List dropdownItems = ['All'];

  List<ICTransactionHistoryList> list = getTransactionHistoryList();

  List<ICTransactionHistoryList> list2 = getTransactionHistoryList2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Transaction History', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search_outlined, color: ic_whiteColot, size: 20)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
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
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: ic_whiteColot,
                ),
                items: dropdownItems.map((e) {
                  return DropdownMenuItem(child: Text(e, style: secondaryTextStyle(color: ic_whiteColot)), value: e);
                }).toList(),
                underline: SizedBox(),
              ),
            ),
            16.height,
            Text('Yesterday', style: boldTextStyle(color: white)),
            8.height,
            Column(
                children: list.map((e) {
              return Container(
                decoration: boxDecorationDefault(color: ic_lightBlue),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
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
                            Text("${e.secStr}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text('${e.fig}', style: secondaryTextStyle(color: e.c)),
                      ],
                    )
                  ],
                ),
              ).onTap(() {
                ICActivityScreen().launch(context);
              }, highlightColor: ic_ScafoldBgColor);
            }).toList()),
            16.height,
            Text('Sep 24,2020', style: boldTextStyle(color: white)),
            16.height,
            Column(
                children: list2.map((e) {
              return Container(
                decoration: boxDecorationDefault(color: ic_lightBlue),
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.symmetric(vertical: 8),
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
                            Text("${e.secStr}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                          ],
                        ),
                      ],
                    ),
                    Text('${e.fig}', style: secondaryTextStyle(color: e.c))
                  ],
                ),
              ).onTap(() {
                ICActivityScreen().launch(context);
              }, highlightColor: ic_ScafoldBgColor);
            }).toList()),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 32),
      ),
    );
  }
}
