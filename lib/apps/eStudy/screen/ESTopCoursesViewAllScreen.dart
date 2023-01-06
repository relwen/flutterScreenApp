import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'ESCourseScreen.dart';

class ESTopCoursesViewAllScreen extends StatefulWidget {
  final List<ESModel>? list_degree;

  ESTopCoursesViewAllScreen({this.list_degree});

  @override
  ESTopCoursesViewAllScreenState createState() => ESTopCoursesViewAllScreenState();
}

class ESTopCoursesViewAllScreenState extends State<ESTopCoursesViewAllScreen> {
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
      appBar: appBarWidget(
        "All Top Courses",
        textSize: 18,
        center: true,
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
        child: Wrap(
          runSpacing: 6,
          spacing: 16,
          children: List.generate(
            widget.list_degree!.length,
            (i) => Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  height: 170,
                  width: context.width() * 0.48 - 17,
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: widget.list_degree![i].color!),
                ),
                cachedImage(widget.list_degree![i].image.validate(), width: context.width() * 0.48 - 17, height: 180, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
                Container(
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
                  width: context.width() * 0.48 - 17,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.list_degree![i].title.validate(), style: primaryTextStyle(color: white)),
                      Text(widget.list_degree![i].subTitle.validate(), style: secondaryTextStyle(color: Colors.white)),
                    ],
                  ).paddingOnly(left: 8, bottom: 8),
                )
              ],
            ).onTap(
              () {
                ESCourseScreen(img: widget.list_degree![i].image, name: widget.list_degree![i].title).launch(context);
              },
            ),
          ),
        ).paddingAll(16),
      ),
    );
  }
}
