import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/component/ESMyCourseListComponent.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ESCourseFragment extends StatefulWidget {
  @override
  ESCourseFragmentState createState() => ESCourseFragmentState();
}

class ESCourseFragmentState extends State<ESCourseFragment> {
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: ESPrimaryColor.withOpacity(0.5),
                  bottom: TabBar(
                    labelStyle: primaryTextStyle(color: white),
                    indicatorColor: ESPrimaryColor,
                    labelColor: white,
                    unselectedLabelColor: black,
                    tabs: [
                      Tab(text: 'All'),
                      Tab(text: 'On Going'),
                      Tab(text: 'Complete'),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    MyCourseListComponent(0),
                    MyCourseListComponent(0),
                    MyCourseListComponent(1),
                  ],
                ),
              ),
            ).paddingTop(32),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 32),
              decoration:
                  boxDecorationWithShadow(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)), spreadRadius: 5.0, backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Course', style: boldTextStyle(size: 20)),
                  Row(
                    children: [
                      Icon(Icons.search, size: 26, color: grey),
                      8.width,
                      Icon(Icons.filter_alt_outlined, size: 26, color: grey),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
