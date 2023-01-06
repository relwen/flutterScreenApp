import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESNotificationScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class ESDashboardTopComponent extends StatefulWidget {
  final String title;

  ESDashboardTopComponent(this.title);

  @override
  ESDashboardTopComponentState createState() => ESDashboardTopComponentState();
}

class ESDashboardTopComponentState extends State<ESDashboardTopComponent> {
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
    return SettingItemWidget(
      title: widget.title,
      titleTextStyle: boldTextStyle(size: 20),
      subTitle: 'Find a source you want to learn',
      trailing: Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(MaterialCommunityIcons.bell_outline, size: 24, color: grey),
          Container(
            height: 8,
            width: 8,
            decoration: boxDecorationWithRoundedCorners(borderRadius: radius(8), boxShape: BoxShape.circle, backgroundColor: Colors.red),
          )
        ],
      ).onTap(
        () {
          ESNotificationScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
        },
      ),
    );
  }
}
