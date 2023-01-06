import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/utils/ExpirationFormField.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/utils/Flip.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:nb_utils/nb_utils.dart';

class FTAddCardScreen extends StatefulWidget {
  static String tag = '/DTPaymentScreen';

  @override
  FTAddCardScreenState createState() => FTAddCardScreenState();
}

class FTAddCardScreenState extends State<FTAddCardScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  TextEditingController cardNumberCont = TextEditingController();
  TextEditingController cardHolderCont = TextEditingController();
  TextEditingController expiryDateCont = TextEditingController(text: 'MM/YY');
  TextEditingController securityCodeCont = TextEditingController();

  FocusNode cardHolderFocus = FocusNode();
  FocusNode expiryDateFocus = FocusNode();
  FocusNode securityCodeFocus = FocusNode();

  bool isFocusOnSecurityCode = false;
  bool _value = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    securityCodeFocus.addListener(() {
      cardKey.currentState!.toggleCard();

      setState(() {});
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    securityCodeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add New Card', style: boldTextStyle(color: Colors.white)),
          backgroundColor: appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.red,
          automaticallyImplyLeading: false,
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: context.width(),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: FlipCard(
                      key: cardKey,
                      front: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.blue.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Image.network('https://purepng.com/public/uploads/large/purepng.com-mastercard-logologobrand-logoiconslogos-251519938372dnf77.png'),
                                  height: 40,
                                  right: 8,
                                  top: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        cardNumberCont.text.padRight(16, '*').replaceAllMapped(RegExp(r".{4}"), (match) => "${match.group(0)} "),
                                        style: boldTextStyle(size: 24),
                                      ),
                                    ),
                                    30.height,
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Card Holder', style: primaryTextStyle(size: 16)),
                                        Text('Expiry', style: primaryTextStyle(size: 16)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cardHolderCont.text,
                                          style: boldTextStyle(size: 24),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ).expand(),
                                        Text(expiryDateCont.text, style: boldTextStyle(size: 24)),
                                      ],
                                    ),
                                  ],
                                ).paddingOnly(left: 16, right: 16),
                              ],
                            ),
                          ),
                        ],
                      ),
                      back: Container(
                        decoration: BoxDecoration(color: Theme.of(context).cardColor.withOpacity(0.5), borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(height: 40, color: Colors.black),
                            20.height,
                            Row(
                              children: [
                                Container(height: 40, color: Colors.black38, width: (context.width()) * 0.6),
                                20.width,
                                Text(securityCodeCont.text, style: boldTextStyle(size: 24)),
                              ],
                            ),
                            20.height,
                            Container(height: 40, color: Colors.black12),
                          ],
                        ),
                      ),
                    ),
                  ),
                  40.height,
                  Container(
                    width: MediaQuery.of(context).size.width - 34,
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _value = !_value;
                            });
                          },
                          child: SizedBox(
                              child: Row(
                            children: [
                              _value
                                  ? Icon(Icons.check_circle, color: Colors.red)
                                  : Icon(
                                      Icons.circle_outlined,
                                      color: Colors.grey,
                                    ),
                              SizedBox(width: 3),
                              Text('Credit Card', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                            ],
                          )),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _value = !_value;
                            });
                          },
                          child: SizedBox(
                              child: Row(
                            children: [
                              _value
                                  ? Icon(
                                      Icons.circle_outlined,
                                      color: Colors.grey,
                                    )
                                  : Icon(Icons.check_circle, color: Colors.red),
                              SizedBox(width: 3),
                              Text('PayPal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                            ],
                          )),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    controller: cardNumberCont,
                    keyboardType: TextInputType.number,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      counterText: '',
                      labelStyle: secondaryTextStyle(),
                    ),
                    maxLength: 16,
                    textInputAction: TextInputAction.next,
                    onChanged: (s) {
                      setState(() {});
                    },
                    onSubmitted: (s) {
                      FocusScope.of(context).requestFocus(expiryDateFocus);
                    },
                  ),
                  16.height,
                  Row(
                    children: [
                      ExpirationFormField(
                        controller: expiryDateCont,
                        style: primaryTextStyle(),
                        focusNode: expiryDateFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'Expiry Date',
                          labelStyle: secondaryTextStyle(),
                          counterText: '',
                        ),
                      ).expand(),
                      16.width,
                      TextField(
                        controller: securityCodeCont,
                        keyboardType: TextInputType.number,
                        style: primaryTextStyle(),
                        focusNode: securityCodeFocus,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: 'CVV',
                          labelStyle: secondaryTextStyle(),
                          counterText: '',
                        ),
                        maxLength: 3,
                        onChanged: (s) {
                          setState(() {});
                        },
                        onSubmitted: (s) {
                          FocusScope.of(context).requestFocus(cardHolderFocus);
                        },
                      ).expand(),
                    ],
                  ),
                  16.height,
                  TextField(
                    controller: cardHolderCont,
                    textCapitalization: TextCapitalization.words,
                    focusNode: cardHolderFocus,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      labelText: 'Card Holder',
                      labelStyle: secondaryTextStyle(),
                    ),
                    onChanged: (s) {
                      setState(() {});
                    },
                  ),
                  20.height,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 50),
                        child: Text('Next'),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(appStore.isDarkModeOn ? Theme.of(context).cardColor : Colors.red),
                          shape: MaterialStateProperty.all(ContinuousRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), topLeft: Radius.circular(20))))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
