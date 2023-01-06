import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import 'ESForgotPasswordScreen.dart';
import 'ESSignUpScreen.dart';

class ESSignInScreen extends StatefulWidget {
  const ESSignInScreen({Key? key}) : super(key: key);

  @override
  _ESSignInScreenState createState() => _ESSignInScreenState();
}

class _ESSignInScreenState extends State<ESSignInScreen> {
  TextEditingController usernameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();

  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 22, right: 22, top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                16.height,
                Image.asset(ESApp_logo, fit: BoxFit.cover, width: 85, height: 85).cornerRadiusWithClipRRect(16),
                8.height,
                Text('EStudy', style: boldTextStyle(size: 20)),
                2.height,
                Text('Learn From Home', style: secondaryTextStyle()),
              ],
            ).center(),
            32.height,
            Text('Login', style: boldTextStyle(size: 20)),
            8.height,
            Text('Enter your email and password', style: secondaryTextStyle(size: 14)),
            16.height,
            AppTextField(
              controller: usernameCont,
              autoFocus: false,
              cursorColor: appStore.isDarkModeOn ? whiteColor : black,
              textFieldType: TextFieldType.EMAIL,
              decoration: ESinputDecoration(context, hint: "Email", prefixIcon: Icon(Fontisto.email, color: context.iconColor)),
              nextFocus: passwordFocus,
            ),
            16.height,
            AppTextField(
              controller: passwordCont,
              focus: passwordFocus,
              cursorColor: appStore.isDarkModeOn ? whiteColor : black,
              textFieldType: TextFieldType.PASSWORD,
              decoration: ESinputDecoration(
                context,
                hint: "Password",
                prefixIcon: Icon(SimpleLineIcons.lock_open, color: context.iconColor),
              ),
              nextFocus: passwordFocus,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  ESForgotPasswordScreen().launch(context);
                },
                child: Text('Forget password?', style: primaryTextStyle(color: ESTextColor)),
              ),
            ),
            4.height,
            AppButton(
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(8)),
              text: "Login",
              textStyle: primaryTextStyle(color: white),
              color: ESPrimaryColor,
              onTap: () {
                finish(context);
                ESDashboardScreen().launch(context);
              },
            ),
            22.height,
            Text('Or login with', style: primaryTextStyle()).center(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [commonSocialButton(context: context, icon: MaterialIcons.facebook, name: "Facebook", color: ESFacebook), commonSocialButton(context: context, icon: Fontisto.google_plus, name: "Google", color: ESTextColor)],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't have an account?", style: primaryTextStyle()).paddingOnly(top: 12),
          TextButton(
            onPressed: () {
              ESSignUpScreen().launch(context);
            },
            child: Row(
              children: [
                Text('Sign Up', style: primaryTextStyle(color: ESTextColor)),
                Icon(Icons.arrow_right, color: ESTextColor),
              ],
            ),
          ).paddingOnly(bottom: 16)
        ],
      ),
    );
  }
}
