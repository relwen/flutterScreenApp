import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCodeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCartTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/material.dart';

class ECCoinHistoryScreen extends StatefulWidget {
  @override
  ECCoinHistoryScreenState createState() => ECCoinHistoryScreenState();
}

class ECCoinHistoryScreenState extends State<ECCoinHistoryScreen> {
  final List<ECCodeModel> historyList = getHistoryData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('History My Coin', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(
            onPressed: () {
              ECCartTabBarPage().launch(context);
            },
            icon: Icon(Icons.shopping_cart, size: ecIconSize.toDouble()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: historyList.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            ECCodeModel data = historyList[i];
            return Container(
              padding: EdgeInsets.all(ecDefaultPadding1),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? cardDarkColor : white,
                borderRadius: BorderRadius.circular(ecDefaultRadius1),
                boxShadow: defaultBoxShadow(),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.width,
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.codeTitle!, style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                        10.height,
                        Text(data.couponTitle!, style: boldTextStyle(color: grey, size: 12)),
                        5.height,
                        Text(data.availability!, style: primaryTextStyle(size: 14), overflow: TextOverflow.ellipsis, maxLines: 3),
                      ],
                    ),
                  ).expand(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
