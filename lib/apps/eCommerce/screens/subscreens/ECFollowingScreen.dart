import 'package:mighty_ui_kit/apps/eCommerce/models/ECCardModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECPopupModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECFollowingScreen extends StatefulWidget {
  @override
  _ECFollowingScreenState createState() => _ECFollowingScreenState();
}

class _ECFollowingScreenState extends State<ECFollowingScreen> {
  List<ECProductModel> followList = getFollowDetails();
  List<ECCardModel> contactSocialList = getContactSocialList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Following', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: ecIconSize.toDouble())),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: BorderRadius.circular(ecDefaultRadius1), boxShadow: defaultBoxShadow()),
              child: ListView.builder(
                itemCount: contactSocialList.length,
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemBuilder: (context, index) {
                  ECCardModel data = contactSocialList[index];

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.name!, style: boldTextStyle()),
                      Icon(data.icon, color: grey),
                    ],
                  ).paddingAll(8);
                },
              ),
            ),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: followList.map(
                (data) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 16),
                    width: context.width() * 0.5 - 25,
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius(ecDefaultRadius1), boxShadow: defaultBoxShadow()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: PopupMenuButton(
                            onSelected: ECChoiceAction,
                            icon: Icon(Icons.more_vert),
                            itemBuilder: (BuildContext context) {
                              return ECPopUpModel.choices.map(
                                (String choice) {
                                  return PopupMenuItem(value: choice, child: Text(choice));
                                },
                              ).toList();
                            },
                          ),
                        ),
                        commonCachedNetworkImage(data.img!, width: 100, height: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                        8.height,
                        Text(data.name!, style: boldTextStyle(size: 14), textAlign: TextAlign.center),
                        8.height,
                        Text('${data.count} product', style: secondaryTextStyle()),
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
