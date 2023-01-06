import 'package:mighty_ui_kit/apps/eCommerce/models/ECProductModel.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/subscreens/ECCollectionFoodScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECCollectionScreen extends StatefulWidget {
  @override
  _ECCollectionScreenState createState() => _ECCollectionScreenState();
}

class _ECCollectionScreenState extends State<ECCollectionScreen> {
  List<ECProductModel> collectionList = getGridImageData();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        runSpacing: 8,
        spacing: 8,
        alignment: WrapAlignment.center,
        children: collectionList.map(
          (data) {
            return Column(
              children: [
                Container(
                  height: 150,
                  width: context.width() * 0.44,
                  padding: EdgeInsets.all(ecDefaultPadding1),
                  decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 4,
                    runSpacing: 4,
                    children: data.images!.map(
                      (e) {
                        return Image.network(e, height: 65, width: context.width() * 0.19, fit: BoxFit.cover).cornerRadiusWithClipRRect(8);
                      },
                    ).toList(),
                  ),
                ),
                8.height,
                Text(data.name.validate(), style: boldTextStyle())
              ],
            ).onTap(() {
              ECCollectionFoodScreen().launch(context);
            });
          },
        ).toList(),
      ).paddingSymmetric(horizontal: 8, vertical: 16),
    );
  }
}
