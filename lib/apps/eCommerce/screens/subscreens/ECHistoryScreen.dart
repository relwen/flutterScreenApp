import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECPopupModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECHistoryScreen extends StatefulWidget {
  @override
  _ECHistoryScreenState createState() => _ECHistoryScreenState();
}

class _ECHistoryScreenState extends State<ECHistoryScreen> {
  List<ECProductModel> cartListing = getCartDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: cartListing.length,
        padding: EdgeInsets.all(8),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          ECProductModel data = cartListing[index];
          return Container(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius(ecDefaultRadius2), boxShadow: defaultBoxShadow()),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(color: grey.withOpacity(0.4), borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                  width: 80,
                  height: 140,
                  child: commonCachedNetworkImage(data.img!),
                ),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    8.height,
                    Text(data.orderId!, style: boldTextStyle(size: 14)),
                    4.height,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${data.quantity} Product', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : darkSlateBlue, size: 12)),
                        8.width,
                        Container(height: 10, width: 1.5, color: appStore.isDarkModeOn ? white : black),
                        8.width,
                        Text('\$${data.price}', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : darkSlateBlue, size: 12)),
                      ],
                    ),
                    4.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(data.time!, style: secondaryTextStyle(size: 12)),
                        8.width,
                        Text(data.date!, style: secondaryTextStyle(size: 12)),
                      ],
                    ),
                    4.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.status!, style: boldTextStyle(color: ec_lightRed, size: 12)),
                        PopupMenuButton(
                          onSelected: ECChoiceAction,
                          child: Container(
                            height: 20,
                            width: 48,
                            alignment: Alignment.centerRight,
                            child: Icon(Icons.more_vert, size: 16),
                          ),
                          itemBuilder: (BuildContext context) {
                            return ECPopUpModel.choices.map(
                              (String choice) {
                                return PopupMenuItem(
                                  value: choice,
                                  child: Text(choice),
                                );
                              },
                            ).toList();
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      child: Text('Repurchase', style: TextStyle(color: white)),
                      onPressed: () {
                        ECProductDetailTabBarPage().launch(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ).onTap(() {
            ECProductDetailTabBarPage().launch(context);
          });
        },
      ),
    );
  }
}
