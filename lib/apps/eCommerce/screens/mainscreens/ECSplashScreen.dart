import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECWalkThroughPage.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ECSplashScreen extends StatefulWidget {
  @override
  ECSplashScreenState createState() => ECSplashScreenState();
}

class ECSplashScreenState extends State<ECSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await 2.seconds.delay;

    finish(context);
    ECWalkThroughPage().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: commonCachedNetworkImage(ec_logo, height: 150, width: 150, fit: BoxFit.cover).center(),
    );
  }
}
