import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECDropDownModels.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECInvoiceInfo.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECCountryScreen extends StatefulWidget {
  @override
  _ECCountryScreenState createState() => _ECCountryScreenState();
}

class _ECCountryScreenState extends State<ECCountryScreen> {
  List<ECDropDownModelCountry> countryList = getDropDownCountryList();
  ECDropDownModelCountry? selectedUser;

  List<ECDropDownModelCurrency> currencyList = getDropDownCurrencyList();
  ECDropDownModelCurrency? selectedCurrency;

  List<ECDropDownModelLanguage> languageList = getDropDownLanguageList();
  ECDropDownModelLanguage? selectedLanguage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppButton(
          height: ecButtonHeight.toDouble(),
          width: context.width() * 0.95,
          text: 'Done',
          textColor: ec_seaBlue,
          color: darkBlue,
          splashColor: white,
          onTap: () {
            ECInvoiceInfo().launch(context);
          }).paddingAll(16),
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Country', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            commonCachedNetworkImage(ec_map, fit: BoxFit.cover, width: context.width()),
            16.height,
            Column(
              children: [
                Text(
                  'You are shopping for X Commerce items shipping to Vietnam. Which language and currency do you want to shop in?',
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center,
                ),
                16.height,
                Container(
                  width: context.width(),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: defaultBoxShadow(),
                    backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<ECDropDownModelCountry>(
                        hint: Text('Select Country', style: secondaryTextStyle()),
                        value: selectedUser,
                        onChanged: (ECDropDownModelCountry? value) {
                          setState(() {
                            selectedUser = value;
                          });
                        },
                        items: countryList.map(
                          (ECDropDownModelCountry user) {
                            return DropdownMenuItem<ECDropDownModelCountry>(
                              value: user,
                              child: Container(
                                height: 50,
                                width: 150,
                                child: Row(
                                  children: [
                                    user.img!,
                                    20.width,
                                    Text(user.country!, style: secondaryTextStyle()),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).toList()),
                  ),
                ),
                16.height,
                Container(
                  width: context.width(),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: defaultBoxShadow(),
                    backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<ECDropDownModelCurrency>(
                        hint: Text('Currency', style: secondaryTextStyle()),
                        value: selectedCurrency,
                        onChanged: (ECDropDownModelCurrency? value) {
                          setState(() {
                            selectedCurrency = value;
                          });
                        },
                        items: currencyList.map(
                          (ECDropDownModelCurrency user) {
                            return DropdownMenuItem<ECDropDownModelCurrency>(
                              value: user,
                              child: Text(user.currency!, style: secondaryTextStyle()),
                            );
                          },
                        ).toList()),
                  ),
                ),
                16.height,
                Container(
                  width: context.width(),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: defaultBoxShadow(),
                    backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<ECDropDownModelLanguage>(
                        hint: Text('Language', style: secondaryTextStyle()),
                        value: selectedLanguage,
                        onChanged: (ECDropDownModelLanguage? value) {
                          setState(() {
                            selectedLanguage = value;
                          });
                        },
                        items: languageList.map(
                          (ECDropDownModelLanguage user) {
                            return DropdownMenuItem<ECDropDownModelLanguage>(
                              value: user,
                              child: Text(user.language!, style: secondaryTextStyle(), textAlign: TextAlign.center),
                            );
                          },
                        ).toList()),
                  ),
                ),
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
