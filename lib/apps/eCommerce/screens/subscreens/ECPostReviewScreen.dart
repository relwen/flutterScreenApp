import 'package:mighty_ui_kit/apps/eCommerce/components/ECInvoiceBSComponent.dart';
import 'package:mighty_ui_kit/apps/eCommerce/utils/ECConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ECPostReviewScreen extends StatefulWidget {
  const ECPostReviewScreen({Key? key}) : super(key: key);

  @override
  _ECPostReviewScreenState createState() => _ECPostReviewScreenState();
}

class _ECPostReviewScreenState extends State<ECPostReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppButton(
          height: ecButtonHeight.toDouble(),
          color: darkSlateBlue,
          text: 'Click here to post a review about your product',
          textStyle: boldTextStyle(color: white),
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
              context: context,
              builder: (builder) {
                return ECInvoiceBSComponent();
              },
            );
          },
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }
}
