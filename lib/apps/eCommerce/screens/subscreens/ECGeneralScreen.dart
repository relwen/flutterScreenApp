import 'package:mighty_ui_kit/apps/eCommerce/models/ECCategoryModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECGeneralScreen extends StatefulWidget {
  @override
  _ECGeneralScreenState createState() => _ECGeneralScreenState();
}

class _ECGeneralScreenState extends State<ECGeneralScreen> {
  List<ECCategoryModel> generalList = getGeneralDetails();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: generalList.length,
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(8),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            ECCategoryModel data = generalList[i];
            return Container(
              height: 200,
              margin: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(16), backgroundColor: data.backGroundColor!),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.cName!, style: boldTextStyle(color: darkBlue, size: 22)),
                      8.height,
                      Text('${data.count} products', style: primaryTextStyle()),
                      16.height,
                      Row(
                          children: data.images!.map(
                        (e) {
                          return Container(
                            width: 60,
                            height: 60,
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(8),
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: BorderRadius.circular(16),
                              backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
                            ),
                            child: commonCachedNetworkImage(e, fit: BoxFit.cover, width: 42, height: 42).cornerRadiusWithClipRRect(16),
                          );
                        },
                      ).toList())
                    ],
                  ).expand(),
                  8.width,
                  Align(alignment: Alignment.bottomCenter, child: commonCachedNetworkImage(data.img1, fit: BoxFit.cover, width: 80))
                ],
              ).paddingAll(16),
            );
          },
        ),
      ),
    );
  }
}
