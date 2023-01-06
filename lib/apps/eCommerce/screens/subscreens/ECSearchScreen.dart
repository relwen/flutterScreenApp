import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECTopKeySearchModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCategoryTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECSearchScreen extends StatefulWidget {
  @override
  _ECSearchScreenState createState() => _ECSearchScreenState();
}

class _ECSearchScreenState extends State<ECSearchScreen> {
  List<String> searchImage = [ec_shoes1, ec_shoes2, ec_shoes3];

  List<ECTopKeySearchModel> topSearchList = getTopSearchList();

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
        title: Text('Search', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
        actions: [
          IconButton(
            icon: Icon(Ionicons.funnel),
            onPressed: () {
              finish(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                AppTextField(
                  textFieldType: TextFieldType.NAME,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(16)),
                    filled: true,
                    fillColor: appStore.isDarkModeOn ? cardDarkColor : white,
                    border: InputBorder.none,
                    prefixIcon: Icon(Feather.search, size: 20),
                    suffixIcon: Icon(Feather.lock, size: 20),
                    hintText: 'Search Product',
                    hintStyle: TextStyle(fontSize: 15),
                  ),
                ),
                16.height,
                Stack(
                  children: [
                    commonCachedNetworkImage(ec_aj1blue, fit: BoxFit.cover, height: 270, width: context.width()).cornerRadiusWithClipRRect(16),
                    Container(color: black.withOpacity(0.2), height: 270, width: context.width()).cornerRadiusWithClipRRect(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Featured', style: boldTextStyle(color: white, size: 14)),
                        8.height,
                        Text('Up To 50% Off \nHoliday Bit', style: boldTextStyle(color: white, size: 26)),
                        8.height,
                      ],
                    ).paddingAll(16),
                    Positioned(
                      bottom: 24,
                      left: 16,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(color: black.withOpacity(0.4), borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                        child: HorizontalList(
                          itemCount: searchImage.length,
                          padding: EdgeInsets.only(bottom: 8, top: 4),
                          itemBuilder: (context, index) {
                            return commonCachedNetworkImage(searchImage[index], fit: BoxFit.cover, width: 50, height: 50).cornerRadiusWithClipRRect(8);
                          },
                        ),
                      ),
                    )
                  ],
                ).onTap(() {
                  ECProductDetailTabBarPage().launch(context);
                }),
              ],
            ).paddingAll(16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Top Key Search', style: boldTextStyle()),
                    Row(
                      children: [
                        Text('See more', style: secondaryTextStyle()),
                        8.width,
                        Icon(Icons.keyboard_arrow_right_sharp, color: Colors.grey[400], size: ecIconSize.toDouble()),
                      ],
                    ).onTap(() {
                      ECCategoryTabBarPage().launch(context);
                    }),
                  ],
                ).paddingSymmetric(horizontal: 16),
                ListView.builder(
                  itemCount: topSearchList.length,
                  padding: EdgeInsets.all(ecDefaultPadding1),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (_, index) {
                    ECTopKeySearchModel data = topSearchList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: ecDefaultPadding1, horizontal: 16),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: appStore.isDarkModeOn ? cardDarkColor : white,
                        borderRadius: BorderRadius.circular(ecDefaultRadius2),
                        boxShadow: defaultBoxShadow(),
                      ),
                      child: Row(
                        children: [
                          commonCachedNetworkImage(data.img, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                          16.width,
                          Text(data.name!, style: boldTextStyle()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(data.totalProduct!, style: primaryTextStyle(size: 15)),
                              4.width,
                              data.icon!,
                            ],
                          ).expand(),
                        ],
                      ),
                    ).onTap(
                      () {
                        ECCategoryTabBarPage().launch(context);
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
