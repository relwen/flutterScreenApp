import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCourseScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ESDegreeViewAllScreen extends StatefulWidget {
  final List<ESModel>? list_degree;

  ESDegreeViewAllScreen({this.list_degree});

  @override
  ESDegreeViewAllScreenState createState() => ESDegreeViewAllScreenState();
}

class ESDegreeViewAllScreenState extends State<ESDegreeViewAllScreen> {
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
    return Scaffold(
      appBar: appBarWidget(
        "All Degree",
        textSize: 18,
        center: true,
        color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        backWidget: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: appStore.isDarkModeOn ? white : black, size: 18),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Wrap(
          runSpacing: 16,
          spacing: 16,
          children: List.generate(
            widget.list_degree!.length,
            (i) => Container(
              padding: EdgeInsets.all(16.0),
              width: context.width() * 0.48 - 17,
              decoration: boxDecorationWithShadow(
                borderRadius: radius(8),
                boxShadow: defaultBoxShadow(),
                blurRadius: 0.5,
                shadowColor: grey.withOpacity(0.5),
                backgroundColor: context.cardColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  cachedImage(widget.list_degree![i].image.validate(), width: 150, height: 100, fit: BoxFit.cover),
                  8.height,
                  Text(widget.list_degree![i].title.validate(), style: primaryTextStyle()),
                  Text(widget.list_degree![i].subTitle.validate(), style: secondaryTextStyle()),
                ],
              ),
            ).onTap(
              () {
                ESCourseScreen(img: widget.list_degree![i].image, name: widget.list_degree![i].title).launch(context);
              },
            ),
          ),
        ).paddingAll(16),
      ),
    );
  }
}
