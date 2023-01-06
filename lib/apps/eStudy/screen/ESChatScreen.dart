import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESInboxData.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class ESChatScreen extends StatefulWidget {
  final String? img;
  final String? name;

  ESChatScreen({this.img, this.name});

  @override
  ESChatScreenState createState() => ESChatScreenState();
}

class ESChatScreenState extends State<ESChatScreen> {
  ScrollController scrollController = ScrollController();

  TextEditingController messageController = TextEditingController();

  FocusNode msgFocusNode = FocusNode();

  List<ESInboxData> data = esInboxChatDataList();

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
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backwardsCompatibility: true,
        leadingWidth: 24,
        iconTheme: IconThemeData(color: context.iconColor),
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(radius: 20, backgroundImage: NetworkImage(widget.img.validate())),
            8.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.name.validate(), style: boldTextStyle()),
                Text('Online', style: secondaryTextStyle()),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.more_vert, size: 24, color: grey).paddingRight(8),
        ],
        shadowColor: ESSecondaryColor.withOpacity(0.5),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            8.height,
            Text('9:41 AM', style: secondaryTextStyle(size: 16)),
            8.height,
            ListView.builder(
              padding: EdgeInsets.all(16.0),
              controller: scrollController,
              scrollDirection: Axis.vertical,
              reverse: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (data[index].id == 0) {
                  return Column(
                    children: [
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: boxDecorationWithRoundedCorners(
                              backgroundColor: ESPrimaryColor,
                              borderRadius: radius(12.0),
                            ),
                            padding: EdgeInsets.all(12.0),
                            child: Text((data[index].message).validate(), style: primaryTextStyle(color: white)),
                          ),
                          8.width,
                          CircleAvatar(radius: 20, backgroundImage: NetworkImage(widget.img.validate())),
                        ],
                      ),
                    ],
                  );
                } else {
                  return Column(
                    children: [
                      8.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 20, backgroundImage: NetworkImage(widget.img.validate())),
                          8.width,
                          Container(
                            decoration: boxDecorationWithRoundedCorners(
                              borderRadius: radius(12.0),
                              backgroundColor: appStore.isDarkModeOn ? context.cardColor : Colors.grey.shade100,
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: Text((data[index].message).validate(), style: primaryTextStyle()),
                          ).paddingOnly(right: 42.0).expand(),
                        ],
                      ),
                    ],
                  ).paddingOnly(right: 32.0);
                }
              },
            ),
          ],
        ),
      ).paddingTop(8.0),
      bottomNavigationBar: Container(
        padding: MediaQuery.of(context).viewInsets,
        decoration: boxDecorationWithRoundedCorners(
          backgroundColor: context.cardColor,
          borderRadius: radius(0.0),
          border: Border.all(color: appStore.isDarkModeOn ? context.cardColor : Colors.grey.shade100),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Row(
            children: [
              8.width,
              Icon(CupertinoIcons.smiley, size: 22, color: Colors.grey.shade600),
              4.width,
              Icon(Icons.image_outlined, size: 22, color: Colors.grey.shade600),
              4.width,
              Icon(Icons.mic_none, size: 22, color: Colors.grey.shade600),
              8.width,
              AppTextField(
                controller: messageController,
                textFieldType: TextFieldType.OTHER,
                focus: msgFocusNode,
                nextFocus: msgFocusNode,
                autoFocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a reply...',
                  hintStyle: secondaryTextStyle(size: 16),
                ),
              ).expand(),
              Icon(Icons.send_outlined, size: 24, color: ESPrimaryColor).paddingAll(4.0).onTap(
                () {
                  if (messageController.text.isNotEmpty) {
                    addMessage();
                    messageController.clear();
                  }
                },
              ),
              8.width,
            ],
          ),
        ),
      ),
    );
  }

  void addMessage() {
    hideKeyboard(context);
    setState(
      () {
        data.insert(0, ESInboxData(id: 0, message: messageController.text));
        if (mounted) scrollController.animToTop();
        FocusScope.of(context).requestFocus(msgFocusNode);
        setState(() {});
      },
    );
  }
}
