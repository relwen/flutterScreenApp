import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECNotificationModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/material.dart';

class ECNotificationsScreen extends StatefulWidget {
  @override
  ECNotificationsScreenState createState() => ECNotificationsScreenState();
}

class ECNotificationsScreenState extends State<ECNotificationsScreen> {
  final List<ECNotificationModel> notificationList = getNotificationData();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Notifications', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : scaffoldDarkColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your Activity', style: boldTextStyle()).paddingOnly(left: 16, top: 16),
            ListView.builder(
              itemCount: notificationList.length,
              padding: EdgeInsets.all(ecDefaultPadding1),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                ECNotificationModel data = notificationList[index];
                return Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ecDefaultRadius1),
                    color: appStore.isDarkModeOn ? cardDarkColor : white,
                    boxShadow: defaultBoxShadow(),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(ecDefaultRadius1), color: appStore.isDarkModeOn ? scaffoldDarkColor : gray.withOpacity(0.2)),
                        width: 40,
                        height: 40,
                        child: data.icon!,
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.notificationTitle!, style: boldTextStyle()),
                          8.height,
                          Text(data.notificationSubTitle!, style: primaryTextStyle(size: 14)),
                          8.height,
                          Text(data.notificationDate!, style: secondaryTextStyle(size: 12)),
                        ],
                      ).expand(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
