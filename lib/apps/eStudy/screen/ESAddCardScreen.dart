import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCheckOutScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ESAddCardScreen extends StatefulWidget {
  @override
  ESAddCardScreenState createState() => ESAddCardScreenState();
}

class ESAddCardScreenState extends State<ESAddCardScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String cardNumber = '';
  String cardHolderName = '';
  String cvvCode = '';
  String expiryDate = '';

  bool mIsCheck = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  void onCreditCardModel(CreditCardModel creditCardModel) {
    cardNumber = creditCardModel.cardNumber;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    expiryDate = creditCardModel.expiryDate;
    mIsCheck = creditCardModel.isCvvFocused;
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Add new card',
        textSize: 18,
        color: context.cardColor,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 18),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: mIsCheck,
              cardBgColor: Colors.black,
              backgroundImage: 'images/eStudy/ic_card_back.png',
              obscureCardNumber: true,
              isHolderNameVisible: true,
              height: 175,
              width: MediaQuery.of(context).size.width,
              isChipVisible: true,
              isSwipeGestureEnabled: false,
              cardType: CardType.mastercard,
              animationDuration: Duration(milliseconds: 1000),
              onCreditCardWidgetChange: (s) {
                //
              },
            ),
            CreditCardForm(
              formKey: formKey,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModel,
              themeColor: Colors.black,
              cardHolderDecoration: ESinputDecoration(context, hint: 'Card Holder'),
              cardNumberDecoration: ESinputDecoration(context, hint: 'Card Number'),
              expiryDateDecoration: ESinputDecoration(context, hint: 'Expired Date'),
              cvvCodeDecoration: ESinputDecoration(context, hint: 'CVV'),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppButton(
        text: 'Add New Card',
        color: ESPrimaryColor,
        textStyle: boldTextStyle(color: white),
        onTap: () {
          if (formKey.currentState!.validate() && expiryDate.isNotEmpty) {
            cardListAdd.add(
              CreditCardModel(cardNumber, expiryDate, cardHolderName, cvvCode, true),
            );
            LiveStream().emit('Data');
            finish(context);
          } else {
            toast('Please Input the Data');
          }
        },
      ).paddingAll(16),
    );
  }
}
