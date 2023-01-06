import 'package:mighty_ui_kit/apps/eCommerce/models/ECCodeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECTimeModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/ECTicketPassClipper.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ECCodeBrandScreen extends StatefulWidget {
  const ECCodeBrandScreen({Key? key}) : super(key: key);

  @override
  _ECCodeBrandScreenState createState() => _ECCodeBrandScreenState();
}

class _ECCodeBrandScreenState extends State<ECCodeBrandScreen> {
  List<ECTimeModel> brandList = getBrandList1();
  List<ECCodeModel> couponList = getCouponData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? cardDarkColor : gray.withOpacity(0.2),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HorizontalList(
              itemCount: brandList.length,
              itemBuilder: (_, index) {
                ECTimeModel data = brandList[index];
                return Container(
                    height: 40,
                    width: 90,
                    margin: EdgeInsets.only(right: 8, top: 8, bottom: 8, left: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: appStore.isDarkModeOn ? scaffoldColorDark : white, borderRadius: radius(ecDefaultRadius2)),
                    child: // Text('All', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue))
                        Text(data.img!, style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)));
              },
            ),
            Container(
              decoration: BoxDecoration(borderRadius: radius(ecDefaultRadius2), color: appStore.isDarkModeOn ? scaffoldColorDark : white),
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Ionicons.funnel, color: grey, size: ecIconSize.toDouble())),
                      Text('Filter', style: boldTextStyle()),
                      8.width,
                      Text('All Products', style: secondaryTextStyle(), textAlign: TextAlign.center),
                    ],
                  ),
                  Text('233 Results', style: primaryTextStyle(color: grey)),
                ],
              ),
            ).paddingOnly(left: 16, right: 16, bottom: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: couponList.map(
                (data) {
                  return Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      ClipPath(
                        clipper: ECTicketPassClipper(),
                        child: Container(
                          margin: EdgeInsets.only(top: 18),
                          height: 140,
                          width: context.width() * 0.43,
                          color: appStore.isDarkModeOn ? scaffoldColorDark : white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              16.height,
                              Text(data.codeTitle!, style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                              8.height,
                              Text(data.couponTitle!, style: secondaryTextStyle(), textAlign: TextAlign.center),
                            ],
                          ).paddingAll(8),
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 45,
                            width: 45,
                            child: CircleAvatar(child: data.codeIcon),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            margin: EdgeInsets.only(left: 30),
                            child: CircleAvatar(child: Text('${data.availability}%'), backgroundColor: lightGray),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ).toList(),
            ).paddingOnly(bottom: 16),
          ],
        ),
      ),
    );
  }
}
