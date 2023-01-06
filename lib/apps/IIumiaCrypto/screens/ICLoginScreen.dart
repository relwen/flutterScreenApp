import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICVerificationScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICLoginPage extends StatefulWidget {
  @override
  _ICLoginPageState createState() => _ICLoginPageState();
}

class _ICLoginPageState extends State<ICLoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final noController = TextEditingController();

  String? valueChoose = "United States ofAmerica";
  List listItem = ["India", "United States ofAmerica", "Japan", "Australia", "Germany", "Russia"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              32.height,
              Center(child: Image.asset('images/iiumiaCrypto/ic_logo.jpg', fit: BoxFit.cover)),
              16.height,
              Text('Welcome back!', style: boldTextStyle(color: ic_whiteColot, size: 24), textAlign: TextAlign.center).center(),
              16.height,
              Text('Enter Your mobile no to login.', style: secondaryTextStyle(color: ic_whiteColot)).center(),
              16.height,
              Text("National", style: secondaryTextStyle(color: ic_whiteColot)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: ic_navyBlueColor),
                child: DropdownButton(
                  value: valueChoose,
                  onChanged: (dynamic newValue) {
                    valueChoose = newValue;
                    setState(() {});
                  },
                  isExpanded: true,
                  dropdownColor: ic_ScafoldBgColor,
                  icon: Icon(Icons.arrow_drop_down, color: ic_whiteColot),
                  items: listItem.map(
                    (e) {
                      return DropdownMenuItem(
                        child: Text(e, style: TextStyle(color: ic_whiteColot)),
                        value: e,
                      );
                    },
                  ).toList(),
                  hint: Text("United States of America", style: TextStyle(color: ic_whiteColot)),
                  underline: SizedBox(),
                ),
              ),
              16.height,
              Text("Phone No.", style: secondaryTextStyle(color: ic_whiteColot)),
              4.height,
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: ic_navyBlueColor, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: ic_navyBlueColor,
                ),
                child: TextFormField(
                  style: TextStyle(color: ic_whiteColot),
                  controller: noController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Enter No.",
                    hintStyle: TextStyle(color: ic_whiteColot),
                    suffixIcon: Icon(Icons.check, color: ic_skip, size: 16),
                    border: InputBorder.none,
                  ),
                ),
              ),
              16.height,
              Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    child: Icon(Icons.auto_awesome, color: ic_whiteColot),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  16.width,
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ICVerification(noController.text).launch(context);
                        }
                      },
                      child: Text("Send Code", textAlign: TextAlign.center),
                    ),
                  ).expand(),
                ],
              ),
              16.height,
              Text.rich(
                TextSpan(
                  text: "New user?  ",
                  style: boldTextStyle(color: ic_whiteColot),
                  children: <TextSpan>[
                    TextSpan(text: "Get started", style: secondaryTextStyle(color: ic_skip)),
                  ],
                ),
              ).center().onTap(
                () {
                  ICSignUp().launch(context);
                },
              )
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
