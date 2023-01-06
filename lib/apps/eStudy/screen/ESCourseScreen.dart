import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/model/ESOptionModel.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESColors.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESCommon.dart';
import 'package:mighty_ui_kit/apps/eStudy/utils/ESDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'ESChoosePlanScreen.dart';

class ESCourseScreen extends StatefulWidget {
  final String? img;
  final String? name;

  ESCourseScreen({this.img, this.name});

  @override
  ESCourseScreenState createState() => ESCourseScreenState();
}

class ESCourseScreenState extends State<ESCourseScreen> {
  List<ESOptionModel> whatYouGetList = esWhatYouGetList();
  List<String> curriculumData = ['Introduction', 'Getting Started', 'Layers Panel', 'Pen Tool'];
  List<ESModel> instructorData = esProfessorList();
  List<ESModel> studentData = esStudentList();
  List<String> faqData = ['Can i enroll single class?', 'What is fund pocily', 'Is financial aid available?', 'What tool i need?'];
  String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source."
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";
  String? firstHalf;
  String? secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    afterBuildCreated(() {
      setStatusBarColor(Colors.transparent);
      init();
    });
  }

  Future<void> init() async {
    log(instructorData);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    if (description.length > 100) {
      firstHalf = description.substring(0, 100);
      secondHalf = description.substring(100, description.length);
    } else {
      firstHalf = description;
      secondHalf = "";
    }
    return Scaffold(
      appBar: appBarWidget(
        widget.name.validate(),
        color: context.cardColor,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border, color: context.iconColor, size: 24)),
        ],
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          cachedImage(widget.img.validate(), width: context.width(), height: 320, fit: BoxFit.cover),
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: context.width(),
                  margin: EdgeInsets.only(top: 300),
                  padding: EdgeInsets.all(16),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(color: ESSecondaryColor, blurRadius: 15.0, offset: Offset(0.75, 0.0)),
                    ],
                    backgroundColor: context.cardColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name.validate(), style: boldTextStyle(size: 22)),
                      8.height,
                      Row(
                        children: [
                          Text('Offered By: ', style: secondaryTextStyle()),
                          Text('Jorden', style: secondaryTextStyle(color: ESSecondaryColor)).expand(),
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          4.width,
                          Text('4.8', style: secondaryTextStyle()),
                        ],
                      ),
                      16.height,
                      Row(
                        children: [
                          Icon(Icons.check_circle_outline, color: context.iconColor, size: 16),
                          8.width,
                          Text('12 Class', style: primaryTextStyle()),
                          16.width,
                          Icon(Icons.check_circle_outline, color: context.iconColor, size: 16),
                          8.width,
                          Text('40 Hours', style: primaryTextStyle()).expand(),
                          Text('\$120', style: boldTextStyle(size: 20)),
                        ],
                      ),
                      8.height,
                      secondHalf.validate().isEmpty
                          ? Text(firstHalf.validate())
                          : Column(
                              children: <Widget>[
                                createRichText(
                                  list: [
                                    TextSpan(
                                      text: flag ? (firstHalf.validate() + "...") : (firstHalf.validate() + secondHalf.validate()),
                                      style: primaryTextStyle(),
                                    ),
                                    TextSpan(
                                      text: flag ? "show more" : "show less",
                                      style: primaryTextStyle(color: ESSecondaryColor),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          setState(() {
                                            flag = !flag;
                                          });
                                        },
                                    )
                                  ],
                                ),
                              ],
                            ),
                      16.height,
                      Text('What you\'ll get', style: boldTextStyle()),
                      8.height,
                      Column(
                        children: whatYouGetList.map(
                          (data) {
                            return Row(
                              children: [
                                Icon(data.icon, color: context.iconColor, size: 18),
                                16.width,
                                Text(data.title.validate(), style: primaryTextStyle()),
                              ],
                            ).paddingBottom(8);
                          },
                        ).toList(),
                      ),
                      16.height,
                      Text('Curriculum', style: boldTextStyle(size: 18)),
                      16.height,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          curriculumData.length,
                          (index) {
                            int label = index + 1;
                            return Container(
                              margin: EdgeInsets.only(bottom: 8),
                              decoration: boxDecorationWithRoundedCorners(
                                borderRadius: radius(8),
                                backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.grey.shade100,
                              ),
                              child: SettingItemWidget(
                                title: curriculumData[index],
                                titleTextStyle: boldTextStyle(color: ESSecondaryColor),
                                subTitle: '1:48',
                                subTitleTextStyle: secondaryTextStyle(),
                                leading: Text('0' + label.toString(), style: boldTextStyle(size: 20)),
                                trailing: Icon(Icons.play_circle_outline, size: 40, color: ESSecondaryColor),
                              ),
                            );
                          },
                        ),
                      ),
                      8.height,
                      Text('Instructor', style: boldTextStyle(size: 18)),
                      8.height,
                      Column(
                        children: instructorData.map(
                          (e) {
                            return SettingItemWidget(
                              padding: EdgeInsets.symmetric(vertical: 4),
                              title: e.title.validate(),
                              titleTextStyle: boldTextStyle(),
                              subTitle: 'Professor',
                              subTitleTextStyle: secondaryTextStyle(),
                              leading: cachedImage(e.image.validate(), height: 50, width: 50).cornerRadiusWithClipRRect(25),
                              trailing: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.call, size: 16, color: ESSecondaryColor),
                                    onPressed: () {
                                      //
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.mail_outline, size: 16, color: ESSecondaryColor),
                                    onPressed: () {
                                      //
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.chat, size: 16, color: ESSecondaryColor),
                                    onPressed: () {
                                      //
                                    },
                                  ),
                                ],
                              ),
                            ).paddingBottom(8);
                          },
                        ).toList(),
                      ),
                      8.height,
                      Text('FAQ', style: boldTextStyle(size: 20)),
                      Column(
                        children: faqData.map(
                          (data) {
                            return ExpansionTile(
                              tilePadding: EdgeInsets.all(0),
                              title: Text(data.validate(), style: primaryTextStyle()),
                              children: <Widget>[
                                ListTile(
                                  title: Text(
                                    description,
                                    style: secondaryTextStyle(),
                                  ),
                                )
                              ],
                            );
                          },
                        ).toList(),
                      ),
                      16.height,
                      Text('Reviews', style: boldTextStyle(size: 18)),
                      8.height,
                      Row(
                        children: [
                          Text('4.8', style: boldTextStyle()),
                          8.width,
                          Text('Based on 50 Reviews', style: secondaryTextStyle()),
                          Spacer(),
                          RatingBarWidget(
                            onRatingChanged: null,
                            itemCount: 5,
                            rating: 4.8,
                            activeColor: ESPrimaryColor,
                            disable: true,
                          ),
                        ],
                      ),
                      16.height,
                      Text('Student Feedback', style: boldTextStyle(size: 18)),
                      16.height,
                      HorizontalList(
                        itemCount: studentData.length,
                        spacing: 16,
                        itemBuilder: (_, index) {
                          return Container(
                            width: context.width() * 0.7,
                            padding: EdgeInsets.all(8),
                            decoration: boxDecorationRoundedWithShadow(8, blurRadius: 0, backgroundColor: context.cardColor),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    cachedImage(studentData[index].image.validate(), height: 45, width: 45).cornerRadiusWithClipRRect(25),
                                    8.width,
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(studentData[index].title.validate(), style: boldTextStyle()),
                                        Row(
                                          children: [
                                            Text('4.8', style: secondaryTextStyle()),
                                            Icon(Icons.star, color: Colors.orange, size: 16),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                8.height,
                                Text(firstHalf.validate(), style: primaryTextStyle(), maxLines: 5)
                              ],
                            ),
                          );
                        },
                      ),
                      64.height,
                    ],
                  ),
                ),
                Positioned(
                  right: 24,
                  top: 280,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: boxDecorationWithRoundedCorners(backgroundColor: ESPrimaryColor, borderRadius: radius(20)),
                    child: Icon(Icons.play_arrow_outlined, color: white, size: 20),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: AppButton(
              text: 'Start Now',
              textStyle: boldTextStyle(color: white),
              color: ESPrimaryColor,
              onTap: () {
                ChoosePlanScreen().launch(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
