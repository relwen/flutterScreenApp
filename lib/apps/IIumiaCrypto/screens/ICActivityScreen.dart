import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICCurrenciesList.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICExchangeCandlesticksScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICDataProvider.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ICActivityScreen extends StatefulWidget {
  @override
  _ICActivityScreenState createState() => _ICActivityScreenState();
}

class _ICActivityScreenState extends State<ICActivityScreen> {
  String? dropdownValue = 'BTC/USD';

  List dropdownItems = ['BTC/USD'];
  List axis = ['1D', '1W', '1M', '3M', '6M', '1D', '1Y'];

  List<ICCurrenciesList> priceList = getPriceList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: white),
        backgroundColor: ic_navyBlueColor,
        title: Text('Acticity', style: boldTextStyle(color: white)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20)),
        ],
      ),
      backgroundColor: ic_ScafoldBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(150)),
                    color: ic_navyBlueColor,
                  ),
                ),
                Container(
                  decoration: boxDecorationDefault(color: ic_lightBlue),
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: ic_navyBlueColor,
                        ),
                        child: DropdownButton(
                          elevation: 2,
                          value: dropdownValue,
                          onChanged: (dynamic newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          dropdownColor: ic_ScafoldBgColor,
                          icon:
                              Icon(Icons.arrow_drop_down, color: ic_whiteColot),
                          items: dropdownItems.map((e) {
                            return DropdownMenuItem(
                                child: Text(e,
                                    style: secondaryTextStyle(
                                        color: ic_whiteColot, size: 10)),
                                value: e);
                          }).toList(),
                          underline: SizedBox(),
                        ),
                      ),
                      8.height,
                      Text('\$ 4,781.98',
                          style: TextStyle(color: ic_skip, fontSize: 40)),
                      Row(
                        children: [
                          Text(
                            'GDAX',
                            style: secondaryTextStyle(color: ic_whiteColot),
                          ),
                          16.width,
                          Text('2.39%',
                              style: secondaryTextStyle(color: ic_skip)),
                          4.width,
                          Icon(Icons.trending_up, color: ic_skip)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                activityWidget(
                    priceText: "\$ 4,855.19", textName: "Global Avg."),
                activityWidget(priceText: "\$ 80.7B", textName: "Market Cap"),
                activityWidget(priceText: "\$ 1.46B", textName: "Volume"),
              ],
            ),
            16.height,
            Container(
              height: 200,
              child: Sparkline(
                data: [-1.5, 1.0, 2.5, -1.5, 2, 5, -2.3],
                averageLine: true,
                lineWidth: 2,
                backgroundColor: ic_ScafoldBgColor,
                gridLineLabelPrecision: 3,
                lineGradient:
                    LinearGradient(colors: [ic_skip, Colors.red, ic_skip]),
              ),
            ).paddingSymmetric(horizontal: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: axis.map((e) {
                return Text(
                  '$e',
                  style: secondaryTextStyle(color: ic_whiteColot, size: 10),
                );
              }).toList(),
            ),
            16.height,
            Wrap(
              spacing: 32,
              runSpacing: 16,
              children: List.generate(priceList.length, (index) {
                ICCurrenciesList data = priceList[index];
                return RichText(
                  text: TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: data.pText,
                      style: secondaryTextStyle(color: ic_whiteColot, size: 10),
                    ),
                    TextSpan(
                        text: data.secText,
                        style: boldTextStyle(size: 25, color: white)),
                  ]),
                );
              }),
            ),
            16.height,
            Row(
              children: [
                AppButton(
                  text: 'Sell',
                  textColor: Colors.white,
                  color: Colors.red,
                  onTap: () {
                    //
                  },
                ).expand(),
                16.width,
                AppButton(
                  text: 'Buy',
                  textColor: Colors.white,
                  color: Colors.blue,
                  onTap: () {
                    //
                  },
                ).expand(),
              ],
            ).paddingAll(16)
          ],
        ),
      ),
      bottomNavigationBar: TextButton(
        onPressed: () {
          ICExchangeCandlesticksScreen().launch(context);
        },
        child: Text("Watch Exchange Candlesticks",
            style: TextStyle(color: ic_skip)),
      ),
    );
  }
}
