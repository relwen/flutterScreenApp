import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCourseScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCoursesViewAllScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ESSearchFragment extends StatefulWidget {
  @override
  ESSearchFragmentState createState() => ESSearchFragmentState();
}

class ESSearchFragmentState extends State<ESSearchFragment> {
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

  Widget addTextField(String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: boxDecorationWithShadow(borderRadius: radius(8)),
      child: AppTextField(
        textFieldType: TextFieldType.OTHER,
        textStyle: secondaryTextStyle(color: black),
        autoFocus: false,
        readOnly: true,
        decoration: InputDecoration(
          fillColor: appStore.isDarkModeOn ? context.cardColor : Colors.grey.shade100,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          filled: true,
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          hintText: label,
          hintStyle: secondaryTextStyle(),
        ),
      ).cornerRadiusWithClipRRect(8),
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
          decoration: boxDecorationWithShadow(borderRadius: radius(8), blurRadius: 0.5, shadowColor: grey.withOpacity(0.5), backgroundColor: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cachedImage(list_degree[i].image.validate(), width: 150, height: 100, fit: BoxFit.cover),
              8.height,
              Text(list_degree[i].title.validate(), style: primaryTextStyle()),
              Text(list_degree[i].subTitle.validate(), style: primaryTextStyle(color: grey)),
            ],
          ),
        ).onTap(() {
          ESCourseScreen(img: list_degree[i].image, name: list_degree[i].subTitle).launch(context);
        }, highlightColor: context.cardColor);
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
              height: 200,
              width: 300,
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: list_degree[i].color!),
            ),
            cachedImage(list_degree[i].image.validate(), width: 280, height: 200, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3), borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8))),
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list_degree[i].title.validate(), style: primaryTextStyle(color: white)),
                  Text(list_degree[i].subTitle.validate(), style: primaryTextStyle(color: Colors.white)),
                ],
              ).paddingOnly(left: 8, bottom: 8),
            ),
          ],
        ).onTap(
          () {
            ESCourseScreen(img: list_degree[i].image, name: list_degree[i].title).launch(context);
          },
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
                  title: 'Explore',
                  titleTextStyle: boldTextStyle(size: 20),
                  subTitle: 'Find a source you want to learn',
                ),
                searchTextField(
                  context: context,
                  onTap: () {
                    //
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
              dashboardLabelsAndWASeeAll('Add Skill').paddingSymmetric(horizontal: 16),
              8.height,
              addTextField('eg. Photoshop , illustrator etc.'),
              16.height,
              dashboardLabelsAndWASeeAll('Add Interest').paddingSymmetric(horizontal: 16),
              8.height,
              addTextField('eg. Graphics, Web Design & Development etc.'),
              16.height,
              dashboardLabelsAndSeeAll(
                label: 'Editor Choice',
                onTap: () {
                  log(list_degree.length);
                  ESCoursesViewAllScreen(list_degree: list_degree).launch(context);
                },
              ).paddingSymmetric(horizontal: 16),
              8.height,
              popularCourseListWidget(),
              16.height,
              dashboardLabelsAndSeeAll(
                label: 'Recommended',
                onTap: () {
                  ESCoursesViewAllScreen(list_degree: list_degree).launch(context);
                },
              ).paddingSymmetric(horizontal: 16),
              8.height,
              degreeListWidget(),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
