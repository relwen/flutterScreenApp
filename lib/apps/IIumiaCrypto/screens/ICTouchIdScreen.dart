import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICTouchIdScreen extends StatefulWidget {
  @override
  _ICTouchIdScreenState createState() => _ICTouchIdScreenState();
}

class _ICTouchIdScreenState extends State<ICTouchIdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        backgroundColor: ic_ScafoldBgColor,
        title: Text('Settings Touch ID', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.timer, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            64.height,
            Icon(Icons.touch_app_outlined, color: ic_whiteColot, size: 150),
            32.height,
            Text('Configure Touch Id', style: boldTextStyle(size: 24, color: white)),
            Text(
              'Touch ID allows you to conveneitly and it keep your wallet secure ',
              style: secondaryTextStyle(color: ic_secTextColor),
              textAlign: TextAlign.center,
            ),
            24.height,
            AppButton(
              text: 'Enable Touch Id',
              textColor: Colors.white,
              color: ic_skip,
              width: context.width(),
              onTap: () {
                //
              },
            ),
            16.height,
            TextButton(onPressed: () {}, child: Text('Later', style: TextStyle(color: ic_skip)))
          ],
        ).paddingAll(16),
      ),
    );
  }
}
