import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESSigninScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESConstant.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ESVerifyOTPScreen extends StatefulWidget {
  @override
  ESVerifyOTPScreenState createState() => ESVerifyOTPScreenState();
}

class ESVerifyOTPScreenState extends State<ESVerifyOTPScreen> {
  int _counter = 60;
  Timer? _timer;
  var onTapRecognizer;
  String currentText = "";

  TextEditingController textEditingController = TextEditingController();

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

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
  void initState() {
    super.initState();
    _startTimer();
    init();
  }

  Future<void> init() async {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        finish(context);
      };
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        " ",
        color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 18),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MBVerifyTitleText, style: boldTextStyle(size: 20)),
            8.height,
            Text(MBVerifySubTitleText, style: secondaryTextStyle(size: 16)),
            24.height,
            PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
              length: 4,
              showCursor: false,
              animationType: AnimationType.fade,
              errorTextSpace: 30,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.transparent,
                inactiveFillColor: Colors.transparent,
                inactiveColor: appStore.isDarkModeOn ? appBarBackgroundColor : ESPrimaryColor,
                activeColor: appStore.isDarkModeOn ? appBarBackgroundColor : ESPrimaryColor,
                selectedFillColor: Colors.transparent,
                selectedColor: ESPrimaryColor,
              ),
              animationDuration: Duration(milliseconds: 300),
              textStyle: TextStyle(fontSize: 20, height: 1.6),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: textEditingController,
              keyboardType: TextInputType.number,
              onCompleted: (v) {},
              onChanged: (value) {
                setState(
                  () {
                    currentText = value;
                  },
                );
              },
              beforeTextPaste: (text) {
                return true;
              },
            ),
            Text.rich(
              TextSpan(
                text: "Expired $_counter seconds",
                style: secondaryTextStyle(size: 16, color: ESTextColor),
                children: <TextSpan>[
                  TextSpan(text: "  Resend Code", style: boldTextStyle(color: gray, size: 16)),
                ],
              ),
            ).onTap(
              () {
                _startTimer();
              },
            ),
            40.height,
            AppButton(
              text: "Submit",
              elevation: 12.0,
              textColor: white,
              onTap: () {
                finish(context);
                ESSignInScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
              },
              color: ESPrimaryColor,
              width: context.width(),
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
            )
          ],
        ),
      ),
    );
  }
}
