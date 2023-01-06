import 'package:mighty_ui_kit/apps/eCommerce/models/ECCategoryModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCartTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCategoryTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECProductDetailTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:nb_utils/nb_utils.dart';

class ECTechnologyScreen extends StatefulWidget {
  const ECTechnologyScreen({Key? key}) : super(key: key);

  @override
  _ECTechnologyScreenState createState() => _ECTechnologyScreenState();
}

class _ECTechnologyScreenState extends State<ECTechnologyScreen> {
  PageController pageController = PageController();
  List<ECProductModel> pList = getProductList();
  List<ECProductModel> tList2 = getTechList2();
  List<ECCategoryModel> categoryList = getCategoryList();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.west, size: ecIconSize.toDouble()),
                      ),
                      Text('Technology', style: boldTextStyle(size: ecTitleSize)),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share, size: ecIconSize.toDouble()),
                      ),
                      IconButton(
                        onPressed: () {
                          ECCartTabBarPage().launch(context);
                        },
                        icon: Icon(Icons.shopping_cart, size: ecIconSize.toDouble()),
                      ),
                    ],
                  ),
                ],
              ),
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: categoryList.map((data) {
                  return InkWell(
                    onTap: () {
                      ECProductDetailTabBarPage().launch(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(ecDefaultPadding1),
                      height: 100,
                      width: context.width() * 0.45,
                      decoration: BoxDecoration(color: white, borderRadius: radius(ecDefaultRadius2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: data.images!.map(
                              (e) {
                                return Image.asset(e, height: 40, width: 40, fit: BoxFit.cover, errorBuilder: (_, __, ___) {
                                  log(e);
                                  return Text('error');
                                });
                              },
                            ).toList(),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          ),
                          8.height,
                          Text(
                            data.category!,
                            style: boldTextStyle(color: darkBlue),
                          ).expand(),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              TextButton(
                child: Text('View all category', style: boldTextStyle(color: ec_seaBlue)),
                onPressed: () {
                  ECCategoryTabBarPage().launch(context);
                },
              ),
              Container(
                decoration: BoxDecoration(borderRadius: radius(ecDefaultRadius2), color: white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Ionicons.funnel, color: grey),
                    ),
                    Text('Filter', style: boldTextStyle()),
                    Text('All Products', style: primaryTextStyle(color: grey)),
                    Text('233 Products', style: primaryTextStyle(color: grey)),
                  ],
                ),
              ).paddingAll(ecDefaultPadding1),
              8.height,
              Wrap(
                runSpacing: 8,
                spacing: 8,
                children: tList2.map(
                  (data) {
                    return Container(
                      padding: EdgeInsets.all(4),
                      width: context.width() * 0.46,
                      decoration: BoxDecoration(color: white, borderRadius: radius(ecDefaultRadius2)),
                      child: InkWell(
                        onTap: () {
                          ECProductDetailTabBarPage().launch(context);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(data.img!, height: 100, width: 100, fit: BoxFit.cover),
                            Text(data.name!, style: boldTextStyle()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.star, color: yellow),
                                5.width,
                                Text(data.rating!),
                                5.width,
                                Text('${data.count} rating'),
                              ],
                            ),
                            Text('\$ ${data.price}', style: boldTextStyle(color: darkBlue)),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
