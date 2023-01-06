import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICSplashScreen extends StatefulWidget {
  @override
  _ICSplashScreenState createState() => _ICSplashScreenState();
}

class _ICSplashScreenState extends State<ICSplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setStatusBarColor(ic_ScafoldBgColor, statusBarIconBrightness: Brightness.light);
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(context, MaterialPageRoute(builder: (context) => ICWalkThroughScreen())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset('images/iiumiaCrypto/ic_logo.jpg')),
          16.height,
          Text('Welcome to', style: boldTextStyle(size: 30, color: white)),
          16.height,
          Text('Ilumina Coin', style: boldTextStyle(color: ic_whiteColot, size: 40)),
          Text(
            'All your crypto transactions in one place! Track coins, add portfolios, buy & sell.',
            style: secondaryTextStyle(color: ic_whiteColot),
            textAlign: TextAlign.center,
          ),
        ],
      ).paddingAll(16),
    );
  }
}
