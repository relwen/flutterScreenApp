import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ESEditProfileScreen extends StatefulWidget {
  @override
  ESEditProfileScreenState createState() => ESEditProfileScreenState();
}

class ESEditProfileScreenState extends State<ESEditProfileScreen> {
  List<ESModel> data = editProfileList();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
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
        'Edit Profile',
        color: context.cardColor,
        elevation: 4,
        center: true,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              finish(context);
            },
            child: Text('Done', style: boldTextStyle(color: ESPrimaryColor)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              children: [
                Container(
                  decoration: boxDecorationDefault(color: context.cardColor),
                  margin: EdgeInsets.only(top: 70, left: 16, right: 16),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: data.map(
                      (e) {
                        return Column(
                          children: [
                            16.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(e.title!, style: boldTextStyle(color: Colors.grey)),
                                Text(e.subTitle!, style: primaryTextStyle(color: black)),
                              ],
                            ),
                            16.height,
                            Divider(color: grey)
                          ],
                        );
                      },
                    ).toList(),
                  ),
                )
              ],
            ),
            cachedImage(ES_profile, width: 100, height: 100).cornerRadiusWithClipRRect(50),
          ],
        ),
      ),
    );
  }
}
