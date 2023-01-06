import 'package:mighty_ui_kit/apps/eCommerce/models/ECNotificationModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECStoreRecordScreen extends StatefulWidget {
  @override
  _ECStoreRecordScreenState createState() => _ECStoreRecordScreenState();
}

class _ECStoreRecordScreenState extends State<ECStoreRecordScreen> {
  List<ECNotificationModel> infoList = getInformationData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(16), boxShadow: defaultBoxShadow(), backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('0%', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue, size: 20)),
                    8.height,
                    Row(
                      children: [
                        Text('Cancellation Rate', style: secondaryTextStyle(size: 12)),
                        16.width,
                        Icon(AntDesign.exclamationcircleo, size: 15),
                      ],
                    ),
                  ],
                ),
                Container(width: 0.5, height: 40, color: Colors.grey),
                Column(
                  children: [
                    Text('0%', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue, size: 20)),
                    8.height,
                    Row(
                      children: [
                        Text('Return Rate', style: secondaryTextStyle(size: 12)),
                        16.width,
                        Icon(AntDesign.exclamationcircleo, size: 15),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          16.height,
          Container(
            decoration: boxDecorationWithShadow(
              borderRadius: BorderRadius.circular(16),
              boxShadow: defaultBoxShadow(),
              backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
            ),
            padding: EdgeInsets.all(8),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: infoList.length,
              padding: EdgeInsets.all(8),
              itemBuilder: (context, index) {
                ECNotificationModel data = infoList[index];

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    data.icon!,
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.notificationTitle!, style: boldTextStyle(color: grey)),
                        4.height,
                        Text(data.notificationSubTitle!, style: secondaryTextStyle(color: black), maxLines: 3, overflow: TextOverflow.ellipsis),
                      ],
                    ).expand(),
                  ],
                ).paddingSymmetric(vertical: 8);
              },
            ),
          ),
        ],
      ).paddingOnly(left: 16, right: 16, top: 16),
    );
  }
}
