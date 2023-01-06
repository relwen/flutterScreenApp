import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCardModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECNotificationModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCoinHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECFlashScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECMembershipLevelScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECProfileScreen extends StatefulWidget {
  @override
  ECProfileScreenState createState() => ECProfileScreenState();
}

class ECProfileScreenState extends State<ECProfileScreen> {
  List<ECCardModel> list1 = getSettingList1();
  List<ECCardModel> list2 = getSettingList2();
  List<ECNotificationModel> coinGoldDataList = getCoinGoldData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 135,
                  padding: EdgeInsets.all(16),
                  color: darkSlateBlue,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCachedNetworkImage(ec_girlface,
                              fit: BoxFit.cover, height: 50, width: 50)
                          .cornerRadiusWithClipRRect(25),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Floyd Miles',
                              style: boldTextStyle(color: white)),
                          8.height,
                          Text('4127k Followers',
                              style: secondaryTextStyle(color: white)),
                          Text('Personal Info',
                                  style: boldTextStyle(color: ec_seaBlue))
                              .onTap(() {
                            ECFlashScreen().launch(context);
                          }),
                          8.height,
                        ],
                      ).expand(),
                      ElevatedButton(
                        child: Text('Seller Account'),
                        onPressed: () {
                          ECMembershipLevelScreen().launch(context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: ec_seaBlue, onPrimary: darkSlateBlue),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16),
                  width: context.width(),
                  margin: EdgeInsets.only(top: 100, right: 16, left: 16),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor:
                        appStore.isDarkModeOn ? cardDarkColor : white,
                    boxShadow: defaultBoxShadow(),
                  ),
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: coinGoldDataList.map((data) {
                      return Container(
                        width: context.width() * 0.44 - 19,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[100],
                                  borderRadius: radius(ecDefaultRadius1)),
                              height: 45,
                              width: 45,
                              child: data.icon,
                            ),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.notificationTitle!,
                                    style: boldTextStyle(
                                        color: appStore.isDarkModeOn
                                            ? white
                                            : darkBlue)),
                                4.height,
                                Text(data.notificationSubTitle!,
                                    style: secondaryTextStyle(size: 12)),
                              ],
                            ).expand(),
                          ],
                        ),
                      ).onTap(() {
                        ECCoinHistoryScreen().launch(context);
                      });
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
              padding: EdgeInsets.all(ecDefaultPadding1),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? cardDarkColor : white,
                borderRadius: BorderRadius.circular(ecDefaultRadius1),
                boxShadow: defaultBoxShadow(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list1.map(
                  (e) {
                    return SettingItemWidget(
                      padding: EdgeInsets.all(ecDefaultPadding1),
                      leading: Icon(e.icon,
                          color: appStore.isDarkModeOn ? white : black),
                      title: e.name!,
                      onTap: () {
                        e.widget.launch(context);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
              padding: EdgeInsets.all(ecDefaultPadding1),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? cardDarkColor : white,
                borderRadius: BorderRadius.circular(ecDefaultRadius1),
                boxShadow: defaultBoxShadow(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: list2.map(
                  (e) {
                    return SettingItemWidget(
                      decoration: BoxDecoration(borderRadius: radius()),
                      title: e.name!,
                      titleTextStyle: boldTextStyle(),
                      trailing: Icon(e.icon, color: Colors.grey),
                      onTap: () {
                        e.widget.launch(context);
                      },
                      padding: EdgeInsets.all(ecDefaultPadding1),
                    );
                  },
                ).toList(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              height: 50,
              width: context.width(),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: darkBlue),
                  primary: appStore.isDarkModeOn ? cardDarkColor : white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                ),
                onPressed: () {
                  finish(context);
                },
                child: Text('Log Out',
                    style: boldTextStyle(
                        color: appStore.isDarkModeOn
                            ? white
                            : darkBlue.withOpacity(0.5))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
