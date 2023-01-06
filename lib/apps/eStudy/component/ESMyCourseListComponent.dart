import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESCourseScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class MyCourseListComponent extends StatefulWidget {
  final int index;

  MyCourseListComponent(this.index);

  @override
  MyCourseListComponentState createState() => MyCourseListComponentState();
}

class MyCourseListComponentState extends State<MyCourseListComponent> {
  List<ESModel> list_data = esGetBasicData();

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
    return AlignedGridView.count(
      crossAxisCount: 2,
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      itemCount: list_data.length,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      shrinkWrap: true,
      padding: EdgeInsets.all(12),
      itemBuilder: (BuildContext context, int i) {
        return Container(
          padding: EdgeInsets.all(12.0),
          decoration: boxDecorationWithShadow(borderRadius: radius(8), blurRadius: 0.5, shadowColor: grey.withOpacity(0.5), backgroundColor: context.cardColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              cachedImage(list_data[i].image.validate(), width: 140, height: 100, fit: BoxFit.cover),
              8.height,
              Text(
                list_data[i].title.validate(),
                style: primaryTextStyle(),
              ),
              Text(
                list_data[i].subTitle.validate(),
                style: primaryTextStyle(color: grey),
              ),
              8.height,
              widget.index == 0
                  ? Row(
                      children: [
                        Text('56%', style: secondaryTextStyle(size: 12)).expand(flex: 1),
                        LinearProgressIndicator(
                          backgroundColor: ESPrimaryColor,
                          valueColor: AlwaysStoppedAnimation<Color>(ESPrimaryColor.withOpacity(0.2)),
                          value: 56,
                        ).expand(flex: 2),
                        Icon(Icons.star, color: Colors.orange, size: 16).expand(flex: 1),
                        Text('(4.5)', style: secondaryTextStyle(size: 12)).expand(flex: 1),
                      ],
                    )
                  : AppButton(
                      color: context.cardColor,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      onTap: () {},
                      elevation: 0.5,
                      shapeBorder: RoundedRectangleBorder(borderRadius: radius(8), side: BorderSide(color: ESPrimaryColor)),
                      child: Text('View Certificate', style: secondaryTextStyle(color: ESPrimaryColor)),
                    ),
              8.height,
            ],
          ),
        ).onTap(
          () {
            ESCourseScreen(name: list_data[i].title, img: list_data[i].image).launch(context);
          },
        );
      },
    );
  }
}
