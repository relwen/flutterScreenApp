import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECStoreProductScreen extends StatefulWidget {
  @override
  _ECStoreProductScreenState createState() => _ECStoreProductScreenState();
}

class _ECStoreProductScreenState extends State<ECStoreProductScreen> {
  List<ECProductModel> storeProductList = getStoreProductDetails();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(child: Icon(Octicons.flame)),
            16.width,
            Text('Bestseller', style: boldTextStyle()),
          ],
        ).paddingOnly(left: 16, top: 8),
        ListView.builder(
          itemCount: getStoreProductDetails().length,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 16),
          shrinkWrap: true,
          itemBuilder: (_, index) {
            ECProductModel data = storeProductList[index];
            return Column(
              children: [
                InkWell(
                  onTap: () {
                    ECProductDetailTabBarPage().launch(context);
                  },
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(8),
                        height: 170,
                        decoration: BoxDecoration(
                            color:
                                appStore.isDarkModeOn ? cardDarkColor : white,
                            borderRadius: radius(ecDefaultRadius2),
                            boxShadow: defaultBoxShadow()),
                        child: Row(
                          children: [
                            commonCachedNetworkImage(data.img!,
                                    width: 80, fit: BoxFit.cover)
                                .cornerRadiusWithClipRRect(16),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(data.name!, style: boldTextStyle()),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    4.width,
                                    Text(data.rating!, style: boldTextStyle()),
                                    4.width,
                                    Text('(${data.count} rating)',
                                        style: secondaryTextStyle()),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.shopping_cart_sharp,
                                        color: ec_lightRed),
                                    Text('${data.sales}k Sales',
                                        style: primaryTextStyle()),
                                  ],
                                ),
                                2.height,
                                Row(
                                  children: [
                                    Text('\$${data.price}',
                                        style: boldTextStyle(
                                            color: appStore.isDarkModeOn
                                                ? white
                                                : darkBlue)),
                                    20.width,
                                    Text('-${data.discount}%',
                                        style: secondaryTextStyle()),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ).paddingAll(16),
                      ),
                      Positioned(
                        right: 16,
                        top: -5,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Icon(Icons.bookmark, size: 32),
                            Text('${data.no}',
                                style: boldTextStyle(
                                    color: appStore.isDarkModeOn
                                        ? cardDarkColor
                                        : white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
