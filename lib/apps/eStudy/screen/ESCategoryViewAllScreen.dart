import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class ESCategoryViewAllScreen extends StatefulWidget {
  final List<ESModel>? list_degree;

  ESCategoryViewAllScreen({this.list_degree});

  @override
  ESCategoryViewAllScreenState createState() => ESCategoryViewAllScreenState();
}

class ESCategoryViewAllScreenState extends State<ESCategoryViewAllScreen> {
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
        "All Category",
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
      body: Wrap(
        runSpacing: 16,
        spacing: 16,
        children: List.generate(
          widget.list_degree!.length,
          (index) => Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
            child: Text(widget.list_degree![index].title.validate(), style: primaryTextStyle()),
          ),
        ),
      ).paddingAll(16),
    );
  }
}
