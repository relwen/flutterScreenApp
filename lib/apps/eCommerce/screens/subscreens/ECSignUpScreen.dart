import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eCommerce/models/ECDropDownModels.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECTerms.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECSignUpScreen extends StatefulWidget {
  State createState() => ECSignUpScreenState();
}

class ECSignUpScreenState extends State<ECSignUpScreen> {
  ECDropDownModelCountry? selectedUser;
  List<ECDropDownModelCountry> countryList = getDropDownCountryList();
  TextEditingController userCont = TextEditingController();
  TextEditingController mailCont = TextEditingController();
  TextEditingController numCont = TextEditingController();
  TextEditingController countryCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool? val = false;

  List<IconData> _icons = [Icons.person, Icons.mail, Icons.phone, Icons.lock];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            commonCachedNetworkImage(ec_logo, height: 80, width: 80),
            Container(
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(16),
                boxShadow: defaultBoxShadow(),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Create New \nAccount', style: boldTextStyle(size: 24)),
                  8.height,
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AppTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Name";
                            }
                            return null;
                          },
                          controller: userCont,
                          textFieldType: TextFieldType.NAME,
                          decoration: inputDecoration(icon: _icons[0], hintText: 'Enter UserName'),
                        ),
                        8.height,
                        AppTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Email";
                            }
                            return null;
                          },
                          controller: mailCont,
                          textFieldType: TextFieldType.EMAIL,
                          decoration: inputDecoration(icon: _icons[1], hintText: 'Enter Email'),
                        ),
                        8.height,
                        AppTextField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Number";
                            }
                            return null;
                          },
                          controller: numCont,
                          textFieldType: TextFieldType.PHONE,
                          decoration: inputDecoration(icon: _icons[2], hintText: 'Enter Phone Number'),
                        ),
                        8.height,
                        Container(
                          padding: EdgeInsets.all(ecDefaultPadding1),
                          height: 65,
                          width: 350,
                          decoration: BoxDecoration(
                            color: appStore.isDarkModeOn ? cardDarkColor : white,
                            borderRadius: radius(ecDefaultRadius1),
                            boxShadow: defaultBoxShadow(),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<ECDropDownModelCountry>(
                                hint: Text(
                                  'Select Country',
                                  style: primaryTextStyle(),
                                ),
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
                                            Text(user.country!, style: boldTextStyle()),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ).toList()),
                          ),
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
                          decoration: inputDecoration(icon: _icons[3], hintText: 'Enter Password'),
                        ),
                        8.height,
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: this.val,
                        onChanged: (bool? value) {
                          setState(() {
                            this.val = value;
                          });
                        },
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'By registering you have accepted to use the ',
                          style: boldTextStyle(color: grey),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  ECTerms().launch(context);
                                },
                              text: 'terms',
                              style: boldTextStyle(color: ec_seaBlue),
                            ),
                          ],
                        ),
                      ).expand(),
                    ],
                  ),
                  16.height,
                  AppButton(
                    height: ecButtonHeight.toDouble(),
                    width: context.width(),
                    text: 'Create Account',
                    textColor: ec_seaBlue,
                    color: darkBlue,
                    splashColor: white,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        ECDashboardScreen().launch(context);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Account Created')));
                      }
                    },
                  ),
                ],
              ).paddingSymmetric(vertical: 24, horizontal: 16),
            ).paddingAll(ecDefaultPadding1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('I already have an account. ', style: boldTextStyle()),
                TextButton(
                  onPressed: () {
                    finish(context);
                  },
                  child: Text("Sign In", style: boldTextStyle(color: ec_seaBlue)),
                ),
              ],
            ),
          ],
        ).paddingOnly(top: 16, bottom: 16, right: 8, left: 8),
      ),
    );
  }
}
