import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECCollectionFoodScreen extends StatefulWidget {
  @override
  ECCollectionFoodScreenState createState() => ECCollectionFoodScreenState();
}

class ECCollectionFoodScreenState extends State<ECCollectionFoodScreen> {
  PageController pageController = PageController();

  List<ECProductModel> foodList = getFoodDetails();
  List<ECProductModel> logoList = getLogoDetails();
  List<String> pageList = [ec_sale1, ec_sale2, ec_sale3];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Collection Food', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Brand Favourite', style: boldTextStyle()),
                Row(
                  children: [
                    Text('See more', style: boldTextStyle(color: grey)),
                    Icon(Icons.keyboard_arrow_right, color: Colors.grey, size: ecIconSize.toDouble()),
                  ],
                ),
              ],
            ),
            16.height,
            Column(
              children: [
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: appStore.isDarkModeOn ? cardDarkColor : white,
                    borderRadius: BorderRadius.circular(ecDefaultRadius1),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                          color: Colors.black26,
                        ),
                      ),
                      PageView(
                        controller: pageController,
                        children: pageList.map(
                          (data) {
                            return commonCachedNetworkImage(data, fit: BoxFit.cover);
                          },
                        ).toList(),
                      ),
                      DotIndicator(pageController: pageController, indicatorColor: appStore.isDarkModeOn ? white : darkBlue, pages: pageList),
                    ],
                  ),
                ),
                Container(
                  height: 185,
                  padding: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, boxShadow: defaultBoxShadow()),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: context.height() / context.width() / 1.5),
                    itemCount: logoList.length,
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    itemBuilder: (context, index) {
                      ECProductModel data = logoList[index];
                      return Column(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(image: NetworkImage(data.img!), fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(ecDefaultRadius1),
                            ),
                          ),
                          Text(data.name!, style: secondaryTextStyle(), textAlign: TextAlign.center),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Product Favourite', style: boldTextStyle(size: ecTitleSize)),
                Row(
                  children: [
                    Text('See more', style: boldTextStyle(color: grey)),
                    Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                  ],
                ),
              ],
            ),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: foodList.map(
                (data) {
                  return Container(
                    height: 190,
                    width: context.width() * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(ecDefaultRadius1),
                      color: appStore.isDarkModeOn ? cardDarkColor : white,
                      boxShadow: defaultBoxShadow(),
                    ),
                    child: Column(
                      children: [
                        commonCachedNetworkImage(
                          data.img!,
                          height: 100,
                          width: context.width() * 0.43,
                          fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRectOnly(topRight: 8, topLeft: 8),
                        16.height,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data.name!, style: boldTextStyle(size: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
                            8.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$ ${data.price.toString()} .00', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue, size: 14)),
                                Icon(Icons.bookmark),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 8),
                      ],
                    ),
                  ).onTap(() {
                    ECProductDetailTabBarPage().launch(context);
                  });
                },
              ).toList(),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
