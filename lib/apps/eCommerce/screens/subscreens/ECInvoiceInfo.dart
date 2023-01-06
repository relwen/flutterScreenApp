import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/components/ECInvoiceBSComponent.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCountryScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECElectronicInvoiceScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECPostReviewScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECShippingInfoScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ECInvoiceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        Column(
          children: [
            Row(
              children: [
                appButtonWidget(
                  btnText: 'Contact',
                  color: appStore.isDarkModeOn ? cardDarkColor : Colors.grey[100],
                  icon: Icons.message,
                  onTap: () {
                    ECPostReviewScreen().launch(context);
                  },
                ).expand(),
                16.width,
                appButtonWidget(
                  btnText: 'Rating',
                  color: appStore.isDarkModeOn ? cardDarkColor : Colors.grey[100],
                  icon: Icons.star_border,
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                      context: context,
                      builder: (builder) {
                        return ECInvoiceBSComponent();
                      },
                    );
                  },
                ).expand(),
              ],
            ),
            16.height,
            AppButton(
              height: ecButtonHeight.toDouble(),
              width: context.width(),
              text: 'Download Invoice',
              textColor: ec_seaBlue,
              color: darkBlue,
              splashColor: white,
              onTap: () {
                ECElectronicInvoiceScreen().launch(context);
              },
            )
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 8),
      ],
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Invoice Information', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
      ),
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(16), backgroundColor: Colors.blue.withOpacity(0.9)),
              child: ListTile(
                leading: Icon(Icons.insert_drive_file, size: 25, color: white),
                title: Text('Completed Order', style: TextStyle(color: white)),
                subtitle: Text('Payment to the seller: June 1,2021\n8:00 PM', style: TextStyle(color: white)),
              ),
            ),
            10.height,
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              decoration: boxDecorationRoundedWithShadow(
                16,
                blurRadius: 0.6,
                spreadRadius: 0.3,
                shadowColor: gray.withOpacity(0.3),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: Icon(Icons.location_on, size: ecIconSize.toDouble()),
                    title: Text('Address', style: boldTextStyle(color: grey)),
                    subtitle: Text('Adom Shafi\n+4402556 669 669\nadomshafi007@gmail.com\n London, Tesco City\n 08890', style: secondaryTextStyle()),
                    trailing: Text('Edit', style: boldTextStyle(color: ec_seaBlue)).onTap(() {
                      ECCountryScreen().launch(context);
                    }),
                  ),
                  Divider(color: Colors.black, height: 20, thickness: 0.1, indent: 30, endIndent: 30),
                  ListTile(
                    leading: Icon(Icons.local_shipping, size: ecIconSize.toDouble()),
                    title: Text('Shipping Information', style: boldTextStyle(color: grey)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Completed Order', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue, size: 15)),
                        Text('8:00 PM June 1,2021', style: primaryTextStyle(color: grey, size: 15)),
                      ],
                    ),
                    trailing: Text('View', style: boldTextStyle(color: ec_seaBlue)).onTap(() {
                      ECShippingInfoScreen().launch(context);
                    }),
                  ),
                ],
              ),
            ),
            16.height,
            Container(
              padding: EdgeInsets.all(16),
              decoration: boxDecorationRoundedWithShadow(
                16,
                blurRadius: 0.6,
                spreadRadius: 0.3,
                shadowColor: gray.withOpacity(0.3),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Amount', style: boldTextStyle()),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Product', style: primaryTextStyle(color: grey)),
                      Text('\$270.00', style: boldTextStyle()),
                    ],
                  ),
                  10.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Shipping', style: primaryTextStyle(color: grey)),
                      Text('\$20.00', style: boldTextStyle()),
                    ],
                  ),
                  Divider(color: gray, height: 40, thickness: 0.2),
                  Align(alignment: Alignment.bottomRight, child: Text('\$290.00', style: boldTextStyle())),
                ],
              ),
            ),
            8.height,
          ],
        ).paddingAll(ecDefaultPadding1).paddingAll(ecDefaultPadding1),
      ),
    );
  }
}
