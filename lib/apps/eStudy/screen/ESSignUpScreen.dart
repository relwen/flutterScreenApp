import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class ESSignUpScreen extends StatefulWidget {
  const ESSignUpScreen({Key? key}) : super(key: key);

  @override
  _ESSignUpScreenState createState() => _ESSignUpScreenState();
}

class _ESSignUpScreenState extends State<ESSignUpScreen> {
  TextEditingController nameCont = TextEditingController();
  TextEditingController usernameCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  TextEditingController mobileCont = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
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
            Text('Sign Up', style: boldTextStyle(size: 20)),
            8.height,
            Text('Enter your real Information', style: secondaryTextStyle(size: 14)),
            16.height,
            AppTextField(
              controller: nameCont,
              autoFocus: false,
              cursorColor: appStore.isDarkModeOn ? whiteColor : black,
              textFieldType: TextFieldType.NAME,
              decoration: ESinputDecoration(context, hint: "Name", prefixIcon: Icon(Ionicons.person_outline, color: Colors.black)),
              nextFocus: emailFocus,
            ),
            16.height,
            AppTextField(
              controller: usernameCont,
              focus: emailFocus,
              cursorColor: appStore.isDarkModeOn ? whiteColor : black,
              textFieldType: TextFieldType.EMAIL,
              decoration: ESinputDecoration(context, hint: "Email", prefixIcon: Icon(Fontisto.email, color: Colors.black)),
              nextFocus: passwordFocus,
            ),
            16.height,
            AppTextField(
              controller: passwordCont,
              focus: passwordFocus,
              cursorColor: appStore.isDarkModeOn ? whiteColor : black,
              textFieldType: TextFieldType.PASSWORD,
              decoration: ESinputDecoration(context, hint: "Password", prefixIcon: Icon(SimpleLineIcons.lock_open, color: Colors.black)),
              nextFocus: passwordFocus,
            ),
            16.height,
            AppButton(
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(8)),
              text: "Sign Up",
              textStyle: primaryTextStyle(color: white),
              color: ESPrimaryColor,
              onTap: () {},
            ),
            22.height,
            Text('Or Sign Up with', style: primaryTextStyle()).center(),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [commonSocialButton(context: context, icon: MaterialIcons.facebook, name: "Facebook", color: ESFacebook), commonSocialButton(context: context, icon: Fontisto.google_plus, name: "Google", color: ESTextColor)],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already have an account?", style: primaryTextStyle()).paddingOnly(bottom: 14),
          TextButton(
            onPressed: () {
              finish(context);
            },
            child: Row(
              children: [
                Text('Log In', style: primaryTextStyle(color: ESTextColor)),
                Icon(Icons.arrow_right, color: ESTextColor),
              ],
            ),
          ).paddingOnly(bottom: 16)
        ],
      ),
    );
  }
}
