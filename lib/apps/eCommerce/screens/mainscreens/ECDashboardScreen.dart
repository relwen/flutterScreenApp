import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECCategoryTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECPromoTabBarPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECScanCameraScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECConditionScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECHomeFragment.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECPaymentMethodScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECProfileScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECDashboardScreen extends StatefulWidget {
  @override
  _ECDashboardScreenState createState() => _ECDashboardScreenState();
}

class _ECDashboardScreenState extends State<ECDashboardScreen> {
  int currentIndex = 0;

  List widgets = [
    ECHomeFragment(),
    ECCategoryTabBarPage(),
    ECPaymentMethodScreen(),
    ECPromoTabBarPage(),
    ECProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: widgets[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            if (index == 2) {
              // Open BarCode
              showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                context: context,
                builder: (builder) {
                  return Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: context.height() * 0.7,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color:
                                appStore.isDarkModeOn ? cardDarkColor : white,
                            borderRadius: BorderRadius.circular(30)),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              commonCachedNetworkImage(ec_barcode,
                                      fit: BoxFit.cover,
                                      height: 110,
                                      width: 110)
                                  .cornerRadiusWithClipRRect(50),
                              16.height,
                              Text('Scan Product',
                                  style: boldTextStyle(size: 20)),
                              16.height,
                              Text(
                                'Point the camera at the barcode, QR Code to see the content of that code',
                                style: secondaryTextStyle(color: grey),
                              ),
                              16.height,
                              RichText(
                                text: TextSpan(
                                  text:
                                      'By continuing to use the camera in app or by submitting images, you agree to the ',
                                  style:
                                      primaryTextStyle(fontFamily: 'Poppins'),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Condition of use ',
                                      style: primaryTextStyle(
                                          color: darkSlateBlue,
                                          fontFamily: 'Poppins'),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          ECConditionScreen().launch(context);
                                        },
                                    ),
                                    TextSpan(
                                        text: ' and to text processing.',
                                        style: primaryTextStyle(
                                            fontFamily: 'Poppins')),
                                  ],
                                ),
                              ),
                              8.height,
                              RichText(
                                text: TextSpan(
                                  text:
                                      'Image related to your use of the camera in the app. Your submitted images and other related information to provide and improve its service.\nPlease see our',
                                  style:
                                      primaryTextStyle(fontFamily: 'Poppins'),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Privacy Notice ',
                                      style: primaryTextStyle(
                                          color: darkSlateBlue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          ECConditionScreen().launch(context);
                                        },
                                    ),
                                  ],
                                ),
                              ),
                              16.height,
                              AppButton(
                                height: ecButtonHeight.toDouble(),
                                width: context.width(),
                                text: 'Continue',
                                textColor: ec_seaBlue,
                                color: darkBlue,
                                splashColor: white,
                                onTap: () {
                                  ECScanCameraScreen().launch(context);
                                },
                              ),
                              16.height,
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -16,
                        right: 20,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: boxDecorationWithShadow(
                              borderRadius: BorderRadius.circular(8),
                              backgroundColor: appStore.isDarkModeOn
                                  ? cardDarkColor
                                  : white),
                          child: Icon(Icons.clear),
                        ).onTap(() {
                          finish(context);
                        }),
                      ),
                    ],
                  );
                },
              );
            } else {
              currentIndex = index;
              setState(() {});
            }
          },
          selectedFontSize: 14,
          unselectedFontSize: 14,
          unselectedItemColor: Colors.grey.shade500,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(
              label: '',
              icon: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                child: Icon(Icons.qr_code_scanner_outlined, color: white),
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.wallet_giftcard), label: 'Promo'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
