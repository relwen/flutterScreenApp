import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECColors.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECImages.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECShippingInfoScreen extends StatefulWidget {
  const ECShippingInfoScreen({Key? key}) : super(key: key);

  @override
  _ECShippingInfoScreenState createState() => _ECShippingInfoScreenState();
}

class _ECShippingInfoScreenState extends State<ECShippingInfoScreen> {
  // ignore: non_constant_identifier_names
  int current_step = 0;
  List<Step> steps = [
    Step(title: Text('Delivered', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
    Step(title: Text('Delivery failed', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
    Step(title: Text('Delivering', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
    Step(title: Text('Stocked', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
    Step(title: Text('Delivered(#428289539)', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
    Step(title: Text('The goods have been taken', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
    Step(title: Text('Fetching Failed', style: primaryTextStyle()), content: Text('8:00 P.M,June 1,2021'), isActive: false, state: StepState.complete),
  ];

  @override
  void initState() {
    super.initState();
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldDarkColor : white, statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(darkSlateBlue, statusBarIconBrightness: Brightness.light);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
        elevation: 0.0,
        title: Text('Shipping Information', style: boldTextStyle(size: ecTitleSize)),
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? white : black),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: appStore.isDarkModeOn ? cardDarkColor : white,
                  borderRadius: BorderRadius.circular(ecDefaultRadius1),
                  boxShadow: defaultBoxShadow(),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    commonCachedNetworkImage(ec_tech1, height: 50, width: 50, fit: BoxFit.cover),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Shipping Unit', style: boldTextStyle(color: grey)),
                            Text('Copy', style: primaryTextStyle(color: ec_seaBlue)),
                          ],
                        ),
                        Text('Sku: #428289539', style: primaryTextStyle()),
                      ],
                    ).expand(),
                  ],
                ),
              ),
              16.height,
              Container(
                decoration: BoxDecoration(
                  color: appStore.isDarkModeOn ? cardDarkColor : white,
                  borderRadius: BorderRadius.circular(ecDefaultRadius1),
                  boxShadow: defaultBoxShadow(),
                ),
                child: Stepper(
                  physics: NeverScrollableScrollPhysics(),
                  currentStep: this.current_step,
                  steps: steps,
                  type: StepperType.vertical,
                  onStepTapped: (step) {
                    setState(() {
                      current_step = step;
                    });
                  },
                  onStepContinue: () {
                    setState(() {
                      if (current_step < steps.length - 1) {
                        current_step = current_step + 1;
                      } else {
                        current_step = 0;
                      }
                    });
                  },
                  onStepCancel: () {
                    setState(
                      () {
                        if (current_step > 0) {
                          current_step = current_step - 1;
                        } else {
                          current_step = 0;
                        }
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
