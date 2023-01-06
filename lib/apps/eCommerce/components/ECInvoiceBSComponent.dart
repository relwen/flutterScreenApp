import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECWidget.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ECInvoiceBSComponent extends StatefulWidget {
  @override
  ECInvoiceBSComponentState createState() => ECInvoiceBSComponentState();
}

class ECInvoiceBSComponentState extends State<ECInvoiceBSComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Post Review', style: boldTextStyle(size: 20)),
                16.height,
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: defaultBoxShadow(),
                    backgroundColor:
                        appStore.isDarkModeOn ? cardDarkColor : white,
                  ),
                  child: Row(
                    children: [
                      commonCachedNetworkImage(
                        'https://i.pinimg.com/originals/b5/4c/75/b54c756f8f668fde9c436b0d138c451a.jpg',
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(16),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Invoice #944968', style: boldTextStyle()),
                          4.height,
                          Text('12 September', style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      commonCachedNetworkImage(
                          'https://www.zdnet.com/a/hub/i/r/2014/10/03/c19c05e6-4b26-11e4-b6a0-d4ae52e95e57/resize/270xauto/85da8b7a254e4d0701bef2d866acbfee/qr-code-zdnet.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover)
                    ],
                  ),
                ),
                16.height,
                Text('Your Review', style: boldTextStyle()),
                16.height,
                Container(
                  padding: EdgeInsets.all(ecDefaultPadding1),
                  height: 110,
                  decoration: boxDecorationWithShadow(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: defaultBoxShadow(),
                    backgroundColor:
                        appStore.isDarkModeOn ? cardDarkColor : white,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold),
                          hintText: 'Enter Review Massage',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          reviewActionWidget(icon: Entypo.location_pin),
                          8.width,
                          reviewActionWidget(icon: FontAwesome.video_camera),
                          8.width,
                          reviewActionWidget(icon: Ionicons.image),
                          8.width,
                        ],
                      ),
                    ],
                  ),
                ),
                16.height,
                Text('Give Me Rate?', style: boldTextStyle()),
                16.height,
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
                16.height,
                Text('Tap a star to rate', style: secondaryTextStyle())
                    .center(),
                16.height,
                Container(
                  height: 50,
                  width: context.width(),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: darkBlue,
                      padding: EdgeInsets.all(ecDefaultPadding1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    onPressed: () {},
                    child: Text('Submit Review',
                        style: boldTextStyle(color: white)),
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 16, vertical: 30),
          ),
          Positioned(
            right: 16,
            top: -24,
            child: Container(
              decoration: boxDecorationWithShadow(
                borderRadius: BorderRadius.circular(16),
                boxShadow: defaultBoxShadow(),
                backgroundColor: appStore.isDarkModeOn ? cardDarkColor : white,
              ),
              height: 60,
              width: 60,
              child: Icon(Icons.cancel),
            ).onTap(() {
              finish(context);
            }),
          ),
        ],
      ),
    );
  }
}
