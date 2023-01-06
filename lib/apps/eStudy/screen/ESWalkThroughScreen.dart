import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESVerifyOTPScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ESWalkThroughScreen extends StatefulWidget {
  const ESWalkThroughScreen({Key? key}) : super(key: key);

  @override
  _ESWalkThroughScreenState createState() => _ESWalkThroughScreenState();
}

class _ESWalkThroughScreenState extends State<ESWalkThroughScreen> {
  int currentPosition = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: context.height(),
                child: PageView.builder(
                  itemCount: esWalkThroughList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(
                          esWalkThroughList[i].image.validate(),
                          context.height() * 0.5,
                          width: context.width(),
                          fit: BoxFit.cover,
                        ),
                        24.height,
                        Text(esWalkThroughList[currentPosition].title.validate(), style: boldTextStyle(size: 20)).paddingOnly(left: 16),
                        Text(esWalkThroughList[currentPosition].subTitle.validate(), style: secondaryTextStyle()).paddingAll(16),
                      ],
                    );
                  },
                  controller: pageController,
                  onPageChanged: (int page) {
                    currentPosition = page;
                    setState(() {});
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotIndicator(
                    pageController: pageController,
                    indicatorColor: ESPrimaryColor,
                    unselectedIndicatorColor: grey.withOpacity(0.2),
                    currentBoxShape: BoxShape.rectangle,
                    boxShape: BoxShape.rectangle,
                    borderRadius: radius(2),
                    currentBorderRadius: radius(3),
                    currentDotSize: 18,
                    currentDotWidth: 6,
                    dotSize: 6,
                    pages: esWalkThroughList,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: boxDecorationDefault(shape: BoxShape.circle, color: ESPrimaryColor),
                        child: Icon(Icons.arrow_forward, color: Colors.white),
                      ).onTap(
                        () {
                          pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
                        },
                      ).visible(currentPosition < 2),
                      AppButton(
                        color: ESPrimaryColor,
                        text: "Get Started",
                        width: context.width() * 0.1,
                        textColor: white,
                        onTap: () {
                          finish(context);
                          ESVerifyOTPScreen().launch(context);
                        },
                      ).visible(currentPosition == 2)
                    ],
                  ),
                ],
              ).paddingOnly(bottom: 40, left: 30, right: 30),
            ],
          ),
        ],
      ),
    );
  }
}
