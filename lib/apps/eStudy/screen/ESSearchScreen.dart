import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESFilterScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'ESCoursesDetailScreen.dart';

class ESSearchScreen extends StatefulWidget {
  @override
  ESSearchScreenState createState() => ESSearchScreenState();
}

class ESSearchScreenState extends State<ESSearchScreen> {
  List<ESModel> data = esSearchList();

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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100),
          child: Container(
            height: context.height() * 0.16,
            padding: EdgeInsets.only(top: 20),
            decoration: boxDecorationWithShadow(
              backgroundColor: context.cardColor,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
              //shadowColor: ESSecondaryColor.withOpacity(0.3),
            ),
            child: Row(
              children: [
                8.width,
                IconButton(
                  onPressed: () {
                    finish(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 20),
                ),
                4.width,
                searchTextField(
                  context: context,
                  onTap: () {
                    //
                  },
                ).expand(),
                4.width,
                IconButton(
                  onPressed: () {
                    ESFilterScreen().launch(context);
                  },
                  icon: Icon(LineIcons.horizontal_sliders),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('360 Shows Stories', style: secondaryTextStyle()).paddingOnly(left: 16),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.length,
                padding: EdgeInsets.all(16),
                shrinkWrap: true,
                itemBuilder: (context, i) {
                  return SettingItemWidget(
                    decoration: boxDecorationRoundedWithShadow(8, shadowColor: ESSecondaryColor.withOpacity(0.3), backgroundColor: context.cardColor),
                    title: data[i].title!,
                    subTitle: data[i].subTitle!,
                    onTap: () {
                      ESCoursesDetailScreen(courseName: data[i].title).launch(context);
                    },
                    leading: commonCacheImageWidget(data[i].image!.validate(), 40, width: 40, fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
                    trailing: Row(
                      children: [
                        Icon(Icons.star, size: 16, color: Colors.amber),
                        2.width,
                        Text("4", style: primaryTextStyle(size: 14)),
                      ],
                    ),
                  ).paddingTop(16);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
