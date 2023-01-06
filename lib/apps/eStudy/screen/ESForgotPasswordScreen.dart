import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ESForgotPasswordScreen extends StatefulWidget {
  const ESForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ESForgotPasswordScreenState createState() => _ESForgotPasswordScreenState();
}

class _ESForgotPasswordScreenState extends State<ESForgotPasswordScreen> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        " ",
        color: context.cardColor,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 18),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Forgot your password?', style: boldTextStyle(size: 20)),
          16.height,
          Text("Enter your phone number below,we'll send you a verified code.", style: secondaryTextStyle(size: 16)),
          20.height,
          Row(
            children: [
              CountryCodePicker(
                textStyle: primaryTextStyle(),
                showDropDownButton: true,
                showOnlyCountryWhenClosed: false,
                initialSelection: 'IN',
                showCountryOnly: false,
                alignLeft: false,
                dialogBackgroundColor: context.cardColor,
              ),
              AppTextField(
                controller: numberController,
                textFieldType: TextFieldType.PHONE,
                decoration: ESinputDecoration(context, hint: "Phone Number"),
                autoFocus: true,
                onFieldSubmitted: (s) {},
              ).expand(),
            ],
          ),
          30.height,
          AppButton(
            width: context.width(),
            shapeBorder: RoundedRectangleBorder(borderRadius: radius(8)),
            text: "Next",
            textStyle: primaryTextStyle(color: white),
            color: ESPrimaryColor,
            onTap: () {
              // ESVerifiedOTPScreen().launch(context);
            },
          ),
        ],
      ).paddingOnly(left: 16, right: 16, top: 16),
    );
  }
}
