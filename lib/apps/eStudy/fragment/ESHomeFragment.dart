import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCourseScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCoursesViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESDegreeViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESNotificationScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESSearchScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESTopCoursesViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ESHomeFragment extends StatefulWidget {
  @override
  ESHomeFragmentState createState() => ESHomeFragmentState();
}

class ESHomeFragmentState extends State<ESHomeFragment> {
  List<ESModel> list_degree = esGetBasicData();

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

  Widget categoryListWidget() {
    return HorizontalList(
      spacing: 16,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: list_degree.length,
      itemBuilder: (_, i) {
        return Container(
          padding: EdgeInsets.all(8.0),
          decoration: boxDecorationWithRoundedCorners(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            backgroundColor: appStore.isDarkModeOn ? black : white,
          ),
          child: Text(
            list_degree[i].title.validate(),
            style: primaryTextStyle(color: ESSecondaryColor),
          ),
        );
      },
    );
  }

  Widget degreeListWidget() {
    return HorizontalList(
      spacing: 16,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: list_degree.length,
      itemBuilder: (_, i) {
        return Container(
          padding: EdgeInsets.all(16.0),
          decoration: boxDecorationWithShadow(
            borderRadius: radius(8),
            blurRadius: 0.5,
            shadowColor: grey.withOpacity(0.5),
            backgroundColor: appStore.isDarkModeOn ? black : white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cachedImage(list_degree[i].image.validate(), width: 150, height: 100, fit: BoxFit.cover),
              8.height,
              Text(list_degree[i].title.validate(), style: primaryTextStyle()),
              Text(list_degree[i].subTitle.validate(), style: primaryTextStyle(color: grey)),
            ],
          ),
        ).onTap(
          () {
            ESCourseScreen(img: list_degree[i].image, name: list_degree[i].title).launch(context);
          },
          highlightColor: context.cardColor,
        );
      },
    );
  }

  Widget popularCourseListWidget() {
    return HorizontalList(
      spacing: 16,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: list_degree.length,
      itemBuilder: (_, i) {
        return Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              height: 180,
              width: 260,
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: list_degree[i].color!),
            ),
            cachedImage(list_degree[i].image.validate(), width: 250, height: 180, fit: BoxFit.cover).cornerRadiusWithClipRRect(8),
            Container(
              width: 260,
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list_degree[i].title.validate(), style: primaryTextStyle(color: white)),
                  Text(list_degree[i].subTitle.validate(), style: secondaryTextStyle(color: Colors.white)),
                ],
              ).paddingOnly(left: 8, bottom: 8),
            ),
          ],
        ).onTap(
          () {
            ESCourseScreen(img: list_degree[i].image, name: list_degree[i].title).launch(context);
          },
          highlightColor: context.cardColor,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            decoration: BoxDecoration(borderRadius: radius(20), color: grey.withOpacity(0.1)),
            child: Column(
              children: [
                SettingItemWidget(
                  title: 'Hello Emma Philips',
                  titleTextStyle: boldTextStyle(size: 20),
                  subTitle: 'Find a source you want to learn',
                  trailing: IconButton(
                    icon: Icon(MaterialCommunityIcons.bell_outline, size: 24, color: grey),
                    onPressed: () {
                      ESNotificationScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                  ),
                ),
                searchTextField(
                  context: context,
                  onTap: () {
                    ESSearchScreen().launch(context);
                  },
                ).paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Categories', style: primaryTextStyle()).paddingSymmetric(horizontal: 16),
              categoryListWidget(),
              8.height,
              dashboardLabelsAndSeeAll(
                label: "Popular Degree",
                onTap: () {
                  ESDegreeViewAllScreen(list_degree: list_degree).launch(context);
                },
              ).paddingSymmetric(horizontal: 16),
              degreeListWidget(),
              16.height,
              dashboardLabelsAndSeeAll(
                label: "Popular Course",
                onTap: () {
                  ESCoursesViewAllScreen(list_degree: list_degree).launch(context);
                },
              ).paddingSymmetric(horizontal: 16),
              popularCourseListWidget(),
              16.height,
              dashboardLabelsAndSeeAll(
                label: "Top Rated Courses",
                onTap: () {
                  ESTopCoursesViewAllScreen(list_degree: list_degree).launch(context);
                },
              ).paddingSymmetric(horizontal: 16),
              8.height,
              popularCourseListWidget(),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
