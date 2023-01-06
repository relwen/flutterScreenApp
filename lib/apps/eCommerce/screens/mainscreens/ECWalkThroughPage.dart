import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECWalkThroughModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECSignInScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ECWalkThroughPage extends StatefulWidget {
  @override
  _ECWalkThroughPageState createState() => _ECWalkThroughPageState();
}

class _ECWalkThroughPageState extends State<ECWalkThroughPage> {
  PageController pageController = PageController();
  List<ECWalkThroughModel> walkThroughListing = getWalkThroughList();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: context.cardColor),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: walkThroughListing.map(
                (data) {
                  return Column(
                    children: [
                      commonCachedNetworkImage(data.img!, height: context.height() * 0.6, width: context.width(), fit: BoxFit.cover),
                      16.height,
                      Text(data.title!, textAlign: TextAlign.center, style: boldTextStyle(size: 20)),
                      8.height,
                      Text(data.subTitle!, textAlign: TextAlign.center, style: primaryTextStyle()).paddingSymmetric(horizontal: 8),
                    ],
                  );
                },
              ).toList(),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  DotIndicator(pageController: pageController, indicatorColor: darkBlue, pages: walkThroughListing, unselectedIndicatorColor: appStore.isDarkModeOn ? white : gray),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppButton(
                        color: appStore.isDarkModeOn ? scaffoldColorDark : white,
                        height: ecButtonHeight.toDouble(),
                        text: 'Join Now',
                        textColor: appStore.isDarkModeOn ? white : darkBlue,
                        splashColor: darkBlue,
                        onTap: () {
                          ECSignUpScreen().launch(context);
                        },
                      ).expand(),
                      16.width,
                      AppButton(
                        height: ecButtonHeight.toDouble(),
                        text: 'Login',
                        textColor: ec_seaBlue,
                        color: darkBlue,
                        splashColor: white,
                        onTap: () {
                          ECSignInScreen().launch(context);
                        },
                      ).expand(),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
