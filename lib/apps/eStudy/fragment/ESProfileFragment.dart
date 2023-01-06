import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESOptionModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESEditProfileScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ESProfileFragment extends StatefulWidget {
  @override
  ESProfileFragmentState createState() => ESProfileFragmentState();
}

class ESProfileFragmentState extends State<ESProfileFragment> {
  List<ESOptionModel> optionsList = esOptionList();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 50),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: appStore.isDarkModeOn ? context.cardColor : Colors.grey.shade200),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    cachedImage(ES_profile, width: 50, height: 50).cornerRadiusWithClipRRect(25).paddingOnly(top: 6),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Emma Philips', style: boldTextStyle(color: ESSecondaryColor)),
                        4.height,
                        Container(
                          decoration: BoxDecoration(color: ESPrimaryColor, borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.all(4),
                          child: Text('Art Student', style: primaryTextStyle(color: white, size: 14)),
                        )
                      ],
                    ).expand(),
                    IconButton(
                      onPressed: () {
                        ESEditProfileScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                      },
                      icon: Icon(AntDesign.edit),
                    ).paddingOnly(top: 4)
                  ],
                ),
              ),
              16.height,
              Column(
                  children: optionsList.map(
                (e) {
                  return SettingItemWidget(
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: e.color),
                      child: Icon(e.icon, color: white),
                    ),
                    title: e.title!,
                    titleTextStyle: primaryTextStyle(),
                    trailing: Icon(Icons.arrow_forward_ios, color: grey, size: 20),
                  );
                },
              ).toList())
            ],
          ),
        ),
      ),
    );
  }
}
