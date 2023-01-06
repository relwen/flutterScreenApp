import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICSettingsList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICSettingsScreen extends StatefulWidget {
  @override
  _ICSettingsScreenState createState() => _ICSettingsScreenState();
}

class _ICSettingsScreenState extends State<ICSettingsScreen> {
  List<ICSettingsList> settingsList = getSettingsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        backgroundColor: ic_ScafoldBgColor,
        title: Text('Settings', style: boldTextStyle(color: white)),
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: settingsList.map(
            (e) {
              return SettingItemWidget(
                title: '${e.pText}',
                titleTextStyle: TextStyle(color: white),
                subTitle: '${e.secText}',
                subTitleTextStyle: TextStyle(fontSize: 12, color: white.withOpacity(0.6)),
                leading: Container(decoration: boxDecorationDefault(color: ic_navyBlueColor), padding: EdgeInsets.all(8), child: e.i),
                trailing: Icon(Icons.arrow_forward_ios_outlined, color: ic_whiteColot, size: 16),
                onTap: () {
                  if (e.screen == null) {
                    return ICSettingsScreen();
                  } else {
                    e.screen.launch(context);
                  }
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
