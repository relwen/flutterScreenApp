import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:nb_utils/nb_utils.dart';

class ESNotificationScreen extends StatefulWidget {
  @override
  ESNotificationScreenState createState() => ESNotificationScreenState();
}

class ESNotificationScreenState extends State<ESNotificationScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Notification', color: context.cardColor),
      body: Stack(
        fit: StackFit.expand,
        children: [
          cachedImage(EScat1_art, width: 250, height: 250, fit: BoxFit.fill).center().paddingBottom(16),
          Positioned(
            top: 32,
            left: 16,
            right: 16,
            child: Text('Stay notified about new course, update, score board status and new friends', style: secondaryTextStyle()),
          ),
          Positioned(
            bottom: 32,
            right: 24,
            left: 24,
            child: Column(
              children: [
                AppButton(
                  width: context.width(),
                  onTap: () {},
                  text: 'Allow',
                  textStyle: boldTextStyle(color: white),
                  color: ESPrimaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
