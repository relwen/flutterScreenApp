import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECListCardScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECPaymentMethodScreen extends StatefulWidget {
  @override
  _ECPaymentMethodScreenState createState() => _ECPaymentMethodScreenState();
}

class _ECPaymentMethodScreenState extends State<ECPaymentMethodScreen> {
  bool? showValue1 = false;
  bool? showValue2 = false;
  bool? showValue3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Payment Method', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : scaffoldDarkColor),
      ),
      body: Scaffold(
        persistentFooterButtons: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            child: AppButton(
              height: ecButtonHeight.toDouble(),
              width: context.width(),
              text: 'Confirm',
              textColor: ec_seaBlue,
              color: darkBlue,
              splashColor: white,
              onTap: () {},
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Select Payment Method', style: boldTextStyle()),
              16.height,
              Container(
                padding: EdgeInsets.all(ecDefaultPadding1),
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ecDefaultRadius2),
                  color: appStore.isDarkModeOn ? cardDarkColor : white,
                  boxShadow: defaultBoxShadow(),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            commonCachedNetworkImage(ec_paypal, height: 50, width: 45, fit: BoxFit.cover),
                            16.width,
                            Text('PayPal', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                          ],
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                          value: this.showValue1,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                this.showValue3 = false;
                                this.showValue2 = false;
                                this.showValue1 = value;
                              },
                            );
                          },
                        ),
                      ],
                    ).onTap(() {
                      setState(() {});
                      showValue1 = !showValue1!;
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            commonCachedNetworkImage(ec_mastercard, height: 40, width: 55, fit: BoxFit.cover),
                            8.width,
                            Text('MasterCard', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                          ],
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ecDefaultRadius1)),
                          value: this.showValue2,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                this.showValue1 = false;
                                this.showValue3 = false;
                                this.showValue2 = value;
                              },
                            );
                          },
                        ),
                      ],
                    ).onTap(() {
                      setState(() {});
                      showValue2 = !showValue2!;
                    }),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            commonCachedNetworkImage(ec_cash, height: 40, width: 40, fit: BoxFit.cover),
                            22.width,
                            Text('Cash', style: boldTextStyle(color: appStore.isDarkModeOn ? white : darkBlue)),
                          ],
                        ),
                        Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ecDefaultRadius1),
                          ),
                          value: this.showValue3,
                          onChanged: (bool? value) {
                            setState(
                              () {
                                this.showValue1 = false;
                                this.showValue2 = false;
                                this.showValue3 = value;
                              },
                            );
                          },
                        ),
                      ],
                    ).onTap(() {
                      setState(() {});
                      showValue3 = !showValue3!;
                    }),
                  ],
                ),
              ),
              16.height,
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  commonCachedNetworkImage(ec_card1, width: context.width(), fit: BoxFit.cover, height: 220).cornerRadiusWithClipRRect(16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      commonCachedNetworkImage(ec_cardChip, width: 80, fit: BoxFit.cover, height: 100).cornerRadiusWithClipRRect(16),
                      16.height,
                      Text('**** **** **** 2345', style: boldTextStyle(color: white, size: 16)),
                      Text('Jonathan Langford', style: boldTextStyle(color: white, size: 16)),
                    ],
                  ).paddingOnly(left: 16, bottom: 26),
                ],
              ),
              8.height,
              TextButton(
                onPressed: () {
                  ECListCardScreen().launch(context);
                },
                child: Text('See all list card', style: boldTextStyle(color: ec_seaBlue), textAlign: TextAlign.center),
              ).center(),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
