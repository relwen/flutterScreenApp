import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class XAxis {
  String? head;

  XAxis({this.head});
}

class ICExchangeCandlesticksScreen extends StatefulWidget {
  @override
  _ICExchangeCandlesticksScreenState createState() => _ICExchangeCandlesticksScreenState();
}

class _ICExchangeCandlesticksScreenState extends State<ICExchangeCandlesticksScreen> {
  int selected = 1;

  String? dropdownValue = 'BTC/USD';

  List dropdownItems = ['BTC/USD'];
  List yAxis = ['\$10,00', '\$9,000', '\$8000', '\$7,000', '\$6,000', '\$5,000'];
  List<XAxis> xAxis = [];

  @override
  void initState() {
    xAxis.add(XAxis(head: "1D"));
    xAxis.add(XAxis(head: "5D"));
    xAxis.add(XAxis(head: "1M"));
    xAxis.add(XAxis(head: "1Y"));
    xAxis.add(XAxis(head: "5Y"));
    xAxis.add(XAxis(head: "Max"));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ic_ScafoldBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ic_ScafoldBgColor,
        iconTheme: IconThemeData(color: white),
        title: Text('Exchange Candlesticks', style: boldTextStyle(color: white)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: ic_whiteColot, size: 20),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          16.height,
          Row(
            children: [
              Text("\$6,750.96", style: boldTextStyle(size: 30, color: white)),
              4.width,
              Text("+0.69(1%)", style: secondaryTextStyle(color: ic_skip)),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          30.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 8),
                height: 30,
                decoration: BoxDecoration(borderRadius: radius(8), color: ic_navyBlueColor),
                child: DropdownButton(
                  elevation: 2,
                  value: dropdownValue,
                  onChanged: (dynamic newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  dropdownColor: ic_ScafoldBgColor,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: ic_whiteColot,
                  ),
                  items: dropdownItems.map((e) {
                    return DropdownMenuItem(
                      child: Text(
                        e,
                        style: TextStyle(color: ic_whiteColot, fontSize: 10),
                      ),
                      value: e,
                    );
                  }).toList(),
                  underline: SizedBox(),
                ),
              ),
              16.height,
              Row(
                children: [
                  Text("\$98339.8", style: TextStyle(color: ic_whiteColot, fontSize: 20, fontWeight: FontWeight.bold)),
                  4.width,
                  Text("+3.49%", style: secondaryTextStyle(color: ic_skip)),
                ],
              ),
            ],
          ),
          24.height,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 200,
                  child: Sparkline(
                    data: [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
                    lineWidth: 4,
                    useCubicSmoothing: true,
                    cubicSmoothingFactor: 0.2,
                    backgroundColor: ic_ScafoldBgColor,
                  ),
                ),
                4.width,
                Container(
                  height: 200,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: yAxis.map((e) {
                        return Text('$e', style: secondaryTextStyle(size: 10));
                      }).toList()),
                )
              ],
            ),
          ),
          16.height,
          Wrap(
            spacing: 16,
            children: List.generate(
              xAxis.length,
              (index) {
                XAxis data = xAxis[index];
                bool isSelected = selected == index;
                return Container(
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.all(8),
                  decoration: boxDecorationDefault(color: isSelected ? ic_skip : ic_lightBlue),
                  child: Text('${data.head}', style: secondaryTextStyle(color: ic_whiteColot, size: 10)),
                ).onTap(
                  () {
                    selected = index;
                    setState(() {});
                  },
                );
              },
            ),
          ),
          32.height,
          Row(
            children: [
              AppButton(
                text: 'Sell',
                textStyle: boldTextStyle(color: white),
                color: Colors.red,
                onTap: () {
                  //
                },
              ).expand(),
              16.width,
              AppButton(
                text: 'Buy',
                textStyle: boldTextStyle(color: white),
                color: Colors.blue,
                onTap: () {
                  //
                },
              ).expand(),
            ],
          ),
        ],
      ).paddingAll(16)),
    );
  }
}
