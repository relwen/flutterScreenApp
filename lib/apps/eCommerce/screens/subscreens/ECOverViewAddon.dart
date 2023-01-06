import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class ECOverViewAddon extends StatefulWidget {
  const ECOverViewAddon({Key? key}) : super(key: key);

  @override
  _ECOverViewAddonState createState() => _ECOverViewAddonState();
}

class _ECOverViewAddonState extends State<ECOverViewAddon> {
  int counter = 0;
  bool isButton1Pressed = false;
  bool isButton2Pressed = false;
  List itemColor = [lightBlue, ec_lightRed, black, purple, yellow];

  List<String> availableSize = ['L-42 pieces', 'M-40 pieces'];
  int selectedSize = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(ecDefaultPadding1),
            decoration: BoxDecoration(
                color: appStore.isDarkModeOn ? cardDarkColor : white,
                borderRadius: radius(ecDefaultRadius2)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    commonCacheImageWidget(ec_shoes2, 80,
                            width: 80, fit: BoxFit.cover)
                        .cornerRadiusWithClipRRect(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        8.height,
                        Text('\$1267',
                            style: boldTextStyle(
                                color:
                                    appStore.isDarkModeOn ? white : darkBlue)),
                        4.height,
                        Text('Available Stock 5', style: secondaryTextStyle()),
                      ],
                    ),
                    commonCacheImageWidget(ec_barcode, 60),
                  ],
                ),
                16.height,
                Text('Color', style: boldTextStyle()),
                HorizontalList(
                  itemCount: itemColor.length,
                  padding: EdgeInsets.only(bottom: 8, right: 8, top: 8),
                  itemBuilder: (context, index) {
                    return Container(
                        margin: EdgeInsets.only(right: 8),
                        child: Icon(Icons.circle,
                            size: 25, color: itemColor[index]));
                  },
                ),
                8.height,
                Text('Size', style: boldTextStyle()),
                8.height,
                HorizontalList(
                  itemCount: availableSize.length,
                  padding: EdgeInsets.only(bottom: 8, top: 4),
                  itemBuilder: (context, index) {
                    return Container(
                      child: Text(availableSize[index],
                          style: primaryTextStyle(color: black)),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.only(right: 8),
                      decoration: boxDecorationWithShadow(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: defaultBoxShadow(),
                        backgroundColor:
                            selectedSize == index ? lightBlue : white,
                      ),
                    ).onTap(() {
                      setState(() {
                        selectedSize = index;
                      });
                    });
                  },
                ),
                8.height,
                Text('Quantity', style: boldTextStyle()),
                8.height,
                Row(
                  children: [
                    AppButton(
                      width: 30,
                      text: '-',
                      textColor: black,
                      color: white,
                      onTap: () {
                        setState(() {
                          if (counter > 0) {
                            counter--;
                          } else {
                            counter = 0;
                          }
                        });
                      },
                    ),
                    20.width,
                    Container(
                      height: 40,
                      alignment: Alignment.center,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: radius(ecDefaultRadius1),
                          color: Colors.grey[300]),
                      child: Text('$counter',
                          style: primaryTextStyle(
                              color: appStore.isDarkModeOn
                                  ? scaffoldDarkColor
                                  : black)),
                    ),
                    20.width,
                    AppButton(
                      width: 30,
                      text: '+',
                      textColor: black,
                      color: lightBlue,
                      splashColor: white,
                      onTap: () {
                        setState(() {
                          counter++;
                        });
                      },
                    ),
                  ],
                ),
                24.height,
                AppButton(
                  height: ecButtonHeight.toDouble(),
                  width: context.width(),
                  text: 'Apply',
                  textColor: lightBlue,
                  color: darkBlue,
                  splashColor: white,
                  onTap: () {
                    ECProductDetailTabBarPage().launch(context);
                  },
                ),
              ],
            ).paddingAll(16),
          ),
          Positioned(
            right: 16,
            top: -26,
            child: Container(
              decoration: boxDecorationWithShadow(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: defaultBoxShadow(),
                  backgroundColor:
                      appStore.isDarkModeOn ? cardDarkColor : white),
              height: 45,
              width: 45,
              child: Icon(Icons.cancel),
            ).onTap(
              () {
                finish(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
