import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECNotificationModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECFollowingScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:flutter/material.dart';

class ECMembershipLevelScreen extends StatefulWidget {
  @override
  ECMembershipLevelScreenState createState() => ECMembershipLevelScreenState();
}

class ECMembershipLevelScreenState extends State<ECMembershipLevelScreen> {
  final List<ECNotificationModel> monthMissionList = getMonthMissionData();

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
        title: Text('Membership Level', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(
            onPressed: () {
              ECFollowingScreen().launch(context);
            },
            icon: Icon(AntDesign.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(backgroundImage: NetworkImage(ec_girlface), radius: 60),
                    CircleAvatar(child: Icon(MaterialCommunityIcons.gift)),
                  ],
                ),
                8.height,
                Text('Floyd Miles', style: boldTextStyle()),
              ],
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? cardDarkColor : white,
                borderRadius: BorderRadius.circular(ecDefaultRadius1),
                boxShadow: defaultBoxShadow(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('You have 945,000 coins, you need to accumulate 55,000 more coins to advance to the next member level',
                              style: secondaryTextStyle(), maxLines: 3, overflow: TextOverflow.ellipsis)
                          .expand(),
                      Icon(Entypo.price_ribbon, color: ec_seaBlue, size: 30),
                    ],
                  ),
                  16.height,
                  Divider(color: Colors.black, height: 1, thickness: 0.1, indent: 30, endIndent: 30),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Next Level', style: primaryTextStyle(color: grey)),
                      8.width,
                      Text('Diamond members', style: boldTextStyle(color: darkSlateBlue)),
                    ],
                  ),
                ],
              ),
            ),
            16.height,
            Align(alignment: Alignment.topLeft, child: Text('This month\'s mission', style: boldTextStyle())),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: monthMissionList.map(
                (data) {
                  return Container(
                    height: 180,
                    width: context.width() * 0.50 - 26,
                    decoration: BoxDecoration(
                      color: appStore.isDarkModeOn ? cardDarkColor : white,
                      borderRadius: BorderRadius.circular(ecDefaultRadius1),
                      boxShadow: defaultBoxShadow(),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data.icon!,
                        16.height,
                        Text(data.notificationTitle!, style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                        8.height,
                        Text(data.notificationSubTitle!, style: secondaryTextStyle(color: lightBlue)),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
