import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICMainScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/handyman/utils/HMConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class ICVerification extends StatefulWidget {
  final String mobileNo;

  ICVerification(this.mobileNo);

  @override
  _ICVerificationState createState() => _ICVerificationState();
}

class _ICVerificationState extends State<ICVerification> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _counter = 60;
  Timer? _timer;

  FocusNode? pin1FocusNode;
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;

  @override
  void initState() {
    super.initState();
    _startTimer();
    pin1FocusNode = FocusNode();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  void nextField({required String value, FocusNode? focusNode}) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  void _startTimer() {
    _counter = 60;
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (_timer) {
        setState(() {
          if (_counter > 0) {
            _counter--;
          } else {
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text("Verification", style: boldTextStyle(color: white)),
        elevation: 0,
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Enter your Code', style: TextStyle(color: ic_whiteColot, fontSize: 24, fontWeight: FontWeight.bold)),
              8.height,
              Text(
                'Please type the code we sent to ',
                style: secondaryTextStyle(color: ic_whiteColot),
                textAlign: TextAlign.center,
              ),
              8.height,
              Text(widget.mobileNo, style: TextStyle(color: ic_skip)),
              30.height,
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 60,
                      height: 55,
                      decoration: BoxDecoration(color: ic_navyBlueColor),
                      child: TextFormField(
                        focusNode: pin1FocusNode,
                        style: secondaryTextStyle(size: 20, color: white),
                        textAlign: TextAlign.center,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                        onChanged: (value) {
                          nextField(value: value, focusNode: pin2FocusNode);
                          if (value.isEmpty) pin1FocusNode!.unfocus();
                        },
                      ),
                    ).cornerRadiusWithClipRRect(HMCornerRadius),
                    Container(
                      width: 60,
                      height: 55,
                      decoration: BoxDecoration(color: ic_navyBlueColor),
                      child: TextFormField(
                        focusNode: pin2FocusNode,
                        style: secondaryTextStyle(size: 20, color: white),
                        textAlign: TextAlign.center,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                        onChanged: (value) {
                          nextField(value: value, focusNode: pin3FocusNode);
                          if (value.isEmpty) pin1FocusNode!.requestFocus();
                        },
                      ),
                    ).cornerRadiusWithClipRRect(HMCornerRadius),
                    Container(
                      width: 60,
                      height: 55,
                      decoration: BoxDecoration(color: ic_navyBlueColor),
                      child: TextFormField(
                          focusNode: pin3FocusNode,
                          style: secondaryTextStyle(size: 20, color: white),
                          textAlign: TextAlign.center,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                          onChanged: (value) {
                            nextField(value: value, focusNode: pin4FocusNode);
                            if (value.isEmpty) pin2FocusNode!.requestFocus();
                          }),
                    ).cornerRadiusWithClipRRect(HMCornerRadius),
                    Container(
                      width: 60,
                      height: 55,
                      decoration: BoxDecoration(color: ic_navyBlueColor),
                      child: TextFormField(
                        focusNode: pin4FocusNode,
                        style: secondaryTextStyle(size: 20, color: white),
                        textAlign: TextAlign.center,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(border: InputBorder.none, hintStyle: secondaryTextStyle(size: 16)),
                        onChanged: (value) {
                          pin4FocusNode!.unfocus();
                          if (value.isEmpty) pin3FocusNode!.requestFocus();
                        },
                      ),
                    ).cornerRadiusWithClipRRect(HMCornerRadius),
                  ],
                ).paddingTop(16),
              ),
              16.height,
              Align(
                alignment: Alignment.center,
                child: Text.rich(
                  TextSpan(
                    text: "This season will end in  $_counter seconds.\nDid't get code? ",
                    style: secondaryTextStyle(size: 14, color: ic_whiteColot),
                    children: <TextSpan>[
                      TextSpan(text: "Resend Code", style: boldTextStyle(color: Colors.blue, size: 14, decoration: TextDecoration.underline)),
                    ],
                  ),
                ).onTap(
                  () {
                    _startTimer();
                  },
                ),
              ),
              TextButton(onPressed: () {}, child: Text("Resend Link", style: TextStyle(color: ic_skip))).center(),
              32.height,
              SizedBox(
                height: 45,
                child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ICMainScreen()));
                          }
                        },
                        child: Text('Check Code').center())
                    .center(),
              )
            ],
          ).paddingSymmetric(horizontal: 16, vertical: 32),
        ),
      ),
    );
  }
}
