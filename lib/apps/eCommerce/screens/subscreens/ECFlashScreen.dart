import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECTimeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'ECCoinHistoryScreen.dart';

class ECFlashScreen extends StatefulWidget {
  const ECFlashScreen({Key? key}) : super(key: key);

  @override
  _ECFlashScreenState createState() => _ECFlashScreenState();
}

class _ECFlashScreenState extends State<ECFlashScreen> {
  List<ECTimeModel> timeList = getTimeList();
  List<ECTimeModel> brandList = getBrandList();
  List<ECProductModel> dcList = getDCList();

  int selectTime = 0;

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
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
        title: Text('Flash Deal', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(
            onPressed: () {
              ECCoinHistoryScreen().launch(context);
            },
            icon: Icon(MaterialCommunityIcons.lightning_bolt),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 16, right: 16, left: 16),
              width: context.width() * 0.95,
              padding: EdgeInsets.all(ecDefaultPadding1),
              decoration: BoxDecoration(borderRadius: radius(ecDefaultRadius2), color: Colors.blue),
              child: ListTile(
                title: Text('FLASH SALE 12', style: boldTextStyle(color: white, size: 20)),
                subtitle: Text('Stay tuned and check your notifications everyday', style: primaryTextStyle(color: white, size: 10)),
                trailing: Container(
                  width: 90,
                  height: 40,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius(ecDefaultRadius1)),
                  child: Text('24 hours', style: boldTextStyle(), textAlign: TextAlign.center),
                ),
              ),
            ),
            5.height,
            HorizontalList(
              itemCount: timeList.length,
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              itemBuilder: (_, index) {
                ECTimeModel data = timeList[index];
                return Container(
                  width: 100,
                  height: 85,
                  margin: EdgeInsets.only(right: 8, top: 8),
                  decoration: BoxDecoration(
                      color: selectTime == index
                          ? paleVioletRed.withOpacity(0.4)
                          : appStore.isDarkModeOn
                              ? cardDarkColor
                              : white,
                      borderRadius: radius(ecDefaultRadius1),
                      boxShadow: defaultBoxShadow()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data.dealTime!,
                          style: boldTextStyle(
                              color: selectTime == index
                                  ? white
                                  : appStore.isDarkModeOn
                                      ? white
                                      : black)),
                      8.height,
                      Text(data.dealStatus!, style: secondaryTextStyle(color: selectTime == index ? white : gray)),
                    ],
                  ),
                ).onTap(() {
                  selectTime = index;
                  setState(() {});
                });
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(borderRadius: radius(ecDefaultRadius1), color: appStore.isDarkModeOn ? cardDarkColor : white, boxShadow: defaultBoxShadow()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Ionicons.funnel, color: grey),
                      8.width,
                      Text('Filter', style: boldTextStyle()),
                      8.width,
                      Text('All Products', style: primaryTextStyle(color: grey)),
                    ],
                  ),
                  Text('233 Results', style: primaryTextStyle(color: grey)),
                ],
              ),
            ),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: dcList.map(
                (data) {
                  return Container(
                    width: context.width() * 0.43,
                    padding: EdgeInsets.all(ecDefaultPadding1),
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius(ecDefaultRadius1), boxShadow: defaultBoxShadow()),
                    child: Column(
                      children: [
                        commonCacheImageWidget(data.img!, 70).cornerRadiusWithClipRRect(16),
                        8.height,
                        Text(data.name!, style: boldTextStyle(size: 14)),
                        8.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('\$${data.price.toString()}', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                            Text('-${data.discount.toString()}%', style: boldTextStyle(color: grey)),
                          ],
                        ),
                        8.height,
                        Text('${data.count.toString()}/5k product sold', style: secondaryTextStyle(color: Colors.grey[400])),
                      ],
                    ),
                  ).onTap(() {
                    ECProductDetailTabBarPage().launch(context);
                  });
                },
              ).toList(),
            ).paddingOnly(bottom: 16),
          ],
        ),
      ),
    );
  }
}
