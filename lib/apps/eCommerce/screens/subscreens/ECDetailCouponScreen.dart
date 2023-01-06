import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECDetailCouponScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
      bottomNavigationBar: AppButton(
        height: ecButtonHeight.toDouble(),
        width: context.width(),
        text: 'Use Code',
        textColor: ec_seaBlue,
        color: darkBlue,
        splashColor: white,
        onTap: () {},
      ).paddingAll(16),
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        title: Text('Detail Coupon', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: commonCachedNetworkImage(
                'https://1000logos.net/wp-content/uploads/2017/05/Zara-Logo-1975.jpg',
                height: 70,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            16.height,
            Text('50% off on sneakers - \nlimited scale', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue, size: 22)),
            16.height,
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(16),
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(16),
                spreadRadius: 0.2,
                blurRadius: 0.2,
                shadowColor: gray.withOpacity(0.4),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('84', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue), textAlign: TextAlign.center),
                      8.height,
                      Text('People Used Today', style: secondaryTextStyle()),
                    ],
                  ),
                  Container(height: 50, width: 0.5, color: gray),
                  Column(
                    children: [
                      Text('20', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                      8.height,
                      Text('Comments', style: secondaryTextStyle()),
                    ],
                  ),
                ],
              ),
            ),
            16.height,
            Text('From Nov 15 to Dec 14', style: primaryTextStyle()),
            8.height,
            Divider(height: 20, thickness: 0.7),
            8.height,
            Text('Display this offer to the staff and show them code', style: secondaryTextStyle()),
            8.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('YOUR COUPON CODE', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                Text('Copy Code', style: boldTextStyle(color: ec_seaBlue)),
              ],
            ),
            16.height,
            Text('BlackFriday30', style: boldTextStyle(color: ec_lightRed, size: 20)),
            16.height,
            Container(
              padding: EdgeInsets.all(ecDefaultPadding1),
              decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : Colors.grey[200], borderRadius: BorderRadius.circular(ecDefaultRadius1)),
              child: Text('Cannot be used in conjuction with other discounts or offers', style: primaryTextStyle(color: grey)),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
