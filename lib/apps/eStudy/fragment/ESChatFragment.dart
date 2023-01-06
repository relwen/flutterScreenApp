import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESChatScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ESChatFragment extends StatefulWidget {
  @override
  ESChatFragmentState createState() => ESChatFragmentState();
}

class ESChatFragmentState extends State<ESChatFragment> {
  List<ESModel> list_data = esGetChatList();

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
          preferredSize: Size.fromHeight(110),
          child: Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
            decoration: BoxDecoration(borderRadius: radius(20), color: grey.withOpacity(0.1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Chats', style: boldTextStyle(size: 20)),
                Row(
                  children: [
                    Icon(Icons.search, size: 26, color: grey),
                    8.width,
                    Icon(Icons.mode_edit_outlined, size: 26, color: grey),
                  ],
                )
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: list_data.map(
                  (data) {
                    return SettingItemWidget(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      title: data.title.validate(),
                      subTitle: data.subTitle.validate(),
                      leading: commonCacheImageWidget(data.image.validate(), 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                      trailing: Column(
                        children: [
                          Text('10.00 AM', style: secondaryTextStyle()),
                        ],
                      ),
                      onTap: () {
                        ESChatScreen(img: data.image.validate(), name: data.title.validate()).launch(context);
                      },
                    );
                  },
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
