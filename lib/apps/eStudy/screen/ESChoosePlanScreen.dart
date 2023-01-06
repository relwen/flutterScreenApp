import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESPlanModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCheckOutScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESImages.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ChoosePlanScreen extends StatefulWidget {
  @override
  ChoosePlanScreenState createState() => ChoosePlanScreenState();
}

class ChoosePlanScreenState extends State<ChoosePlanScreen> {
  List<PlanModal> subscriptionList = [];
  PageController controller = PageController(viewportFraction: 0.85);
  int _index = 0;

  int currentPosition = 1;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    subscriptionList.add(
      PlanModal(
        title: 'Freelancer',
        currency: '\$',
        price: '5',
        period: 'month',
        icon: Icons.person,
        optionList: [
          PlanModal(title: '1 Agent', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'Envato Integration', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom Domain', isAvailable: false, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isAvailable: false, isImportant: false),
          PlanModal(title: 'Developer Apis', isAvailable: false, isImportant: false),
          PlanModal(title: 'Custom JS & CSS', isAvailable: false, isImportant: false),
          PlanModal(title: 'Custom user Roles', isAvailable: false, isImportant: false),
          PlanModal(title: 'External Purchase', isAvailable: false, isImportant: false),
          PlanModal(title: 'Verification', isAvailable: false, isImportant: false),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: 'StartUp',
        currency: '\$',
        price: '19',
        period: 'month',
        icon: Icons.person,
        optionList: [
          PlanModal(title: 'Up to 5 agent', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'All Integration', isAvailable: true, isImportant: true),
          PlanModal(title: 'Custom Domain', isAvailable: true, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isAvailable: true, isImportant: false),
          PlanModal(title: 'Developer Apis', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom JS & CSS', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom user Roles', isAvailable: false, isImportant: false),
          PlanModal(title: 'External Purchase', isAvailable: false, isImportant: false),
          PlanModal(title: 'Verification', isAvailable: false, isImportant: false),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: 'Business',
        currency: '\$',
        price: '39',
        period: 'month',
        icon: Icons.business,
        optionList: [
          PlanModal(title: 'Up to 10 agent', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'All Integration', isAvailable: true, isImportant: true),
          PlanModal(title: 'Custom Domain', isAvailable: true, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isAvailable: true, isImportant: false),
          PlanModal(title: 'Developer Apis', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom JS & CSS', isAvailable: true, isImportant: false),
          PlanModal(title: 'Custom user Roles', isAvailable: true, isImportant: false),
          PlanModal(title: 'External Purchase', isAvailable: true, isImportant: false),
          PlanModal(title: 'Verification', isAvailable: true, isImportant: false),
        ],
      ),
    );
    subscriptionList.add(
      PlanModal(
        title: 'Enterprise  ',
        currency: '\$',
        price: '149',
        period: 'month',
        icon: Icons.business_center,
        optionList: [
          PlanModal(title: ' 10+ agents', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Tickets', isAvailable: true, isImportant: false),
          PlanModal(title: 'Email Ticketing', isAvailable: true, isImportant: false),
          PlanModal(title: 'Live Chat', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Customers', isAvailable: true, isImportant: false),
          PlanModal(title: 'Unlimited Products', isAvailable: true, isImportant: false),
          PlanModal(title: 'Knowledge Base', isAvailable: true, isImportant: false),
          PlanModal(title: 'Saved Replies', isAvailable: true, isImportant: false),
          PlanModal(title: 'All Integration', isAvailable: true, isImportant: true),
          PlanModal(title: 'Custom Domain', isAvailable: true, isImportant: false),
          PlanModal(title: 'Remove Desky Branding', isImportant: false, isAvailable: true),
          PlanModal(title: 'Developer Apis', isImportant: false, isAvailable: true),
          PlanModal(title: 'Custom JS & CSS', isImportant: false, isAvailable: true),
          PlanModal(title: 'Custom user Roles', isImportant: false, isAvailable: true),
          PlanModal(title: 'External Purchase', isImportant: false, isAvailable: true),
          PlanModal(title: 'Verification', isImportant: false, isAvailable: true),
        ],
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget("Choose your plan", color: context.cardColor),
      body: Container(
        width: context.width(),
        height: context.height(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: context.height() * 0.73,
              margin: EdgeInsets.only(top: 32),
              child: PageView.builder(
                itemCount: subscriptionList.length,
                itemBuilder: (context, i) {
                  PlanModal data = subscriptionList[i];
                  return Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithShadow(borderRadius: BorderRadius.all(Radius.circular(8)), backgroundColor: context.cardColor),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCacheImageWidget(ES_ecSend, 80, width: 100, fit: BoxFit.contain).center(),
                        8.height,
                        Row(
                          children: [
                            Text(data.title.validate(), style: boldTextStyle(size: 26)),
                            Spacer(),
                            Row(
                              children: [
                                Text("${data.currency}${data.price}/", style: boldTextStyle(size: 26)),
                                Text(" Mo", style: primaryTextStyle()),
                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 16),
                        32.height,
                        ...List.generate(
                          data.optionList!.length,
                          (index) {
                            PlanModal sublist = data.optionList![index];
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                              child: Text(sublist.title!, style: primaryTextStyle(size: 16, decoration: !sublist.isAvailable! ? TextDecoration.lineThrough : null), overflow: TextOverflow.ellipsis, maxLines: 2),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                controller: pageController,
                onPageChanged: (int page) {
                  currentPosition = page;
                  setState(() {});
                },
              ),
            ),
            Positioned(
              bottom: 16,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotIndicator(
                    pageController: pageController,
                    indicatorColor: ESSecondaryColor,
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
                  16.height,
                  AppButton(
                    width: context.width() - 50,
                    text: 'Start Now',
                    textStyle: primaryTextStyle(color: white),
                    color: ESPrimaryColor,
                    onTap: () {
                      ESCheckOutScreen().launch(context);
                    },
                  ),
                  16.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
