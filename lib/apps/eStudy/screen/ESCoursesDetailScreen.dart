import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class ESCoursesDetailScreen extends StatefulWidget {
  final String? courseName;

  ESCoursesDetailScreen({this.courseName});

  @override
  ESCoursesDetailScreenState createState() => ESCoursesDetailScreenState();
}

class ESCoursesDetailScreenState extends State<ESCoursesDetailScreen> {
  List<ESModel> courseChapterList = esCourseChapterList();

  int counter = 0;

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: context.height() * 0.25,
              padding: EdgeInsets.only(top: 40),
              decoration: boxDecorationWithShadow(
                backgroundColor: context.cardColor,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12), bottomRight: Radius.circular(12)),
                offset: Offset(1, 5),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      8.width,
                      IconButton(
                        onPressed: () {
                          finish(context);
                        },
                        icon: Icon(Icons.arrow_back_ios, size: 20),
                      ),
                      4.width,
                      Text(widget.courseName!, style: boldTextStyle(size: 18)),
                    ],
                  ),
                  8.height,
                  Row(
                    children: [
                      courseWidget(icon: Icons.person_outline, courseName: "256 Student", iconColor: ESSecondaryColor),
                      16.width,
                      courseWidget(icon: Icons.airplay_rounded, courseName: "40 Lectures", iconColor: ESSecondaryColor).expand(),
                      courseWidget(icon: Icons.star, courseName: "4.5", iconColor: Colors.amber),
                    ],
                  ).paddingSymmetric(horizontal: 16),
                  16.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("\$120", style: boldTextStyle(size: 18)),
                      Row(
                        children: [
                          Text("Offered By:", style: primaryTextStyle()),
                          Text(" Gordon", style: primaryTextStyle(color: ESSecondaryColor)),
                        ],
                      )
                    ],
                  ).paddingSymmetric(horizontal: 16)
                ],
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: courseChapterList.length,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                ESModel data = courseChapterList[i];
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  margin: EdgeInsets.only(top: 8, right: 8, bottom: 8, left: 8),
                  decoration: boxDecorationWithRoundedCorners(
                    backgroundColor: context.cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: counter == i ? ESSecondaryColor : Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      Text(data.image!, style: boldTextStyle(size: 20, color: counter == i ? ESSecondaryColor : context.iconColor)),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title!, style: boldTextStyle(color: counter == i ? ESSecondaryColor : context.iconColor)),
                          8.height,
                          Text(data.subTitle!, style: secondaryTextStyle()),
                        ],
                      ).expand(),
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: boxDecorationWithRoundedCorners(border: Border.all(color: gray), boxShape: BoxShape.circle),
                        child: Icon(Icons.file_download, color: gray, size: 14),
                      )
                    ],
                  ),
                ).onTap(() {
                  setState(
                    () {
                      counter = i;
                    },
                  );
                }, highlightColor: context.cardColor, splashColor: context.cardColor);
              },
            ),
          ],
        ),
      ),
    );
  }
}
