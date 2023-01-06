import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'ESWalkThroughScreen.dart';

class ESSplashScreen extends StatefulWidget {
  const ESSplashScreen({Key? key}) : super(key: key);

  @override
  _ESSplashScreenState createState() => _ESSplashScreenState();
}

class _ESSplashScreenState extends State<ESSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.seconds.delay;
    finish(context);
    ESWalkThroughScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          commonCacheImageWidget(ESApp_logo, 150, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
          16.height,
          Text('EStudy', style: boldTextStyle(size: 24)),
          6.height,
          Text('Learn From Home', style: secondaryTextStyle()),
        ],
      ).center(),
    );
  }
}
