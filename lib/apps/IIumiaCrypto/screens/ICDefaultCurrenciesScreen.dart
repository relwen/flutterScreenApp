import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICCurrenciesList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class ICDefaultCurrenciesScreen extends StatefulWidget {
  @override
  _ICDefaultCurrenciesScreenState createState() => _ICDefaultCurrenciesScreenState();
}

class _ICDefaultCurrenciesScreenState extends State<ICDefaultCurrenciesScreen> {
  List<ICCurrenciesList> currencyList = getCurrenciesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Default Currencies', style: boldTextStyle(color: white)),
        actions: [
          IconButton(icon: Icon(Icons.search_outlined, color: ic_whiteColot, size: 20), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20), onPressed: () {}),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: currencyList.map(
            (e) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(child: Image.asset('${e.img}', height: 50, width: 50), borderRadius: radius()),
                          16.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${e.pText}", style: boldTextStyle(color: white)),
                              4.height,
                              Text("${e.secText}", style: secondaryTextStyle(color: ic_secTextColor, size: 8)),
                            ],
                          ),
                        ],
                      ),
                      Visibility(
                        child: Icon(Icons.check, color: Colors.blue),
                        visible: e.hide!,
                      )
                    ],
                  ).paddingSymmetric(horizontal: 8).onTap(
                    () {
                      setState(
                        () {
                          e.hide = (e.hide == false) ? true : false;
                        },
                      );
                    },
                  ),
                  Divider(thickness: 2)
                ],
              );
            },
          ).toList(),
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
