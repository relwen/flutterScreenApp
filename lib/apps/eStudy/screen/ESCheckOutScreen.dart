import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESAddCardScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ESCheckOutScreen extends StatefulWidget {
  @override
  ESCheckOutScreenState createState() => ESCheckOutScreenState();
}

List<CreditCardModel> cardListAdd = [];

class ESCheckOutScreenState extends State<ESCheckOutScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    LiveStream().on(
      'Data',
      (v) {
        setState(() {});
      },
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Checkout',
        textSize: 18,
        color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 18),
        ),
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Select payment method', style: boldTextStyle()),
                16.height,
                Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  children: [
                    checkPaymentData(img: 'images/finance/fa_credit_card2.png', name: 'Card'),
                    checkPaymentData(img: 'images/eGarden/eg_ic_visa.png', name: 'Visa'),
                    checkPaymentData(img: 'images/eGarden/eg_ic_mastercard.png', name: 'MasterCard')
                  ],
                ),
                16.height,
                Text('Select Your Card', style: boldTextStyle()),
              ],
            ).paddingOnly(left: 16, right: 16, top: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.height,
                cardListAdd.isNotEmpty
                    ? Container(
                        height: 227,
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          scrollDirection: Axis.horizontal,
                          itemCount: cardListAdd.length,
                          itemBuilder: (context, index) {
                            CreditCardModel data = cardListAdd[index];
                            return esMastercardWidget(width: context.width() * 0.85, cardNumber: data.cardNumber, holderName: data.cardHolderName, validDate: data.expiryDate).paddingOnly(right: 8, left: 8);
                          },
                        ),
                      )
                    : esMastercardWidget(width: context.width(), cardNumber: '5412  7512  3412  3456', holderName: 'MR A B SMITH', validDate: '12/25').paddingOnly(left: 16, right: 16),
                16.height,
                TextButton(
                  onPressed: () async {
                    await ESAddCardScreen().launch(context);
                  },
                  child: Row(
                    children: [
                      Text('Add new Card', style: boldTextStyle()),
                      8.width,
                      Icon(Icons.add),
                    ],
                  ),
                ).paddingOnly(left: 16, right: 16)
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        text: '\$120 Pay Now',
        textStyle: primaryTextStyle(color: white),
        color: ESPrimaryColor,
        onTap: () {
          finish(context);
          finish(context);
          finish(context);
        },
      ).paddingAll(16),
    );
  }
}
