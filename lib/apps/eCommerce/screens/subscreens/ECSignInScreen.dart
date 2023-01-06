import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECSignInScreen extends StatefulWidget {
  @override
  _ECSignInScreenState createState() => _ECSignInScreenState();
}

class _ECSignInScreenState extends State<ECSignInScreen> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController userCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            commonCachedNetworkImage(ec_logo, height: 80, width: 80),
            16.height,
            Form(
              key: _formkey,
              child: Container(
                decoration: boxDecorationWithShadow(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: defaultBoxShadow(),
                  backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(alignment: Alignment.centerLeft, child: Text('Sign in\nto continue', style: boldTextStyle(size: 24))),
                    8.height,
                    AppTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Name";
                        }
                        return null;
                      },
                      controller: userCont,
                      textFieldType: TextFieldType.NAME,
                      decoration: inputDecoration(icon: Icons.person, hintText: 'Enter UserName'),
                    ),
                    8.height,
                    AppTextField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Password";
                        }
                        return null;
                      },
                      controller: passCont,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: inputDecoration(icon: Icons.lock, hintText: 'Enter Password'),
                    ),
                    8.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('Forgot Password?', style: boldTextStyle(color: ec_seaBlue)),
                        ),
                        TextButton(
                          onPressed: () {
                            ECDashboardScreen().launch(context);
                          },
                          child: Text('Skip', style: boldTextStyle(color: ec_seaBlue)),
                        ),
                      ],
                    ),
                    8.height,
                    AppButton(
                      height: ecButtonHeight.toDouble(),
                      width: context.width(),
                      text: 'Login',
                      textColor: ec_seaBlue,
                      color: darkBlue,
                      splashColor: white,
                      onTap: () {
                        if (_formkey.currentState!.validate()) {
                          ECDashboardScreen().launch(context);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signed in')));
                        }
                      },
                    ),
                  ],
                ).paddingSymmetric(horizontal: 16, vertical: 24),
              ),
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: secondaryTextStyle()),
                4.width,
                Text("Create new account", style: secondaryTextStyle(color: ec_seaBlue)).onTap(
                  () {
                    ECSignUpScreen().launch(context);
                  },
                ),
              ],
            ),
            16.height,
            Text('OR Login in with', style: boldTextStyle()),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialLoginButton(img: 'https://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png'),
                16.width,
                buildSocialLoginButton(img: 'https://i.pinimg.com/originals/39/21/6d/39216d73519bca962bd4a01f3e8f4a4b.png'),
                16.width,
                buildSocialLoginButton(img: 'https://image.pngaaa.com/880/21880-middle.png'),
              ],
            ),
          ],
        ).paddingOnly(top: 16, bottom: 16, left: 16, right: 16),
      ),
    );
  }
}
