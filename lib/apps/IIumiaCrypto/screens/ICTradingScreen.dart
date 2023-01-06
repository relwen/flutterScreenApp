import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICTradingList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICActivityScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICTradingScreen extends StatefulWidget {
  @override
  _ICTradingScreenState createState() => _ICTradingScreenState();
}

class _ICTradingScreenState extends State<ICTradingScreen> {
  List<ICTradingList> list = getTradingList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Currencies Trading', style: boldTextStyle(color: white)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.access_time_sharp, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: boxDecorationDefault(color: ic_lightBlue),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Balance', style: secondaryTextStyle(color: ic_whiteColot, size: 10)),
                  8.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(' \$26 421.03', style: boldTextStyle(color: ic_whiteColot, size: 20)),
                      Row(
                        children: [
                          Icon(Icons.arrow_drop_down, color: ic_skip),
                          Text('\$356 (13%)', style: secondaryTextStyle(color: ic_skip)),
                        ],
                      )
                    ],
                  ),
                  8.height,
                  Row(
                    children: [
                      Text('USD 1365,71   ', style: secondaryTextStyle(color: ic_whiteColot, size: 10)),
                      Icon(Icons.trending_down, color: Colors.red),
                    ],
                  )
                ],
              ).paddingAll(16),
            ),
            8.height,
            ListView.separated(
                padding: EdgeInsets.all(16),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  var e = list[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('${e.img}', height: 30),
                          8.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${e.pText}", style: boldTextStyle(color: white)),
                              4.height,
                              Text("${e.secText}", style: secondaryTextStyle(color: ic_secTextColor, size: 10)),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, color: ic_whiteColot, size: 18)
                    ],
                  ).paddingSymmetric(vertical: 8).onTap(() {
                    ICActivityScreen().launch(context);
                  });
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2),
                itemCount: list.length)
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
