import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICNetworkList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICNetworkScreen extends StatefulWidget {
  @override
  _ICNetworkScreenState createState() => _ICNetworkScreenState();
}

class _ICNetworkScreenState extends State<ICNetworkScreen> {
  List<ICNetworkList> networkList = getNetworkList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Current Network', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 8),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var e = networkList[index];
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${e.pText}", style: boldTextStyle(color: white)),
                    4.height,
                    Text("${e.secText}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                  ],
                ),
                Visibility(
                  child: Icon(Icons.check, color: Colors.blue),
                  visible: e.hide!,
                )
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 8).onTap(
              () {
                setState(
                  () {
                    e.hide = (e.hide == false) ? true : false;
                  },
                );
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2),
          itemCount: networkList.length),
    );
  }
}
