import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECCardModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCartTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCategoryTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCoinHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECFlashScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECListCardScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECMembershipLevelScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECNotificationsScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECSearchScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECShippingInfoScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECHomeFragment extends StatefulWidget {
  @override
  ECHomeFragmentState createState() => ECHomeFragmentState();
}

class ECHomeFragmentState extends State<ECHomeFragment> {
  List<Widget> wList = [
    ECCategoryTabBarPage(),
    ECShippingInfoScreen(),
    ECCartTabBarPage(),
    ECCoinHistoryScreen(),
    ECFlashScreen(),
    ECSearchScreen(),
    ECMembershipLevelScreen(),
    ECListCardScreen(),
  ];

  List<ECCardModel> cardList = getCardData();
  List<ECProductModel> foodList = getFoodDetails();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  color: darkSlateBlue,
                  height: 220,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(16), backgroundColor: white),
                                  child: commonCachedNetworkImage(ec_logo, width: 45, height: 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(8)),
                              8.width,
                              Text('Home', style: boldTextStyle(color: white, size: ecTitleSize)),
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Feather.shopping_bag, color: white, size: ecIconSize.toDouble()),
                                onPressed: () {
                                  ECProductTabBarPage().launch(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(Fontisto.bell, color: white, size: ecIconSize.toDouble()),
                                onPressed: () {
                                  ECNotificationsScreen().launch(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(MaterialCommunityIcons.cart_outline, color: white, size: ecIconSize.toDouble()),
                                onPressed: () {
                                  ECCartTabBarPage().launch(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      12.height,
                      Container(
                        height: 50,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(ecDefaultRadius1), color: appStore.isDarkModeOn ? cardDarkColor : white),
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          autoFocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Ionicons.search, color: appStore.isDarkModeOn ? white : scaffoldDarkColor).onTap(() {
                              ECSearchScreen().launch(context);
                            }),
                            hintText: 'Search Product',
                            suffixIcon: Icon(Icons.lock, color: appStore.isDarkModeOn ? white : scaffoldDarkColor).onTap(() {
                              ECProductTabBarPage().launch(context);
                            }),
                          ),
                        ),
                      ),
                    ],
                  ).paddingAll(ecDefaultPadding1),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    140.height,
                    InkWell(
                      onTap: () {
                        ECFlashScreen().launch(context);
                      },
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(ecDefaultRadius2),
                          image: DecorationImage(image: NetworkImage(ec_friday), fit: BoxFit.cover),
                        ),
                      ).paddingOnly(left: 8, right: 8),
                    ),
                    20.height,
                    Container(
                      height: 190,
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cardList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 4),
                        itemBuilder: (BuildContext context, int index) {
                          ECCardModel e = cardList[index];
                          return InkWell(
                            onTap: () {
                              wList[index].launch(context);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                8.height,
                                //   commonCacheImageWidget(e.img, fit: BoxFit.cover, width: 30, height: 30),
                                Container(
                                  decoration: BoxDecoration(color: e.bgCol, borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                                  height: 50,
                                  width: 50,
                                  padding: EdgeInsets.all(8),
                                  child: commonCachedNetworkImage(e.img, fit: BoxFit.cover),
                                ),
                                4.height,
                                Text(e.name!, style: boldTextStyle(size: 14)).expand(),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Product Favourite', style: boldTextStyle()),
                        Row(
                          children: [
                            Text('See more', style: boldTextStyle(color: grey)),
                            Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                          ],
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 16),
                    8.height,
                    HorizontalList(
                      itemCount: foodList.length,
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                      itemBuilder: (_, index) {
                        ECProductModel data = foodList[index];
                        return Container(
                          height: 180,
                          width: context.width() * 0.35,
                          margin: EdgeInsets.only(right: 8),
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
                                width: context.width() * 0.39,
                                fit: BoxFit.cover,
                              ).cornerRadiusWithClipRRectOnly(topRight: 8, topLeft: 8),
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
                              ).paddingSymmetric(horizontal: 8, vertical: 8),
                            ],
                          ),
                        ).onTap(() {
                          ECProductDetailTabBarPage().launch(context);
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
