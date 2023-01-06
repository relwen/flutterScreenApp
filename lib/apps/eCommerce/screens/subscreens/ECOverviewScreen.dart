import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECOverViewAddon.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECPaymentMethodScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECOverviewScreen extends StatefulWidget {
  const ECOverviewScreen({Key? key}) : super(key: key);

  @override
  _ECOverviewScreenState createState() => _ECOverviewScreenState();
}

class _ECOverviewScreenState extends State<ECOverviewScreen> {
  PageController pageController = PageController();

  List<ECProductModel> ovList = getOverViewList();
  List<ECProductModel> miList = getMaybeInterestedList();
  List<ECProductModel> boughtList = getBoughtTogetherList();

  late ECProductModel product;

  @override
  void initState() {
    super.initState();
    product = ovList.first;
    init();
  }

  Future<void> init() async {
    pageController.addListener(
      () {
        setState(() {});
      },
    );
    setState(() {});
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Scaffold(
        persistentFooterButtons: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 45,
                width: 50,
                decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: BorderRadius.circular(ecDefaultRadius1), boxShadow: defaultBoxShadow()),
                child: IconButton(
                  icon: Icon(Icons.add, size: ecIconSize.toDouble()),
                  onPressed: () {
                    showModalBottomSheet<dynamic>(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: radius(30),
                      ),
                      context: context,
                      builder: (builder) {
                        return ECOverViewAddon();
                      },
                    );
                  },
                ),
              ),
              AppButton(
                width: context.width() * 0.7,
                height: ecButtonHeight.toDouble(),
                text: 'Pay Now',
                textColor: ec_seaBlue,
                color: darkBlue,
                splashColor: white,
                onTap: () {
                  ECPaymentMethodScreen().launch(context);
                },
              ),
            ],
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                width: context.width(),
                decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius()),
                child: PageView(
                  controller: pageController,
                  children: product.images!.map(
                    (data) {
                      return Container(
                        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: commonCachedNetworkImage(data, width: context.width(), fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
                      );
                    },
                  ).toList(),
                ),
              ),
              8.height,
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_left, size: 40)),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                            // ignore: invalid_use_of_protected_member
                            child: Text('${pageController.positions.isNotEmpty ? (pageController.page!.toInt() + 1) : 1}/${product.images!.length}'),
                            decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius()),
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.keyboard_arrow_right, size: 40)),
                        ],
                      ),
                      8.height,
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name!, style: boldTextStyle()),
                            Text(product.orderId!, style: secondaryTextStyle()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Available Stock: 1', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                                Text('\$ ${product.price.toString()}', style: primaryTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Maybe Interested', style: boldTextStyle()),
                      Row(
                        children: [
                          Text('See More', style: secondaryTextStyle()),
                          4.width,
                          Icon(Icons.keyboard_arrow_right, color: grey),
                        ],
                      ),
                    ],
                  ).paddingOnly(left: 16, right: 16, top: 16),
                  HorizontalList(
                    itemCount: miList.length,
                    itemBuilder: (_, index) {
                      ECProductModel data = miList[index];
                      return Container(
                        width: 150,
                        margin: EdgeInsets.only(right: 4, top: 8, left: 8, bottom: 8),
                        decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: BorderRadius.circular(ecDefaultRadius2), boxShadow: defaultBoxShadow()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            commonCachedNetworkImage(data.img!, height: 120, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRectOnly(topLeft: 16, topRight: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.name!, style: boldTextStyle()),
                                Text(data.orderId!, style: boldTextStyle()),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('\$ ${data.price.toString()}', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                                    Text('-${data.discount}%', style: secondaryTextStyle(color: grey)),
                                  ],
                                ),
                              ],
                            ).paddingAll(8),
                          ],
                        ),
                      ).onTap(() {
                        ECProductDetailTabBarPage().launch(context);
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Usually Bought Together', style: boldTextStyle()),
                      Row(
                        children: [
                          Text('See More', style: secondaryTextStyle()),
                          4.width,
                          Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                        ],
                      ),
                    ],
                  ).paddingOnly(left: 16, right: 16, bottom: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: ecDefaultPadding1),
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? cardDarkColor : white, borderRadius: radius(ecDefaultRadius1), boxShadow: defaultBoxShadow()),
                    child: Column(
                      children: [
                        Row(
                          children: boughtList.map(
                            (data) {
                              int ind = boughtList.indexOf(data);
                              return Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      commonCachedNetworkImage(data.img!, height: 80, width: 70).cornerRadiusWithClipRRect(16),
                                      4.height,
                                      Text('\$${data.price}', style: primaryTextStyle()),
                                    ],
                                  ),
                                  4.width,
                                  ind == 2 ? SizedBox() : Icon(Icons.add, size: 20),
                                  4.width,
                                ],
                              );
                            },
                          ).toList(),
                        ),
                        4.height,
                        Text('Buy 3 reduce product, reduce 30%', style: boldTextStyle(color: grey)),
                      ],
                    ),
                  ),
                ],
              ).paddingOnly(bottom: 16),
            ],
          ),
        ),
      ),
    );
  }
}
