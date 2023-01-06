import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCardModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECListCardScreen extends StatefulWidget {
  const ECListCardScreen({Key? key}) : super(key: key);

  @override
  _ECListCardScreenState createState() => _ECListCardScreenState();
}

class _ECListCardScreenState extends State<ECListCardScreen> {
  List<ECCardModel> cardList = getCardDetails();

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('List Cards', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : scaffoldDarkColor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Tap on the card to set as default payment method\nSwipe Right to remove card', style: secondaryTextStyle()),
            16.height,
            Column(
              children: cardList.map(
                (data) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    width: context.width(),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        commonCachedNetworkImage(data.img, width: context.width(), fit: BoxFit.cover, height: 220).cornerRadiusWithClipRRect(16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            commonCachedNetworkImage(ec_cardChip, width: 80, fit: BoxFit.cover, height: 100).cornerRadiusWithClipRRect(16),
                            16.height,
                            Text(data.cardNo!, style: boldTextStyle(color: white, size: 20)),
                            Text(data.name!, style: boldTextStyle(color: white, size: 20)),
                          ],
                        ).paddingOnly(left: 16, bottom: 26),
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
