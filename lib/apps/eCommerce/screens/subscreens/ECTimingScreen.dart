import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCodeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/ECTicketPassClipper.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECTimingScreen extends StatefulWidget {
  @override
  _ECTimingScreenState createState() => _ECTimingScreenState();
}

class _ECTimingScreenState extends State<ECTimingScreen> {
  List<ECCodeModel> codeList = getCodeData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: codeList.map(
            (data) {
              return Column(
                children: [
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.codeTitle!, style: boldTextStyle()).expand(),
                      Text('Applicable Maximum: ${data.codeCount}', style: secondaryTextStyle()).expand(),
                    ],
                  ),
                  16.height,
                  ClipPath(
                    clipper: ECTicketPassClipper(),
                    child: Container(
                      height: 150,
                      color: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(data.couponTitle!, style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue), maxLines: 2, overflow: TextOverflow.ellipsis),
                              8.height,
                              Text('${data.timesUsed} times left in use today', style: primaryTextStyle(color: grey)).expand(),
                              Text(data.couponId!, style: boldTextStyle()).expand(),
                            ],
                          ).expand(),
                          5.width,
                          Container(
                            decoration: BoxDecoration(color: lightBlue, borderRadius: radius(ecDefaultRadius1)),
                            padding: EdgeInsets.all(8),
                            child: Text(data.date!, style: boldTextStyle(), textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }
}
