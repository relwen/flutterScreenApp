import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ESFilterScreen extends StatefulWidget {
  @override
  ESFilterScreenState createState() => ESFilterScreenState();
}

class ESFilterScreenState extends State<ESFilterScreen> {
  List<ESModel> subCategoryList = esSubCategoryList();
  List<ESModel> levelList = esLevelList();
  List<ESModel> priceList = esPriceList();
  List<ESModel> featureList = esFeatureList();
  List<ESModel> ratingList = esRatingList();
  List<ESModel> videoDurationList = esVideoDurationList();

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

  Widget subcategoryListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: subCategoryList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ESModel data = subCategoryList[index];
        return SettingItemWidget(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          title: data.title.validate(),
          titleTextStyle: primaryTextStyle(),
          onTap: () {
            data.isCheckList = !data.isCheckList!;
            setState(() {});
          },
          leading: Container(
            padding: EdgeInsets.all(4),
            decoration: boxDecorationDefault(shape: BoxShape.rectangle, color: data.isCheckList! ? ESPrimaryColor : white),
            child: Icon(data.isCheckList! ? Icons.check : null, color: data.isCheckList! ? white : black, size: 20),
          ),
        );
      },
    );
  }

  Widget levelListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: levelList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ESModel data = levelList[index];
        return SettingItemWidget(
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          title: data.title.validate(),
          titleTextStyle: primaryTextStyle(),
          onTap: () {
            data.isCheckList = !data.isCheckList!;
            setState(() {});
          },
          leading: Container(
            padding: EdgeInsets.all(4),
            decoration: boxDecorationDefault(shape: BoxShape.rectangle, color: data.isCheckList! ? ESPrimaryColor : white),
            child: Icon(data.isCheckList! ? Icons.check : null, color: data.isCheckList! ? white : black, size: 20),
          ),
        );
      },
    );
  }

  Widget priceListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: priceList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ESModel data = priceList[index];
        return SettingItemWidget(
          title: data.title.validate(),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          titleTextStyle: primaryTextStyle(),
          onTap: () {
            data.isCheckList = !data.isCheckList!;
            setState(() {});
          },
          leading: Container(
            padding: EdgeInsets.all(4),
            decoration: boxDecorationDefault(shape: BoxShape.rectangle, color: data.isCheckList! ? ESPrimaryColor : white),
            child: Icon(data.isCheckList! ? Icons.check : null, color: data.isCheckList! ? white : black, size: 20),
          ),
        );
      },
    );
  }

  Widget featureListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: featureList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ESModel data = featureList[index];
        return SettingItemWidget(
          title: data.title.validate(),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          titleTextStyle: primaryTextStyle(),
          onTap: () {
            data.isCheckList = !data.isCheckList!;
            setState(() {});
          },
          leading: Container(
            padding: EdgeInsets.all(4),
            decoration: boxDecorationDefault(shape: BoxShape.rectangle, color: data.isCheckList! ? ESPrimaryColor : white),
            child: Icon(data.isCheckList! ? Icons.check : null, color: data.isCheckList! ? white : black, size: 20),
          ),
        );
      },
    );
  }

  Widget ratingListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: ratingList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ESModel data = ratingList[index];
        return SettingItemWidget(
          title: data.title.validate(),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          titleTextStyle: primaryTextStyle(),
          onTap: () {
            data.isCheckList = !data.isCheckList!;
            setState(() {});
          },
          leading: Container(
            padding: EdgeInsets.all(4),
            decoration: boxDecorationDefault(shape: BoxShape.rectangle, color: data.isCheckList! ? ESPrimaryColor : white),
            child: Icon(data.isCheckList! ? Icons.check : null, color: data.isCheckList! ? white : black, size: 20),
          ),
        );
      },
    );
  }

  Widget videoListWidget() {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      itemCount: videoDurationList.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) {
        ESModel data = videoDurationList[index];
        return SettingItemWidget(
          title: data.title.validate(),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          titleTextStyle: primaryTextStyle(),
          onTap: () {
            data.isCheckList = !data.isCheckList!;
            setState(() {});
          },
          leading: Container(
            padding: EdgeInsets.all(4),
            decoration: boxDecorationDefault(shape: BoxShape.rectangle, color: data.isCheckList! ? ESPrimaryColor : white),
            child: Icon(data.isCheckList! ? Icons.check : null, color: data.isCheckList! ? white : black, size: 20),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(
          "Filter",
          color: context.cardColor,
          actions: [
            Text("Clear", style: primaryTextStyle(size: 14)).paddingOnly(right: 16).center(),
          ],
        ),
        bottomNavigationBar: AppButton(
          width: context.width(),
          shapeBorder: RoundedRectangleBorder(borderRadius: radius(8)),
          text: "Apply",
          textStyle: primaryTextStyle(color: white),
          color: ESPrimaryColor,
          onTap: () {
            finish(context);
          },
        ).paddingOnly(left: 24, right: 24, bottom: 24),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Subcategories", style: boldTextStyle(size: 18)),
              subcategoryListWidget(),
              16.height,
              Text("Level", style: boldTextStyle(size: 18)),
              levelListWidget(),
              16.height,
              Text("Price", style: boldTextStyle(size: 18)),
              priceListWidget(),
              16.height,
              Text("Features", style: boldTextStyle(size: 18)),
              featureListWidget(),
              16.height,
              Text("Rating", style: boldTextStyle(size: 18)),
              ratingListWidget(),
              16.height,
              Text("Video Duration", style: boldTextStyle(size: 18)),
              videoListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
