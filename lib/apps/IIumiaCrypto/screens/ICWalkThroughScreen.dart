import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/models/ICInitialSlider.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICLoginScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICSplashScreen.dart';
import 'package:mighty_ui_kit/apps/IIumiaCrypto/utils/ICColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ICWalkThroughScreen extends StatefulWidget {
  @override
  _ICWalkThroughScreenState createState() => _ICWalkThroughScreenState();
}

class _ICWalkThroughScreenState extends State<ICWalkThroughScreen> {
  PageController pgController = PageController(initialPage: 0);

  List<ICInitialSlider> a = [];

  @override
  void initState() {
    a.add(ICInitialSlider(
        ptitle: 'Management Wallet', color: ic_ScafoldBgColor, stext: 'Store and manage all your digital curriences with ease in the smart wallet interface', img: 'images/iiumiaCrypto/ic_pgv1.png'));
    a.add(ICInitialSlider(
        ptitle: 'Analytics & Statistics',
        color: ic_ScafoldBgColor,
        stext: 'Just sending out a few ads is not going to do it . Not if you want to be a real successss',
        img: 'images/iiumiaCrypto/ic_pgv2.png'));
    a.add(ICInitialSlider(
        ptitle: 'Safe & Security', color: ic_ScafoldBgColor, stext: 'Chenge your cryptocurrency to another Digital assets or flat memory safely , reliably', img: 'images/iiumiaCrypto/ic_pgv3.png'));
    a.add(ICInitialSlider(
        ptitle: 'Keep it organized', color: ic_ScafoldBgColor, stext: 'Buy and sell Bitcoin, other crypto currency with VISA and MasterCard right in the app', img: 'images/iiumiaCrypto/ic_pgv4.png'));

    super.initState();
    /* pgController.addListener(
      () {
        //
      },
    );*/
  }

  @override
  void dispose() {
    pgController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pgController,
            onPageChanged: (no) async {
              if (no == a.length - 1) {
                await 1.seconds.delay;
                ICLoginPage().launch(context);
              }
            },
            children: a.map(
              (e) {
                return Container(
                  color: e.color,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('${e.img}', height: 200, fit: BoxFit.cover),
                      30.height,
                      Text('${e.ptitle}', style: boldTextStyle(color: ic_whiteColot, size: 20), textAlign: TextAlign.center),
                      SizedBox(height: 16),
                      Text('${e.stext}', style: secondaryTextStyle(color: ic_whiteColot), textAlign: TextAlign.center).paddingAll(16)
                    ],
                  ),
                );
              },
            ).toList(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
                onPressed: () {
                  ICLoginPage().launch(context);
                },
                child: Text('Skip', style: boldTextStyle(color: ic_skip))),
          ).paddingOnly(top: 18),
          Positioned(bottom: 50, left: 0, right: 0, child: DotIndicator(pageController: pgController, pages: a))
        ],
      ),
    );
  }
}
